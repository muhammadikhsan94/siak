<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Peran extends Model
{
    protected $table = 'peran';
    protected $primaryKey = 'id_peran';
    public $incrementing = true;

    public static function getList()
    {
        return self::select('*')->orderby('id_peran')->get();
    }
}
