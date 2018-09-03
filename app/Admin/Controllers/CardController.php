<?php

namespace App\Admin\Controllers;

use App\Models\Card;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class CardController extends Controller
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

            $content->header('名片管理');
            $content->description('名片列表');

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

            $content->header('名片管理');
            $content->description('名片列表');

            $content->body(Admin::show(Card::findOrFail($id), function (Show $show) {
                  $show->panel()
                    ->tools(function ($tools) {
                        $tools->disableDelete();
                    });;
                   $show->id( 'ID');
                   $show->user_id('会员id');
                   $show->name('姓名');
                   $show->position('职位/职称');
                   $show->brand_id('公司品牌');
                   $show->mobile('手机号码');
                   $show->wechat_number('微信号');
                   $show->wechat_number('微信号');
                   $show->address('联系地址');
                   $show->visit('浏览量');
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
            $content->header('名片管理');
            $content->description('名片列表');

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
            $content->header('名片管理');
            $content->description('名片列表');

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
        return Admin::grid(Card::class, function (Grid $grid) {
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                if ($actions->getKey() == 1) {
                    $actions->disableDelete();
                }
            });
            $grid->id('ID')->sortable();
            $grid->user_id('用户id');
            $grid->name('姓名');
            $grid->mobile('手机号');
            $grid->wechat_number('微信号');
            $grid->visit('浏览量');
            $grid->sort('排序');
            $grid->is_show('是否显示')->switch();
//            $grid->is_show('是否显示')->display(function ($released) {
//                return $released ? '是' : '否';
//            });
            $grid->created_at('创建时间');
            $grid->updated_at('修改时间');
            $grid->filter(function($filter){
                // 去掉默认的id过滤器
                $filter->disableIdFilter();

                // 在这里添加字段过滤器
                $filter->like('name', '姓名');
                $filter->like('mobile', '手机号码');
                $filter->between('created_at', '创建时间')->datetime();
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
        return Admin::form(Card::class, function (Form $form) {
            $form->display('id', 'ID');
            $form->display('user_id', '会员id');
            $form->display('name', '姓名');
            $form->display('position', '职位/职称');
            $form->display('brand_id', '公司品牌');
            $form->display('brand_id', '公司品牌');
            $form->display('mobile','手机号码');
            $form->display('wechat_number', '微信号');
            $form->display('wechat_number', '微信号');
            $form->textarea('address','联系地址')->rows(10);
            $form->number('sort', '排序')->min(0);
            $form->text('visit','浏览量');
            $form->switch('is_show', '是否显示')->rules('required')->default(1);
            $form->display('created_at', '创建时间');
            $form->display('updated_at', '修改时间');
        });
    }
}
