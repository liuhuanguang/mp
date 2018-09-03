<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $table = 'video';

    //public $timestamps = false;

    public function brand()
    {
        return $this->hasOne('App\Models\Brand','id','brand_id');
    }

}
