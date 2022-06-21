<?php

namespace App\Http\Controllers;

use App\Productman;

use Illuminate\Http\Request;

class ProductmenController extends Controller
{
    public function shopMen()
    {
        $products = Productman::all();

        return view('shop/Boy',[
            'products'=> $products,
        ]);
    }
}
