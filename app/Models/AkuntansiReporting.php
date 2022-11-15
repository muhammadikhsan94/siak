<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AkuntansiReporting extends Model
{
    protected $table = 'coa_reporting';
    protected $primaryKey = 'id_coa_reporting';
    public $incrementing = false;

    public function transaction()
    {
        return $this->belongsTo('\App\Models\Akuntansi','id_coa_reporting','id_coa_reporting');
    }

    public static function getList($id_pengguna='')
    {
        if(empty($id_pengguna)) {
            return \DB::SELECT("
                SELECT
                    report.*,
                    pelapor.nm_pengguna AS nm_pelapor,
                    pengguna.nm_pengguna AS nm_verifikator,
                    transaction.total
                FROM coa_reporting AS report
                JOIN pengguna AS pelapor ON pelapor.id_pengguna=report.id_pengguna
                LEFT JOIN pengguna ON pengguna.id_pengguna=report.id_verifikator
                LEFT JOIN (
                    SELECT id_coa_reporting, SUM(total) AS total
                    FROM coa_transaction
                    GROUP BY id_coa_reporting
                ) AS transaction ON transaction.id_coa_reporting=report.id_coa_reporting
                WHERE report.deleted_at IS NULL
                ORDER BY report.tgl_create DESC
            ");
        } else {
            return \DB::SELECT("
                SELECT
                    report.*,
                    pelapor.nm_pengguna AS nm_pelapor,
                    pengguna.nm_pengguna AS nm_verifikator,
                    transaction.total
                FROM coa_reporting AS report
                JOIN pengguna AS pelapor ON pelapor.id_pengguna=report.id_pengguna
                LEFT JOIN pengguna ON pengguna.id_pengguna=report.id_verifikator
                LEFT JOIN (
                    SELECT id_coa_reporting, SUM(total) AS total
                    FROM coa_transaction
                    GROUP BY id_coa_reporting
                ) AS transaction ON transaction.id_coa_reporting=report.id_coa_reporting
                WHERE report.id_pengguna='".$id_pengguna."' AND report.deleted_at IS NULL
                ORDER BY report.tgl_create DESC
            ");
        }
    }
}
