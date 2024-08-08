<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\ParentM;

class ParentApi
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
		# fetch The Leader Id
		$leaderId = $request->header('id');

		# get Request Token
		$authorizationToken = $request->header('authorizationToken');

		if($leaderId == ''){
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
		$apiToken = ParentM::where('id', $leaderId)->pluck('api_token')->first();

		# Chek Api Token for vallidation
		if($apiToken == $authorizationToken)
		//if(1 == 1)
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