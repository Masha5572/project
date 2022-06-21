<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[Controllers\ProductController::class,'shopIndex'])
->name('shop/index');

Route::get('/girls', [Controllers\ProductController::class, 'shopList'])
->name('shop/girls');

Route::get('/main',function (){
    return view('shop/index');
})->name('shop/main');


Route::get('/answer', function(){
return view('shop/answer');
})->name('shop/answer');

//Route::get('/profile', [Controllers\ProductController::class,'profile'])
//->name('')->middleware('auth');

Route::get('/pay', [Controllers\ProductController::class,'checkout'])
    ->name('shop/pay')->middleware('auth');

Route::get('/registration', function(){
    return view('auth.register');
})->name('/registration');


Route::post('/make-order',[Controllers\ProductController::class,'makeOrder'])
    ->name('shop/make-order')->middleware('auth');

Route::get('shop/{slug}',[Controllers\ProductController::class,'shopCategori'])->name('shop/categori');

Route::get('/clear', [Controllers\ProductController::class, 'clear'])->name('shop/clear');

Route::get('/account', [Controllers\ProductController::class,'profile'])->name('shop/account');

Route::get('/cart',[Controllers\ProductController::class,'cart'])
    ->name('shop/cart');

Route::get('/blog', [\App\Http\Controllers\ShopController::class, 'blog'])
->name('shop/blog');

Route::get('/search',[Controllers\ProductController::class,'shopSearch'])
    ->name('shop/search');

Route::get('/main',[Controllers\ProductController::class,'shopIndex'])
    ->name('shop/main');

Route::get('/product-details',[Controllers\ProductController::class,'productDetails'])
 ->name('shop/product-details');

Route::get('shop/guys',[\App\Http\Controllers\ProductmenController::class,'shopMen'])
->name('shop/guys');



Route::get('/dashboard', function () {
return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';


Route::group(['prefix' => 'admin'], function () {
Voyager::routes();
});
