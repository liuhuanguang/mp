<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/8/31
 * Time: 13:18
 */

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use Iwanli\Wxxcx\Wxxcx;
use Illuminate\Support\Facades\DB;

class PassportController extends Controller
{

    public $successStatus = 200;

    /**
     * login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login()
    {
        if (Auth::attempt(['email' => request()->post('email'), 'password' => request()->post('password')])) {
            $user = Auth::user();
            $success['token'] = $user->createToken('MyApp')->accessToken;
            return response()->json(['success' => $success], $this->successStatus);
        } else {
            return response()->json(['error' => 'Unauthorised'], 401);
        }
    }

    /**
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request,Wxxcx $wxxcx, User $user)
    {

        //code 在小程序端使用 wx.login 获取
        $code = request()->post('code');
        //encryptedData 和 iv 在小程序端使用 wx.getUserInfo 获取
        $encryptedData = request()->post('encryptedData');
        $iv = request()->post('iv');

        //根据 code 获取用户 session_key 等信息, 返回用户openid 和 session_key
        $userInfo = $wxxcx->getLoginInfo($code);

        //获取解密后的用户信息
        $user_wx = $wxxcx->getUserInfo($encryptedData, $iv);

        $user_wx = json_decode($user_wx,true);
        $data = [
            'name'=>$user_wx['nickName'],
            'nickname'=>$user_wx['nickName'],
            'avatar'=>$user_wx['avatarUrl'],
            'openid'=>$user_wx['openId']
        ];
        $validator = Validator::make($data, [
            'name' => 'required',
            'openid' =>'required',
            'avatar' =>'required',
            'nickname' =>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }
        $num = range(0,20);//利用range()函数产生一个0到10的数组
        shuffle($num);//利用shuffle()函数将产生的$num数组随机打乱顺序
        $str = '';
        for ($i=0; $i < 20; $i++) {//选取数组前5个，即随机
            $str .= $num[$i];
        }

        $data['password'] = bcrypt($str);
        $data['email'] = '9234144056@qq.com';
        //判断用户信息是否存在，存在就登录，不存在就注册
        $info = DB::table('users')->where(['openid'=>$user_wx['openId']])->first();
        if($info){
            //$users = User::where(['openid'=>$user_wx['openId']])->update($data);
            //更新用户信息
            $success['password'] = $info->p;
            $success['email'] = $data['email'];
            if (Auth::attempt($success)) {
                $user = Auth::user();
                $data2['token'] = $user->createToken('MyApp')->accessToken;
                return response()->json(['success' => $data2], $this->successStatus);
            } else {
                return response()->json(['error' => '服务器错误，请稍后重试！'], 401);
            }
        }else{
            $data['p'] = $str;
            $users = User::create($data);
            $success['login'] = 1;
            $success2['token'] = $users->createToken('MyApp')->accessToken;
            return response()->json(['success' => $success2], $this->successStatus);
        }

    }

    /**
     * details api
     *
     * @return \Illuminate\Http\Response
     */
    public function getDetails()
    {
        $user = Auth::user();
        return response()->json(['success' => $user], $this->successStatus);
    }
}