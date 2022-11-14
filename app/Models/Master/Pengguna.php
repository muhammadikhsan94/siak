<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Pengguna extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'pengguna';
    protected $primaryKey = 'id_pengguna';
    public $incrementing = false;

    public static function getList($id = '')
    {
        if(empty($id)) {
            $data = \DB::SELECT("
                SELECT
                    pengguna.*,
                    role.id_role_pengguna,
                    role.id_peran,
                    peran.nm_peran
                FROM pengguna
                JOIN role_pengguna AS role ON role.id_pengguna=pengguna.id_pengguna
                JOIN peran ON peran.id_peran=role.id_peran
                WHERE pengguna.deleted_at IS NULL
                ORDER BY pengguna.nm_pengguna
            ");
        } else {
            $data = \DB::SELECT("
                SELECT
                    pengguna.*,
                    role.id_role_pengguna,
                    role.id_peran,
                    peran.nm_peran
                FROM pengguna
                JOIN role_pengguna AS role ON role.id_pengguna=pengguna.id_pengguna
                JOIN peran ON peran.id_peran=role.id_peran
                WHERE pengguna.deleted_at IS NULL AND pengguna.id_pengguna='".$id."'
                ORDER BY pengguna.nm_pengguna
            ");
        }

        return $data;
    }

    public function role()
    {
        return $this->belongsTo('\App\Models\Master\RolePengguna','id_pengguna','id_pengguna');
    }

    public function coa_transaction()
    {
        return $this->belongsTo('\App\Models\Akuntansi','id_pengguna','id_pengguna');
    }
}
