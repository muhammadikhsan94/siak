<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Master\COA as Model;
use DataTables;

class CoaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    protected $basepath = 'master.coa';

    public function index()
    {
        $d['basepath'] = $this->basepath;
        $d['judul'] = "Master COA";

        return view($this->basepath.'.index', $d);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function data(Request $request)
    {
        verify_ajax_request($request);
        $data = Model::getList();

        return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('action', function ($data) {
                return '
                    <button type="button" class="btn btn-xs btn-primary btn-edit" data-url="'.route($this->basepath.'.show', $data->id_coa).'" data-id="'.$data->id_coa.'" title="Ubah"><i class="fas fa-edit"></i></button> 
                    
                    <button type="button" class="btn btn-xs btn-danger btn-destroy" data-url="'.route($this->basepath.'.destroy', $data->id_coa).'" data-id="'.$data->id_coa.'" title="Hapus"><i class="fa fa-trash"></i></button>
                ';
            })
            ->rawColumns(['action'])
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
        if(empty($request->id_coa)) {
            $id = UUID();
            $coa = new Model;
            $coa->id_coa = $id;
        } else {
            $coa = Model::findOrFail($request->id_coa);
        }
        $coa->no_coa = $request->no_coa;
        $coa->nm_coa = $request->nm_coa;
        $coa->id_coa_sub = $request->id_coa_sub ?? null;
        $coa->save();
        
        return 'success';
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
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
        return 'Data Tidak Ditemukan!';
    }
}
