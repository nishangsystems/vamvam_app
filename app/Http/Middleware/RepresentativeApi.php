<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Executive;

class RepresentativeApi
{
	/**
	* Handle an incoming request.
	*
	* @param \Illuminate\Http\Request $request
	* @param \Closure $next
	* @return mixed
	*/
	public function handle($request, Closure $next)
	{
		# fetch The User Id
		$executiveId = $request->header('id');

		# get Request Token
		$authorizationToken = $request->header('authorizationToken');

		if($executiveId == ''){
			return response()->json([
									  'message' => 'Header user id is required.',
									  'code' => '401',
									]);
		}

		if($authorizationToken == ''){
			return response()->json([
									  'message' => 'Token is required.',
									  'code' => '401',
									]);
		}

		# get the user Token
		$apiToken = Executive::where('id', $executiveId)->pluck('api_token')->first();

		# Chek Api Token for vallidation
		if($apiToken == $authorizationToken)
		{
		  return $next($request);
		}

		return response()->json([
								  'message' => 'Unauthenticated User.',
								  'code' => '402',
								]);

	    return $next($request);
	}
}