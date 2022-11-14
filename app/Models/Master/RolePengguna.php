<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RolePengguna extends Model
{
    protected $table = 'role_pengguna';
    protected $primaryKey = 'id_role_pengguna';

    public function peran()
    {
        return $this->belongsTo('\App\Models\Master\Peran','id_peran','id_peran');
    }
}
