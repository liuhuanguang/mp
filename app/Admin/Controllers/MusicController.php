<?php

namespace App\Admin\Controllers;

use App\Models\Music;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Show;
use Illuminate\Http\Request;
class MusicController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('品牌管理');
            $content->description('音乐列表');
            $content->body($this->grid());
        });
    }
    /**
     * Show interface.
     *
     * @param $id
     * @return Content
     */
    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('品牌管理');
            $content->description('音乐列表');

            $content->body(Admin::show(Music::findOrFail($id), function (Show $show) {
                $show->id( 'ID');
                $show->brand_id('公司品牌名');
                $show->music_name('音乐名');
                $show->music_file('音乐路径')->as(function ($music_file) {
                    return "<audio src=/$music_file controls='controls'></audio>";
                });
                $show->is_show('是否显示');
                $show->created_at( '创建时间');
                $show->updated_at( '修改时间');
            }));
        });
    }
    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('品牌管理');
            $content->description('音乐列表');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('品牌管理');
            $content->description('音乐列表');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Music::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->column('brand.brand_name','公司品牌名');
            $grid->music_name('音乐名');
            $grid->is_show('是否显示')->switch();
            $grid->created_at('创建时间');
            $grid->updated_at('修改时间');
            $grid->filter(function($filter){
                // 去掉默认的id过滤器
                $filter->disableIdFilter();
                // 在这里添加字段过滤器
                $filter->like('music_name', '音乐名');
                $filter->like('brand_id', '公司品牌名')->select(Music::selectBrand());
            });
        });
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Music::class, function (Form $form) {
            $form->display('id', 'ID');
            $form->select('brand_id','公司品牌名')->options(Music::selectBrand())->rules('required');
            $form->text('music_name','音乐名')->rules('required');
            $form->file('music_file','音乐音频')->uniqueName()->move('public/upload/music/')->removable()->rules('required');
            $form->switch('is_show', '是否显示')->rules('required')->default(1);
            $form->display('created_at', '创建时间');
            $form->display('updated_at', '修改时间');
        });
    }
}
