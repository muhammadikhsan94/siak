<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\Master\Pengguna as Model;
use Illuminate\Http\Request;
use DataTables;

class PenggunaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    protected $basepath = 'master.pengguna';

    public function index()
    {
        $d['basepath'] = $this->basepath;
        $d['judul'] = "Master Pengguna";

        return view($this->basepath.'.index', $d);
    }

    public function data(Request $request)
    {
        verify_ajax_request($request);
        $data = Model::getList();

        return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('status', function($data) {
                return ($data->deleted_at==null) ? 'Aktif' : 'Tidak Aktif';
            })
            ->addColumn('action', function ($data) {
                return '
                    <button type="button" class="btn btn-xs btn-primary btn-edit" data-url="'.route($this->basepath.'.show', $data->id_pengguna).'" data-id="'.$data->id_pengguna.'" title="Ubah"><i class="fas fa-edit"></i></button> 
                    
                    <button type="button" class="btn btn-xs btn-danger btn-destroy" data-url="'.route($this->basepath.'.destroy', $data->id_pengguna).'" data-id="'.$data->id_pengguna.'" title="Hapus"><i class="fa fa-trash"></i></button>
                ';
            })
            ->rawColumns(['action','status'])
            ->make(true);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(empty($request->id_pengguna)) {
            $id = UUID();
            $pengguna = new Model;
            $pengguna->id_pengguna = $id;
            $role = new \App\Models\Master\RolePengguna;
            $role->id_role_pengguna = UUID();
            $role->id_pengguna = $id;
        } else {
            $pengguna = Model::findOrFail($request->id_pengguna);
            $role = \App\Models\Master\RolePengguna::where('id_pengguna', $request->id_pengguna)->first();
        }
        $pengguna->username = strtolower($request->username);
        $pengguna->password = bcrypt(strtolower($request->username));
        $pengguna->nm_pengguna = $request->nm_pengguna;
        $pengguna->jk = $request->jk;
        $pengguna->alamat = $request->alamat;
        $pengguna->no_hp = $request->no_hp;
        $pengguna->save();

        $role->id_peran = $request->id_peran;
        $role->a_aktif = 1;
        $role->save();
        
        return 'success';
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Master\Pengguna  $pengguna
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Model::getList($id);

        return response()->json($data[0]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Master\Pengguna  $pengguna
     * @return \Illuminate\Http\Response
     */
    public function edit(Pengguna $pengguna)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Master\Pengguna  $pengguna
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pengguna $pengguna)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Master\Pengguna  $pengguna
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Model::findOrFail($id);
        if($data) {
            $data->deleted_at = currDateTime();
            $data->save();
            $role = \App\Models\Master\RolePengguna::where('id_pengguna',$id)->update(['deleted_at'=>currDateTime()]);

            return 'success';
        }
        return 'Data Tidak Ditemukan!';
    }
}
