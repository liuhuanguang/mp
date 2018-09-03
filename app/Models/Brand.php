<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $table = 'brand';

    //public $timestamps = false;
    public function setBrandImgAttribute($brand_img)
    {
        if (is_array($brand_img)) {
            $this->attributes['brand_img'] = json_encode($brand_img);
        }
    }

    public function getBrandImgAttribute($brand_img)
    {
        return json_decode($brand_img, true);
    }

}
