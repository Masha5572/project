<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ShopController extends Controller
{
    public function blog()
    {
        return view('shop/blog');
    }
}
