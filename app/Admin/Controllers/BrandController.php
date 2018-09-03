<?php

namespace App\Admin\Controllers;

use App\Models\Brand;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Show;
use Encore\Admin\Form\Field;
class BrandController extends Controller
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
            $content->description('品牌列表');

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

            $content->header('详情');
            $content->description('品牌列表');

            $content->body(Admin::show(Brand::findOrFail($id), function (Show $show) {
                $show->id( 'ID');
                $show->brand_name('公司品牌名');
                $show->brand_description('公司简单描述');
                $show->brand_logo('品牌logo')->image();
                $show->brand_desc('企业信息');
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
            $content->description('品牌列表');

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
            $content->description('品牌列表');

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
        return Admin::grid(Brand::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->brand_name('公司品牌名');
            $grid->column('brand_logo','公司logo')->display(function ($brand_logo) {
                return "<img style='width: 95px;' src=/$brand_logo>";
            });;
            $grid->is_show('是否显示')->switch();
            $grid->created_at('创建时间');
            $grid->updated_at('修改时间');
            $grid->filter(function($filter){
                // 去掉默认的id过滤器
                $filter->disableIdFilter();
                // 在这里添加字段过滤器
                $filter->like('brand_name', '公司品牌名');
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
        return Admin::form(Brand::class, function (Form $form) {
            $form->display('id', 'ID');
            $form->select('brand_id','公司品牌名')->options(Music::selectBrand())->rules('required');
            $form->text('video_name','视频名')->rules('required');
            if(empty(request()->route()->parameters())){
                $form->file('video_file','视频上传')->uniqueName()->move('public/upload/video/')->removable()->rules('required');
            }else{
                $form->display('video_file','视频')->with(function($video_file){
                    return "<audio src=/$videos_file controls='controls'></audio>";
                });
            }
            $form->switch('is_show', '是否显示')->rules('required')->default(1);
            $form->display('created_at', '创建时间');
            $form->display('updated_at', '修改时间');
        });
    }
}
