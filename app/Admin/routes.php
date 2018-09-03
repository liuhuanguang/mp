<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('cardlist', CardController::class); //卡片管理
    $router->resource('brandlist', BrandController::class); //品牌列表
    $router->resource('musiclist', MusicController::class); //音乐列表
    $router->resource('videolist', VideoController::class); //视频列表
    $router->get('/users', 'UserController@index'); //会员管理
    $router->get('/meal', 'UserMealController@index');  //套餐管理
    $router->get('/meal_log', 'UserMealLogController@index');//套餐开通记录
    $router->get('/visitor ', 'VisitorController@index');//名片访问记录
    $router->get('/fabulous ', 'FabulousController@index');//点赞记录
    $router->get('/collection ', 'CollectionController@index');//名片收藏记录
    $router->get('/complaint ', 'ComplaintController@index');//投诉建议
});
