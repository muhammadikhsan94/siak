<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ReportPengguna;

class PrintController extends Controller
{

    protected $basepath = 'print';
    
    public function pengguna($id)
    {
        $reporting = \App\Models\AkuntansiReporting::where('id_coa_reporting', $id)->first();
        $data = \DB::SELECT("
            SELECT id_coa, nm_coa
            FROM coa
            WHERE id_coa_sub IS NULL AND deleted_at IS NULL
            ORDER BY created_at
        ");
        $total = 0;
        foreach($data AS $item) {
            $temp = \DB::SELECT("
                SELECT transaction.*, coa.no_coa, coa.nm_coa
                FROM coa_transaction AS transaction
                JOIN coa ON coa.id_coa=transaction.id_coa
                WHERE transaction.id_coa_reporting='".$id."' AND coa.id_coa_sub='".$item->id_coa."'
                ORDER BY coa.created_at
            ");
            $item->report= $temp;
            $total += array_sum(array_column($item->report, 'total'));
        }

        $d['data'] = $data;
        $d['total'] = $total;
        
        return Excel::download(new ReportPengguna($d), 'Report Pengguna.xlsx');

        // return view($this->basepath.'.pengguna', $d);
    }

}
