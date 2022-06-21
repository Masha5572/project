<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="../../../public/css/shop.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+Thai+Looped:wght@100&family=Kaushan+Script&family=Quicksand:wght@300&display=swap" rel="stylesheet">
</head>
<body style="font-family: Roboto,serif">
<header>
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

                    {{--          <li class="nav-item">--}}
                    {{--              <a class="nav-link active" href="{{route('shop/profile')}}">--}}
                    {{--                  Вход--}}
                    {{--              </a>--}}
                    {{--          </li>--}}
                </ul>
                <div class="d-flex align-items-center">
                    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                        <span class="badge badge-pill bg-secondary">{{\Cart::session(\Illuminate\Support\Facades\Session::getId())->getTotalQuantity()}}</span>
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">Ваша корзина покупок</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="card mb-4">
                                        <div class="card-body p-4">
                                            @foreach($cart as $item)
                                                <div class="row align-items-center">
                                                    {{--                                            <div class="col-md-2">--}}
                                                    {{--                                                <img src="../../../public/storage/{{$item->attributes->img}}">--}}
                                                    {{--                                            </div>--}}
                                                    {{--                                            <div class="col-md-2 d-flex justify-content-center">--}}
                                                    {{--                                                <div>--}}
                                                    {{--                                                    <p class="small text-muted mb-4 pb-2">Имя</p>--}}
                                                    {{--                                                    <p class="lead fw-normal mb-0">{{$item->name}}</p>--}}
                                                    {{--                                                </div>--}}
                                                    {{--                                            </div>--}}
                                                    <div class="col-md-2 d-flex justify-content-center">
                                                        <div>
                                                            <p class="small text-muted mb-4 pb-2">Имя</p>
                                                            <p class="lead fw-normal mb-0">{{$item->name}}</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 d-flex justify-content-center">

                                                    </div>
                                                    <div class="col-md-2 d-flex justify-content-center">
                                                        <div>
                                                            <p class="small text-muted mb-4 pb-2">Кол-во</p>
                                                            <p class="lead fw-normal mb-0">{{$item->quantity}}</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 d-flex justify-content-center">
                                                        <div>
                                                            <p class="small text-muted mb-4 pb-2">Price</p>
                                                            <p class="lead fw-normal mb-0">{{$item->price}}</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 d-flex mt-4">
                                                        <a href="{{route('shop/clear', ['id'=>$item->id])}}">Удалить</a>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="card mb-5">
                                        <div class="card-body p-4">

                                            <div class="float-end">
                                                <p class="mb-0 me-5 d-flex align-items-center">
                                                    <span class="small text-muted me-2">Сумма</span> <span
                                                        class="lead fw-normal">{{$sum}}</span>
                                                </p>
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-end">
                                        <a class="btn btn-light" href="{{route('shop/pay')}}" role="button">Перейти к оформлению</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        {{--                    <div class="modal-footer">--}}
                        {{--                        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Open second modal</button>--}}
                        {{--                    </div>--}}
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Hide this modal and show the first with the button below.
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Back to first</button>
                    </div>
                </div>
            </div>
        </div>

        <a style="font-size: 2em" class="text-reset me-3" data-bs-toggle="modal" href="#exampleModalToggle" role="button">
            <i class="bi bi-bag-heart"></i>
        </a>
        <a style="font-size: 2em" class="text-reset me-3" href="{{route('shop/profile')}}" role="button">
            <i class="bi bi-person-circle"></i>
        </a>
        </div>
        </div>
    </nav>
</header>
<main>
    <div class="container my-5">
        <div class="row">
            <div class="col col-md-8">
                <img  src="../../../public/img/dior mag 07.jpg" class="container-fluid" alt="...">
            </div>
            <div class="col col-md-4 text-center">
                <img  src="../../../public/img/7ba7a93082699c5baadc9be4bb252683.jpg" class="container-fluid" alt="...">
            </div>
        </div>
    </div>


    {{--<div class="card mb-3" style="max-width: 540px;">--}}
    {{--  <div class="row g-0">--}}
    {{--    <div class="col-md-4">--}}
    {{--      <img src="../../../public/storage/{{$product->img}}" class="img-fluid rounded-start" alt="...">--}}
    {{--    </div>--}}
    {{--    <div class="col-md-8">--}}
    {{--      <div class="card-body">--}}
    {{--        <h5 class="card-title">{{$product->name}}</h5>--}}

    {{--         <span>Цена: {{$product->price}}</span>--}}
    {{--      </div>--}}
    {{--    </div>--}}
    {{--  </div>--}}
    {{--</div>--}}



    {{--        <div class="container justify-content-center">--}}
    {{--            <div class="row row row-cols-4">--}}
    {{--                <div class="col-lg-4 col-sm-6">--}}
    {{--                    @foreach($products as $product)--}}
    {{--                    <div class="product-card">--}}
    {{--                        <div class="product-img">--}}

    {{--                            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"--}}
    {{--                                 data-mdb-ripple-color="light">--}}
    {{--                            <a class="link-secondary" href="{{route('shop/product-details',['id'=>$product->id])}}"><img src="../../../public/storage/{{$product->img}}" class="img-fluid rounded-start" alt="...">--}}
    {{--                            </a>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="product-detalis">--}}
    {{--                            <a class="card-title mb-3 link-secondary"><a href="{{route('shop/product-details',['name'=>$product->name])}}">{{$product->name}}</a>--}}
    {{--                        </div>--}}
    {{--                        <div class="product-bottom-detalis d-flex justify-content-between">--}}
    {{--                            <div class="product-price text-center">--}}
    {{--                                <h6>--}}
    {{--                                    <small style="text-align: center">Цена: {{$product->price}}</small>--}}
    {{--                                </h6>--}}

    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="product-links">--}}
    {{--                            <a class="link-secondary" href="{{route('shop/cart',['id'=>$product->id])}}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">--}}
    {{--                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>--}}
    {{--                                </svg></a>--}}
    {{--                        </div>--}}
    {{--                    </div>--}}
    {{--                    @endforeach--}}
    {{--                </div>--}}
    {{--            </div>--}}
    {{--        </div>--}}
{{--    <div class="text-center">--}}
{{--        <a href="{{route('shop/categori', ['slug' => 'dzhinsy'])}}" type="button" class="btn btn-outline-danger">Волосы</a>--}}
{{--        <a href="{{route('shop/categori', ['slug' => 'yubka'])}}" type="button" class="btn btn-outline-danger">Юбка</a>--}}
{{--        <a href="{{route('shop/categori', ['slug' => 'kostyum'])}}" type="button" class="btn btn-outline-danger">Костюм</a>--}}
{{--        <button type="button" class="btn btn-outline-danger">Глаза</button>--}}
{{--        <a type="button" class="btn btn-outline-danger">Губы</a>--}}
{{--    </div>--}}
    <div class="btn-group">
        <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
            Сортировать
        </button>
        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start" aria-labelledby="dropdownMenuButton1">
            <li><a href="{{route('shop/categori', ['slug' => 'dzhinsy'])}}" type="button" class="btn btn-outline-danger dropdown-item">Джинсы</a></li>
            <li> <a href="{{route('shop/categori', ['slug' => 'yubka'])}}" type="button" class="dropdown-item btn btn-outline-danger">Юбка</a></li>
            <li> <a href="{{route('shop/categori', ['slug' => 'kofta'])}}" type="button" class="dropdown-item btn btn-outline-danger">Кофта</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'kostyum'])}}" type="button" class="dropdown-item btn btn-outline-danger">Костюм</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'platьe'])}}" type="button" class="dropdown-item btn btn-outline-danger">Платье</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'futbolka'])}}" type="button" class="dropdown-item btn btn-outline-danger">Футболка</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'top'])}}" type="button" class="dropdown-item btn btn-outline-danger">Топ</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'zhiletka'])}}" type="button" class="dropdown-item btn btn-outline-danger">Жилетка</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'bodi'])}}" type="button" class="dropdown-item btn btn-outline-danger">Боди</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'kurtka'])}}" type="button" class="dropdown-item btn btn-outline-danger">Куртка</a></li>
            <li><a href="{{route('shop/categori', ['slug' => 'bluzka'])}}" type="button" class="dropdown-item btn btn-outline-danger">Блузка</a></li>
        </ul>
    </div>

    <div class="container">
        <div class="row">
            @foreach($products as $product)
                <div class="card mt-3 me-4" style="width: 15rem;">
                    <a role="button"  href="{{route('shop/product-details',['id'=>$product->id])}}"><img src="../../../public/storage/{{$product->img}}" width="100%" class="img-fluid rounded-start" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title text-center"> <a role="button" class="card-title mb-3 link-dark"><a href="{{route('shop/product-details',['name'=>$product->name])}}">{{$product->name}}</a></a></h5>
                        <a href="#" class="btn btn-dark text-center">Цена: {{$product->price}}</a>
                        <a style="font-size: 2em" class="link-secondary" href="{{route('shop/cart',['id'=>$product->id])}}"><i class="bi bi-bag-heart"></i></a>
                    </div>
                </div>
            @endforeach
        </div>

    </div>



</main>
<footer class="bg-light text-center text-black">
    <!-- Grid container -->
    <div class="container p-4">
        <!-- Section: Social media -->
        <section class="mb-4">

            <h3>Будем вместе</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="3em" height="3em" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
            </svg>

            <!-- Facebook -->
            <svg xmlns="http://www.w3.org/2000/svg" width="3em" height="3em" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
            </svg>

            <!-- Instagram -->
            <svg xmlns="http://www.w3.org/2000/svg" width="3em" height="3em" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
            </svg>


        </section>
        <!-- Section: Social media -->

        <!-- Section: Form -->
        <section class="">
            <form action="">
                <!--Grid row-->
                <div class="row d-flex justify-content-center">
                    <!--Grid column-->
                    <div class="col-auto">
                        <p class="pt-2">
                            <strong>Давайте дружить</strong>
                        </p>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-5 col-12">
                        <!-- Email input -->
                        <div class="form-outline form-white mb-4">
                            <input type="email" id="form5Example21" class="form-control" placeholder="Добавьте эл.почту" />
                            <label class="form-label" for="form5Example21"></label>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-auto">
                        <!-- Submit button -->
                        <button type="submit" class="btn btn-outline-black mb-4">
                            ОК
                        </button>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </form>
        </section>
        <!-- Section: Form -->

        <!-- Section: Text -->
        <section class="mb-4">
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt distinctio earum
                repellat quaerat voluptatibus placeat nam, commodi optio pariatur est quia magnam
                eum harum corrupti dicta, aliquam sequi voluptate quas.
            </p>
        </section>
        <!-- Section: Text -->



        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: white;">
            © 2022 Интернет-магазин одежды "Zarfool"

        </div>
    </div>
    <!-- Copyright -->
</footer>
</body>




