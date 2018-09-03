<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//
//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

$api = app('Dingo\Api\Routing\Router');
$api->version('v1',function ($api) {
    $api->post('login', 'App\Http\Controllers\api\PassportController@login');
    $api->post('register', 'App\Http\Controllers\api\PassportController@register');
    $api->group(['middleware' => 'auth:api,throttle:5,10'], function($api){
        $api->group(['middleware' => 'auth:api,throttle:5,10'], function($api){
            $api->post('details', 'App\Http\Controllers\api\PassportController@getDetails');
        });
    });
});

//Route::post('user', 'api\PassportController@register');
//Route::post('login', 'api\PassportController@login');
//Route::post('register', 'api\PassportController@register');
//
//Route::group(['middleware' => 'auth:api'], function(){
//    Route::post('get-details', 'api\PassportController@getDetails');
//});

