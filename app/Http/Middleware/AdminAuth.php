<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AdminAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $data = \App\Models\Master\RolePengguna::where('id_pengguna', auth()->user()->id_pengguna)->whereIn('id_peran', [1,2])->first();
        if(is_null($data)) {
            return redirect()->to('/');
        }
        return $next($request);
    }
}
