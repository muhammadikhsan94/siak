<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\Master\Peran as Model;
use Illuminate\Http\Request;
use DataTables;

class PeranController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    protected $basepath = 'master.peran';

    public function index()
    {
        $d['basepath'] = $this->basepath;
        $d['judul'] = "Master Peran";

        return view($this->basepath.'.index', $d);
    }

    public function data(Request $request)
    {
        verify_ajax_request($request);
        $data = Model::getList();

        return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('action', function ($data) {
                return '
                    <button type="button" class="btn btn-xs btn-primary btn-edit" data-url="'.route($this->basepath.'.show', $data->id_peran).'" data-id="'.$data->id_peran.'" title="Ubah"><i class="fas fa-edit"></i></button> 
                    
                    <button type="button" class="btn btn-xs btn-danger btn-destroy" data-url="'.route($this->basepath.'.destroy', $data->id_peran).'" title="Hapus"><i class="fa fa-trash"></i></button>
                ';
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(empty($request->id_peran)) {
            $peran = new Model;
        } else {
            $peran = Model::findOrFail($request->id_peran);
        }
        $peran->nm_peran = $request->nm_peran;
        $peran->id_updater = UUID();
        $peran->save();
        
        return 'success';
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Master\Peran  $peran
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Model::findOrFail($id);

        return response()->json($data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Master\Peran  $peran
     * @return \Illuminate\Http\Response
     */
    public function edit(Peran $peran)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Master\Peran  $peran
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Peran $peran)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Master\Peran  $peran
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Model::findOrFail($id);
        if($data && $data->delete()) {
            return 'success';
        }
        return 'Data Tidak Ditemukan!';
    }
}
