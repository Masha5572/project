<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

		<!-- all css here -->
        <link rel="stylesheet" href="../../../public/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../../public/css/animate.css">
        <link rel="stylesheet" href="../../../public/css/simple-line-icons.css">
        <link rel="stylesheet" href="../../../public/css/themify-icons.css">
        <link rel="stylesheet" href="../../../public/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../../../public/css/jquery-ui.css">
        <link rel="stylesheet" href="../../../public/css/meanmenu.min.css">
        <link rel="stylesheet" href="../../../public/css/detalis.css">
        <link rel="stylesheet" href="../../../public/css/responsive.css">
        <script src="../../../public/js/modernizr-2.8.3.min.js"></script>
        @livewireStyles
    </head>
    <body style="font-family: Roboto,serif">
        <header class="header-area">
            <div class="header-top theme-bg">
            </div>
            <div class="header-bottom transparent-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-5">
                            <div class="logo pt-39">
                                <a href="index.html"><img alt="" src="assets/img/logo/logo.png"></a>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-7 d-none d-lg-block">
                            <div class="main-menu text-center">
                                <h1 class="display-1 text-center">Zarfool</h1>
                                <nav class="navbar  navbar-expand-lg navbar-light bg-light">
                                    <div class="container-fluid">
                                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                            <span class="navbar-toggler-icon"></span>
                                        </button>
                                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                            <ul class="navbar-nav w-100 justify-content-center">
                                                <li class="nav-item">
                                                    <a class="nav-link active" aria-current="page" href="{{route('shop/main')}}">Home</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" aria-current="page" href="{{route('shop/blog')}}">Блог</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" aria-current="page" href="{{route('shop/answer')}}">Вопросы и ответы</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" aria-current="page" href="{{route('shop/girls')}}">Магазин</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" aria-current="page" href="{{route('shop/guys')}}">Men</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="shop-area pt-95 pb-100">
            <div class="container">
                <div class="row">
                    @foreach($product as $item)
                    <div class="col-lg-6 col-md-6">
                        <div class="product-details-img">
                            <img class="w-100" id="zoompro" src="../../../public/storage/{{$item->img}}" data-zoom-image="assets/img/product-details/bl1.jpg" alt="zoom"/>
                            <div id="gallery" class="mt-12 product-dec-slider owl-carousel">
                                <a data-image="assets/img/product-details/l1.jpg" data-zoom-image="assets/img/product-details/bl1.jpg">
                                    <img src="assets/img/product-details/s1.jpg" alt="">
                                </a>
                                <a data-image="assets/img/product-details/l2.jpg" data-zoom-image="assets/img/product-details/bl2.jpg">
                                    <img src="assets/img/product-details/s2.jpg" alt="">
                                </a>
                                <a data-image="assets/img/product-details/l3.jpg" data-zoom-image="assets/img/product-details/bl3.jpg">
                                    <img src="assets/img/product-details/s3.jpg" alt="">
                                </a>
                                <a data-image="assets/img/product-details/l4.jpg" data-zoom-image="assets/img/product-details/bl4.jpg">
                                    <img src="assets/img/product-details/s4.jpg" alt="">
                                </a>
                                <a data-image="assets/img/product-details/l3.jpg" data-zoom-image="assets/img/product-details/bl3.jpg">
                                    <img src="assets/img/product-details/s3.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product-details-content">
                            <h2>{{$item->name}}</h2>
                            <div class="product-price">
                                <h4>Цена:{{$item->price}}</h4>
                            </div>
                            <div class="product-details-style shorting-style mt-15">
                                <label>Цвет:{{$item->Color}}</label>
                            </div>
                            <div class="quality-wrapper mt-15 product-quantity">
                                <label>Размер:</label>
                            </div>
                            <button type="button" class="btn btn-outline-dark btn-rounded" data-mdb-ripple-color="dark">XS</button>
                            <button type="button" class="btn btn-outline-dark btn-rounded" data-mdb-ripple-color="dark">S</button>
                            <button type="button" class="btn btn-outline-dark btn-rounded" data-mdb-ripple-color="dark">M</button>
                            <button type="button" class="btn btn-outline-dark btn-rounded" data-mdb-ripple-color="dark">L</button>

                            <div class="quality-wrapper mt-15 product-quantity">

                               <p class=""><i style="font-size: 2em" class="bi bi-info-lg"></i>ДОБАВЬТЕ ВЕЩЬ В КОРЗИНУ, ЧТОБЫ ОФОРМИТЬ ДОСТАВКУ ИЛИ ЗАБЕРИТЕ ИЗ МАГАЗИНА</p>

                            </div>

                            <div class="product-list-action">
                                <div class="product-list-action-left">
                                    <a class="" href="#" title="Корзина">
                                        <i class="ion-bag"></i>
                                        В корзину
                                    </a>
                                </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="description-review-area my-4 pb-100">
            <div class="container">
                    <div class="description-review-topbar nav text-center">
                      <h2>Описание</h2>
                    </div>

                        <div id="des-details1" class="tab-pane active">
                            <div class="product-description-wrapper">
                                <p>{{$item->description}}}</p>
                            </div>
                        </div>


                            <div class="ratting-form-wrapper">
{{--                                @livewire('comment',['model'=>$post])--}}
                                <h2 class="text-center">Вы можете оставить свой комментарий</h2>
                                <div class="ratting-form">
                                    <form  action="#">
                                        <div class="row">
{{--                                            @foreach($model->comments as $comment)--}}
                                            <div class="col-md-6">
                                                <div class="rating-form-style mb-20">
{{--                                                    <p>{{$comment->user_name}}</p>--}}
                                                    <input placeholder="Name" type="text">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="rating-form-style mb-20">
{{--                                                    <p>{{$comment->text}}</p>--}}
                                                    <input placeholder="Email" type="text">
                                                </div>
                                            </div>
{{--                                            @endforeach--}}
                                            <div class="col-md-12">
                                                <div class="rating-form-style form-submit">
                                                    <textarea name="message" @error('text') placeholder="Message" @enderror></textarea>
{{--                                                    <p class="text-red-500">{{$message}}</p>--}}
                                                    <input type="submit" value="Отправить">
                                                </div>
                                            </div>
                                            @endforeach
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<!-- all js here -->
        <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/elevetezoom.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/ajax-mail.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
