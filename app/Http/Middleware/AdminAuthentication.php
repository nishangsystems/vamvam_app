<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Session\Store;
use Illuminate\Support\Facades\Auth;

class AdminAuthentication
{
    protected $session;
    protected $timeout = 600000; 

    public function __construct(Store $session){
        $this->session = $session;
    }
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::guard('admin')->check()) {
            $response = $next($request);
            $response->header('Cache-Control', 'no-cache, must-revalidate');
            return $response;
        }else{
            Auth::guard('admin')->logout();
            return redirect('admin');
        }
    }
}
