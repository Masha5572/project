<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="../../../public/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+Thai+Looped:wght@100&family=Kaushan+Script&family=Quicksand:wght@300&display=swap" rel="stylesheet">

</head>
<body style="font-family: Roboto,serif">
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
                    <div class="modal-dialog modal-dialog-centered">
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
                                                    <a class="bi bi-x-circle" href="{{route('shop/clear', ['id'=>$item->id])}}"></a>

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
                                    <button type="button" class="btn btn-light btn-lg me-2">Continue shopping</button>
                                    <button type="button" class="btn btn-primary btn-lg">Add to cart</button>
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
@if('flashMessage')
    <div class="alert alert-warning" role="alert">
        {{session('flashMessage')}}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://i.pinimg.com/originals/5d/87/1a/5d871acdff31395061be1e4ba6a7755d.jpg"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">


                                    <form method="POST" action="{{ route('login') }}">
                                    @csrf
                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                            <span class="h1 fw-bold mb-0">Logo</span>
                                        </div>
                                    <!-- Email Address -->
                                        <div class="form-outline mb-4">

                                            <x-label for="email" :value="__('Email')" />

                                            <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
                                        </div>

                                        <!-- Password -->
                                        <div class="mt-4">
                                            <x-label for="password" :value="__('Password')" />

                                            <x-input id="password" class="block mt-1 w-full"
                                                     type="password"
                                                     name="password"
                                                     required autocomplete="current-password" />
                                        </div>

                                        <!-- Remember Me -->
                                        <div class="block mt-4">
                                            <label for="remember_me" class="inline-flex items-center">
                                                <input id="remember_me" type="checkbox" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="remember">
                                                <span class="ml-2 text-sm text-gray-600">{{ __('Запомнить меня') }}</span>
                                            </label>
                                        </div>

                                        <div class="flex items-center justify-end mt-4">
                                            @if (Route::has('password.request'))
                                                <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('password.request') }}">
                                                    {{ __('Forgot your password?') }}
                                                </a>
                                            @endif

                                                <div class="pt-1 mb-4">
                                                    <x-button class="ml-3">
                                                        {{ __('Log in') }}
                                                    </x-button>
                                                </div>

                                                <a class="small text-muted" href="#!">Forgot password?</a>
                                                <p class="mb-5 pb-lg-2" style="color: #393f81;">У вас нет учетной записи?  <a href="{{route('shop/registration')}}"
                                                                                                                          style="color: #393f81;">Зарегистрируйтесь здесь</a></p>

                                        </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <!-- Footer -->
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
                                <h4> Скидка 10% за подписку
                                    на наши новости</h4><a class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" role="button">
                                    Условия акции</a><div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Подписка</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <h1>ДОПОЛНИТЕЛЬНАЯ СКИДКА 10%
                                                    за подписку на наши новости</h1>
                                                <p>Подпишитесь на рассылку и подтвердите подписку, перейдя по ссылке в письме, которое мы вышлем на ваш e-mail. Получите скидку 10% по промокоду. Промокод является уникальным и может быть применен только один раз. Скидка действует при любой сумме заказа и распространяется на любые товары продавца Lamoda, кроме товаров брендов 4Life, 12storeez, Ahmad Tea, Alessio Nesca, Baon, Barilla, Balmain, Be Natural by Jana, Befree, Bershka, Betsy, Big Bon, Biocos, Bogner Fire+Ice, Calvin Klein Jeans, Calzedonia, Caprice, Carhartt, Casio, Certina, Cheap Monday, Claudie Pierlot, Contex, Crocs, Crosby, DC Shoes, Diadora, Durex, Dyson, Falconeri, Fashletics by Tamaris, Finn Flare, Flik Flak, Fred Perry, Geox, Greenfield, Hamilton, Heart & Sole by Tamaris, Huggies, Intimissimi, Jack Wolfskin, Jacobs, Jana, Johnson & Johnson, Jordan, Keddo, Lassie, Lassie by Reima, Lacoste, Lavazza, LC Waikiki, Levi's®, LumberJack, Maitre de The, Maje, Marc O'Polo, Marcel Ostertag by Tamaris, Marco Tozzi, Massimo Dutti, Mido, Modis, Monochrome, Nestle, New Balance, Nike, oodji, O'stin, Out of Scope Брауни, Oysho, Pasteroni, Paulig, Pull&Bear, PUMA, Quiksilver, Ralf Ringer, Rado, Reima, Roxy, s.Oliver, Salamander, Sandro, Secret Day Sense, Stradivarius, Swarovski®, Swatch, T.Taccardi, Tamaris, Tesoro, Tezenis, Timberland, Tissot, Tommy Hilfiger, Tommy Jeans, United Colors of Benetton, Union Glashutte, Yelli, Zarina, Zewa, ВкусВилл, Доширак, Котофей, Милфорд, Мистраль, Роллтон, Увелка, Чайкофский, Я самая, а также ряда моделей Converse. Дополнительная скидка по программе лояльности Lamoda Club не применяется совместно с данным промокодом.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                                <button type="button" class="btn btn-primary">Хорошо, понятно</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

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
            <section class="mb-4 text-start">
                <p>
                    Большой выбор товаров
                    В интернет-магазине Zarfool представлены лучшие коллекции женской одежды, обуви и аксессуаров, а также косметики и парфюмов ведущих мировых брендов. </p>

                <p> Увлечённые модницы могут выбрать товары премиум-класса и органично совместить их с базовыми вещами демократичной ценовой категории. Любая покупка на сайте Zarfool происходит в два клика. Покупательница может быть уверена, что получит фирменную вещь превосходного качества с гарантией.</p>

                <p>  Для постоянных клиентов существует программа лояльности. Кроме того, на Zarfool регулярно проводятся распродажи товаров даже из новых модных коллекций.<p>

                <p> Доставка с примеркой
                    Перед покупкой всю одежду и обувь можно примерить. Для этого не нужно ехать в магазин: курьер сам привезёт желаемые размеры и фасоны. Покупательнице остаётся только покрутиться перед зеркалом и определиться с выбором.</p>

                <p> По всей России Zarfool доставляет товары бесплатно. Собственная служба доставки работает в 66 крупных городах (Москва и МО, Санкт-Петербург, Нижний Новгород, Новосибирск, Екатеринбург, Самара, Тольятти, Тюмень, Челябинск и другие). В этих городах заказ приедет либо в этот же день, либо уже на следующий.<p>

                <p> Оплата и возврат
                    Для удобства клиентов оплатить товар можно любым способом: наличными курьеру, по банковской карте онлайн.<p>

                <p> У каждого курьера Zarfool есть мобильный терминал оплаты, поэтому платить карточкой можно даже дома в момент доставки заказа. Возврат товара возможен в течение 14  дней после покупки.</p>
                <hr>
                <h3 class="text-center">Наши друзья и партнеры</h3>
                <img class="w-100" src="../../../public/img/Скриншот 22-05-2022 164833.png">
            </section>
            <!-- Section: Text -->



            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: white;">
                © 2022 Интернет-магазин одежды "Zarfool"

            </div>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
</footer>


</body>
