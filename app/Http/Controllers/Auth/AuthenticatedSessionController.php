<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use MongoDB\Driver\Session;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
//    public function profile()
//    {
//        $sessionId = \Illuminate\Support\Facades\Session::getId();
//        \Cart::session($sessionId);
//        $cart = \Cart::getContent();
//        $sum = \Cart::getTotal('price');
//        return view('shop.profile ',[
//            'cart'=>$cart,
//            'sum'=>$sum,
//        ])->with('flashMessage','You need to  login or registration at first ');
//    }
    public function create()
    {
        $sessionId = \Illuminate\Support\Facades\Session::getId();
        \Cart::session($sessionId);
        $cart = \Cart::getContent();
        $sum = \Cart::getTotal('price');
        return view('auth.login ',[
            'cart'=>$cart,
            'sum'=>$sum,
        ])->with('flashMessage','Сначала вам необходимо войти в систему или зарегистрироваться');
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {
        $request->authenticate();

        $request->session()->regenerate();

        return redirect()->intended(RouteServiceProvider::HOME);
    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
