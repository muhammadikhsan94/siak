<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Akuntansi extends Model
{
    protected $table = 'coa_transaction';
    protected $primaryKey = 'id_coa_transaction';

    public function coa()
    {
        return $this->belongsTo('\App\Models\Master\COA', 'id_coa', 'id_coa');
    }
}
