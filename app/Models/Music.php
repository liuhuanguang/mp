<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Music extends Model
{
    protected $table = 'music';

    public static function selectBrand()
    {
        $brand = DB::table('brand')->select('id', 'brand_name as text')->get();
        $brand_list = [];
        foreach ($brand as $val) {

            $brand_list[$val->id] = $val->text;

        }
        return $brand_list;

    }

    public function brand()
    {
        return $this->hasOne('App\Models\Brand','id','brand_id');
    }

}
