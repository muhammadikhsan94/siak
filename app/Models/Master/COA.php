<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class COA extends Model
{
    protected $table = 'coa';
    protected $primaryKey = 'id_coa';
    public $incrementing = false;

    public static function getList($filter = '')
    {
        if(empty($filter)) {
            $data = \DB::SELECT("
                SELECT
                    coa.*,
                    sub.no_coa AS no_coa_sub,
                    sub.nm_coa AS nm_coa_sub,
                    sub.id_coa_sub AS id_coa_sub_heading
                FROM coa
                LEFT JOIN coa AS sub ON sub.id_coa=coa.id_coa_sub
                WHERE coa.deleted_at IS NULL
                ORDER BY coa.no_coa
            ");
        } else {
            $data = \DB::SELECT("
                SELECT
                    coa.*,
                    sub.no_coa AS no_coa_sub,
                    sub.nm_coa AS nm_coa_sub,
                    sub.id_coa_sub AS id_coa_sub_heading
                FROM coa
                LEFT JOIN coa AS sub ON sub.id_coa=coa.id_coa_sub
                WHERE coa.deleted_at IS NULL AND coa.id_coa='".$filter."'
                ORDER BY coa.no_coa
            ");
        }

        return $data;
    }

    public function sub_coa()
    {
        return $this->belongsTo('\App\Models\Master\COA','id_coa','id_coa_sub');
    }
}
