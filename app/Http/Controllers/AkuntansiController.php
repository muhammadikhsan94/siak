<?php

namespace App\Http\Controllers;

use App\Models\AkuntansiReporting as Model;
use Illuminate\Http\Request;
use DataTables;

class AkuntansiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    protected $basepath = 'akuntansi';

    public function index()
    {
        $d['basepath'] = $this->basepath;
        $d['judul'] = 'Akuntansi';

        return view($this->basepath.'.index', $d);
    }

    public function data(Request $request)
    {
        verify_ajax_request($request);
        
        if(!is_null(\App\Models\Master\RolePengguna::where('id_pengguna', auth()->user()->id_pengguna)->where('id_peran', 1)->first())) {
            $data = Model::getList();
        } else {
            $data = Model::getList(auth()->user()->id_pengguna);
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->editColumn('total', function($data) {
                return number_to_currency($data->total, 'Rp. ');
            })
            ->editColumn('tgl_create', function($data) {
                return TglWaktuIndonesia($data->tgl_create);
            })
            ->editColumn('tgl_submit', function($data) {
                return TglWaktuIndonesia($data->tgl_submit) ?? '-';
            })
            ->editColumn('nm_verifikator', function($data) {
                if(is_null($data->nm_verifikator)) {
                    return '-';
                } else {
                    return $data->nm_verifikator . ' ['.TglWaktuIndonesia($data->tgl_verifikator).']';
                }
            })
            ->addColumn('a_submit', function($data) {
                if($data->a_submit==0) {
                    return '<span class="badge bg-danger">Data Belum Lengkap</span>';
                } else if ($data->a_submit==1) {
                    return '<span class="badge bg-warning">Menunggu Verifikator</span>';
                } else {
                    return '<span class="badge bg-success">Sukses</span>';
                }
            })
            ->addColumn('action', function($data) {
                $button = '<div class="btn-group" role="group" aria-label="Basic example">';
                if(!is_null(\App\Models\Master\RolePengguna::where('id_pengguna', auth()->user()->id_pengguna)->where('id_peran', 1)->first()) AND is_null($data->id_verifikator)) {
                    $button = $button . '<button type="button" class="btn btn-sm btn-success btn-verifikasi text-light" data-url="'.route($this->basepath.'.verify', $data->id_coa_reporting).'" title="Verifikasi"><i class="fa fa-check"></i></button>';
                }
                $button = $button . '
                    <button type="button" class="btn btn-sm btn-primary btn-add" data-url="'.route($this->basepath.'.create', $data->id_coa_reporting).'" data-id="'.$data->id_coa_reporting.'" title="Isi Data"><i class="fas fa-edit"></i></button> 
                ';
                if($data->a_submit==0) {
                    $button = $button . '<button type="button" class="btn btn-sm btn-danger btn-destroy" data-url="'.route($this->basepath.'.destroy', $data->id_coa_reporting).'" title="Hapus"><i class="fa fa-trash"></i></button>';
                } else {
                    $button = $button . '<button type="button" class="btn btn-sm btn-primary btn-print" data-url="'.route('print.pengguna', $data->id_coa_reporting).'" title="Cetak"><i class="fas fa-print"></i></button>';
                }
                $button = $button . '</div>';
                
                return $button;
            })
            ->rawColumns(['a_submit','action'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        $d['id'] = $id;
        $d['basepath'] = $this->basepath;
        $d['judul'] = 'Tambah Reporting';
        
        $temp = \App\Models\Akuntansi::where('id_coa_reporting', $id)->whereIn('id_coa', \App\Models\Master\COA::whereNotNull('id_coa_sub')->whereNull('deleted_at')->pluck('id_coa'))->count();
        if($temp == \App\Models\Master\COA::whereNotNull('id_coa_sub')->whereNull('deleted_at')->count()) {
            $d['all'] = 1;
        } else {
            $d['all'] = 0;
        }

        return view($this->basepath.'.create', $d);
    }

    public function create_id($id, $id_coa_header)
    {
        $d['id'] = $id;
        $d['id_coa_header'] = $id_coa_header;
        $d['basepath'] = $this->basepath;
        $d['judul'] = 'Tambah Reporting';
        $d['data'] = \App\Models\Master\COA::where('id_coa_sub', $id_coa_header)->orderBy('created_at', 'asc')->get();
        $d['akun'] = \App\Models\Master\COA::where('id_coa', $id_coa_header)->first();
        
        $temp = \App\Models\Akuntansi::where('id_coa_reporting', $id)->whereIn('id_coa', \App\Models\Master\COA::whereNotNull('id_coa_sub')->whereNull('deleted_at')->pluck('id_coa'))->count();
        if($temp == \App\Models\Master\COA::whereNotNull('id_coa_sub')->whereNull('deleted_at')->count()) {
            $d['all'] = 1;
        } else {
            $d['all'] = 0;
        }

        return view($this->basepath.'.create', $d);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(empty($request->id_coa_reporting)) {
            $id = UUID();
            $data = new Model;
            $data->id_coa_reporting = $id;
        } else {
            $data = Model::findOrFail($request->id_coa_reporting);
        }
        $data->id_pengguna = auth()->user()->id_pengguna;
        $data->tgl_create = currDateTime();
        $data->a_submit = 0;
        $data->save();

        return 'success';
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Akuntansi  $akuntansi
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id, $id_coa_sub)
    {   
        foreach($request->all() AS $index=>$value) {
            $data = \App\Models\Akuntansi::where('id_coa_reporting', $id)->where('id_coa', $index)->first();

            if(is_null($data)) {
                $id_transaction = UUID();
                $data = new \App\Models\Akuntansi;
                $data->id_coa_transaction = $id_transaction;
            }

            $data->id_coa = $index;
            $data->total = preg_replace("/[^0-9]/", "", $value);
            $data->id_pengguna = auth()->user()->id_pengguna;
            $data->id_coa_reporting = $id;
            $data->id_updater = auth()->user()->id_pengguna;
            $data->save();
        }

        return 'success';
    }

    public function kunci(Request $request, $id)
    {
        $data = Model::findOrFail($id);
        
        if($data) {
            $data->a_submit = 1;
            $data->tgl_submit = currDateTime();
            $data->id_updater = auth()->user()->id_pengguna;
            $data->save();

            return 'success';
        }

        return 'Gagal Kunci Data!';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Akuntansi  $akuntansi
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Model::findOrFail($id);
        if($data) {
            $data->deleted_at = currDateTime();
            $data->save();

            return 'success';
        }
        return 'Data tidak ditemukan!';
    }

    public function verify(Request $request, $id)
    {
        $data = Model::findOrFail($id);
        $data->a_submit = 2;
        $data->id_verifikator = auth()->user()->id_pengguna;
        $data->tgl_verifikator = currDateTime();
        $data->save();

        return 'success';
    }
}
