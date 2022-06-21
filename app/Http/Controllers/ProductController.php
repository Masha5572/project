<?php

namespace App\Http\Controllers;

use App\Mail\OrderIn;
use App\Mail\OrderOut;
use App\Models\Order;
use App\Models\User;
use App\Product;
use Darryldecode\Cart\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class ProductController extends Controller
{
    public function shopList()
    {
        $seesionId = Session::getId();

        \Cart::session($seesionId);

        $cart = \Cart::getContent();

        $products = Product::all();

        $sum = \Cart::getTotal('price');

        return view('shop/women', [
            'products' => $products,
            'cart' => $cart,
            'sum' => $sum,
        ]);
    }

    public function shopIndex()
    {

        $randProducts = Product::query()->inRandomOrder()->limit(4)->get();

        $seesionId = Session::getId();

        \Cart::session($seesionId);

        $cart = \Cart::getContent();

        $sum = \Cart::getTotal('price');

        return view('shop.index', [
            'randProducts' => $randProducts,
            'cart' => $cart,
            'sum' => $sum,
        ]);


    }


    public function productDetails(Request $request)
    {
        $product = Product::query()->where(['id' => $request->id])->get();

        return view('shop/product-details', ['product' => $product]);

    }

    public function cart(Request $request)
    {

        $product = Product::query()->where(['id' => $request->id])->first();

        $seesionId = Session::getId();

        \Cart::session($seesionId)->add([
            'id' => $product->id,
            'name' => $product->name,
            'price' => $product->price,
            'quantity' => $request->qty ?? 1,
            'attributes' => [
                'img' => $product->img,
            ],
        ]);
        $cart = \Cart::getContent();

        return redirect()->back();
    }

    public function clear(Request $request)
    {
        $seesionId = Session::getId();

        \Cart::session($seesionId)->remove($request->id);

        return redirect()->back();

    }

    public function profile()
    {
        $seesionId = Session::getId();

        \Cart::session($seesionId);

        $cart = \Cart::getContent();

        $products = Product::all();

        $sum = \Cart::getTotal('price');

        return view('shop/account', [

            'cart' => $cart,
            'sum' => $sum,
        ]);
    }

    public function checkout()
    {
        $user = Auth::user();

        $seesionId = Session::getId();

        \Cart::session($seesionId);


        $cart = \Cart::getContent();

        $sum = \Cart::getTotal('price');

        $messageSuccessOrder = \session('successOrder');


        $orders = Order::query()->where(['user_id' => $user->getAuthIdentifier()])
            ->orderBy('id', 'desc')
            ->get();

        $orders->transform(function ($order) {
            $order->cart_data = unserialize($order->cart_data);

            return $order;
        });


        if (!empty($messageSuccessOrder)) {
            return view('shop/pay', [
                'cart' => $cart,
                'sum' => $sum,
                'user' => $user,
                'orders' => $orders,
            ])->with('messageSuccessOrder', $messageSuccessOrder);
        }
        return view('shop/pay', [
            'cart' => $cart,
            'sum' => $sum,
            'user' => $user,
            'orders' => $orders,
        ])->with('messageSuccessOrder', $messageSuccessOrder);
    }

    public function makeOrder(Request $request)
    {

        $user = Auth::user();

        $seesionId = Session::getId();

        \Cart::session($seesionId);


        $cart = \Cart::getContent();

        $sum = \Cart::getTotal('price');

        $order = new Order();

        $order->user_id = $user->id;

        $order->cart_data = $order->setCartDataAttribute($cart);

        $order->total_sum = $sum;

        $order->address = $request->address . '' . $request->city;

        $order->phone = $request->phone;

        if ($order->save()) {

            Mail::to('masha04101@mail.ru')->send(new OrderIn([
                'cart' => $cart,
                'sum' => $sum,
                'user' => $user
            ]));

            Mail::to($request->user())->send(new OrderOut([
                'cart' => $cart,
                'sum' => $sum,
                'user' => $user,
            ]));

            \Cart::clear();

            Session::flash('successOrder', 'Ваш заказ был успешно создан!');

            return back();
        }
        Session::flash('errorOrder', 'Что-то пошло не так!');

        return back();
//        $order->save();


    }
    public function shopCategori($slug)
    {
        $seesionId = Session::getId();
        \Cart::session($seesionId);
        $products = Product::where('categori_id', $slug)->get();
        $cart = \Cart::getContent();
        $sum = \Cart::getTotal('price');

        return view('shop/women', [
            'products' => $products,
            'cart'=>$cart,
            'sum'=>$sum,
        ]);

    }
    public function shopSearch(Request $request)
    {
        $seesionId = Session::getId();
        \Cart::session($seesionId);
        $cart = \Cart::getContent();
        $sum = \Cart::getTotal('price');

        $s = $request->s;
        $products = Product::where('name', 'LIKE', "%{$s}%")->orderBy('name')->paginate(10);

        return view('shop/women', compact('products', 'cart', 'sum'));
    }
}
