<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $d['judul'] = 'Dashboard';

        $role = \App\Models\Master\RolePengguna::where('id_pengguna', auth()->user()->id_pengguna)->where('id_peran', 1)->first();
        if(is_null($role)) {
            $d['t_laporan'] = \App\Models\AkuntansiReporting::where('a_submit', 2)->where('id_pengguna', auth()->user()->id_pengguna)->count();
            $coa = \App\Models\AkuntansiReporting::where('a_submit', 2)->where('id_pengguna', auth()->user()->id_pengguna)->pluck('id_coa_reporting');
            $d['t_terlapor'] = \App\Models\Akuntansi::whereIn('id_coa_reporting', $coa)->sum('total');
        } else {
            $d['t_koperasi'] = \App\Models\Master\RolePengguna::where('id_peran', 3)->whereNull('deleted_at')->count();
            $coa = \App\Models\AkuntansiReporting::where('a_submit', 2)->pluck('id_coa_reporting');
            $d['t_terlapor'] = \App\Models\Akuntansi::whereIn('id_coa_reporting', $coa)->sum('total');
        }
        $d['role'] = $role;

        return view('index', $d);
    }

    public function t_koperasi()
    {
        $data = \App\Models\Master\RolePengguna::where('id_peran', 3)->whereNull('deleted_at')->count();

        return response()->json($data);
    }

    public function t_terlapor()
    {
        $coa = \App\Models\AkuntansiReporting::where('a_submit', 2)->pluck('id_coa_reporting');
        $data = \App\Models\Akuntansi::whereIn('id_coa_reporting', $coa)->sum('total');

        return response()->json($data);
    }
}
