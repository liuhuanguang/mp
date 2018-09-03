<?php

namespace App\Admin\Controllers;

use App\Models\Video;
use App\Models\Music;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Show;
class VideoController extends Controller
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
            $content->description('视频列表');

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
            $content->description('视频列表');

            $content->body(Admin::show(Video::findOrFail($id), function (Show $show) {
                $show->id( 'ID');
                $show->brand_id('公司品牌名');
                $show->video_name('视频名');
                $show->video_file('视频')->as(function ($video_file) {
                    return "<video style='width: 656px;' src=/$video_file controls='controls'></video>";
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
            $content->description('视频列表');

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
            $content->description('视频列表');

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
        return Admin::grid(Video::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->column('brand.brand_name','公司品牌名');
            $grid->video_name('视频名');
            $grid->is_show('是否显示')->switch();
            $grid->created_at('创建时间');
            $grid->updated_at('修改时间');
            $grid->filter(function($filter){
                // 去掉默认的id过滤器
                $filter->disableIdFilter();
                // 在这里添加字段过滤器
                $filter->like('video_name', '视频名');
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
        return Admin::form(Video::class, function (Form $form) {
            $form->display('id', 'ID');
            $form->select('brand_id','公司品牌名')->options(Music::selectBrand());
            $form->text('video_name','视频名')->rules('required');
            $form->file('video_file','视频上传')->uniqueName()->move('public/upload/video/')->removable()->rules('required');
            $form->switch('is_show', '是否显示')->rules('required')->default(1);
            $form->display('created_at', '创建时间');
            $form->display('updated_at', '修改时间');
        });
    }
}
