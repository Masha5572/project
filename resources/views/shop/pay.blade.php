<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="../../../public/css/style.css">
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
            </div>
        </div>
    </nav>
</header>
@if($messageSuccessOrder)
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24"><use xlink:href="#check-circle-fill"/></svg>
    <strong>{{$messageSuccessOrder}}</strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Закрыть"></button>
</div>
@endif
<div class="accordion accordion-flush my-5" id="accordionFlushExample">
    <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                <h1>Информация для заказа</h1>
            </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">

                    <form method="post" action="{{route('shop/make-order')}}">
                        @csrf
                    <div class="col-md-6">
                        <label for="inputName4" class="form-label">Имя</label>
                        <input name="name" type="text" class="form-control" id="inputName4" value="{{$user->name}}">
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Эл. адрес</label>
                        <input name="email" type="email" class="form-control" id="inputEmail4" value="{{$user->email}}">
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword4" class="form-label">Пароль</label>
                        <input name="password" type="password" class="form-control" id="inputPassword4">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Адрес</label>
                        <input name="address" type="text" class="form-control" id="inputAddress" placeholder="Проспект Ленина">
                    </div>
                    <div class="col-md-6">
                        <label for="inputCity" class="form-label">Город</label>
                        <input name="city" type="text" class="form-control" id="inputCity" placeholder="Брянск">
                    </div>
                    <div class="col-md-6">
                        <label for="inputPhone" class="form-label">Телефон</label>
                        <input name="phone" type="number" class="form-control" id="inputPhone" placeholder="+7 906 654 45 78">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-light">Заказать</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                <h1>История заказов</h1>
            </button>
        </h2>
        <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">
                @foreach($orders as $order)
                    <table class="table table-bordered">
                        <thead>
                        @foreach($order->cart_data as $cart_data)
                        <tr>
                            <th scope="col">Кол-во</th>
                            <th scope="col">Имя</th>
                            <th scope="col">Цена</th>
                            <th scope="col">Общая стоимость</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">{{$cart_data['quantity']}}</th>
                            <td>{{$cart_data['name']}}</td>
                            <td>{{$cart_data['price']}}</td>
                            <td>{{$cart_data['price']*$cart_data['quantity']}}</td>
                        </tr>
                        </tbody>
                        @endforeach
                            <tfoot>
                            <tr>
                                <td colspan="3">Сумма выкупа</td>
                                <td colspan="1">{{$order->total_sum}}</td>
                            </tr>
                            </tfoot>
                    </table>
        @endforeach
    </div>
        </div>
    </div>
</div>
{{--<section class="h-100 h-custom" style="background-color: #d2c9ff;">--}}
{{--  <div class="container py-5 h-100">--}}
{{--    <div class="row d-flex justify-content-center align-items-center h-100">--}}
{{--      <div class="col-12">--}}
{{--        <div class="card card-registration card-registration-2" style="border-radius: 15px;">--}}
{{--          <div class="card-body p-0">--}}
{{--            <div class="row g-0">--}}
{{--              <div class="col-lg-8">--}}
{{--                <div class="p-5">--}}
{{--                  <div class="d-flex justify-content-between align-items-center mb-5">--}}
{{--                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>--}}
{{--                    <h6 class="mb-0 text-muted">3 items</h6>--}}
{{--                  </div>--}}
{{--                  <hr class="my-4">--}}

{{--                  <div class="row mb-4 d-flex justify-content-between align-items-center">--}}
{{--                    <div class="col-md-2 col-lg-2 col-xl-2">--}}
{{--                      <img--}}
{{--                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img5.webp"--}}
{{--                        class="img-fluid rounded-3" alt="Cotton T-shirt">--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-3 col-xl-3">--}}
{{--                      <h6 class="text-muted">Shirt</h6>--}}
{{--                      <h6 class="text-black mb-0">Cotton T-shirt</h6>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">--}}
{{--                      <button class="btn btn-link px-2"--}}
{{--                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">--}}
{{--                        <i class="fas fa-minus"></i>--}}
{{--                      </button>--}}

{{--                      <input id="form1" min="0" name="quantity" value="1" type="number"--}}
{{--                        class="form-control form-control-sm" />--}}

{{--                      <button class="btn btn-link px-2"--}}
{{--                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">--}}
{{--                        <i class="fas fa-plus"></i>--}}
{{--                      </button>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">--}}
{{--                      <h6 class="mb-0">€ 44.00</h6>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">--}}
{{--                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>--}}
{{--                    </div>--}}
{{--                  </div>--}}

{{--                  <hr class="my-4">--}}

{{--                  <div class="row mb-4 d-flex justify-content-between align-items-center">--}}
{{--                    <div class="col-md-2 col-lg-2 col-xl-2">--}}
{{--                      <img--}}
{{--                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img6.webp"--}}
{{--                        class="img-fluid rounded-3" alt="Cotton T-shirt">--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-3 col-xl-3">--}}
{{--                      <h6 class="text-muted">Shirt</h6>--}}
{{--                      <h6 class="text-black mb-0">Cotton T-shirt</h6>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">--}}
{{--                      <button class="btn btn-link px-2"--}}
{{--                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">--}}
{{--                        <i class="fas fa-minus"></i>--}}
{{--                      </button>--}}

{{--                      <input id="form1" min="0" name="quantity" value="1" type="number"--}}
{{--                        class="form-control form-control-sm" />--}}

{{--                      <button class="btn btn-link px-2"--}}
{{--                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">--}}
{{--                        <i class="fas fa-plus"></i>--}}
{{--                      </button>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">--}}
{{--                      <h6 class="mb-0">€ 44.00</h6>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">--}}
{{--                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>--}}
{{--                    </div>--}}
{{--                  </div>--}}

{{--                  <hr class="my-4">--}}

{{--                  <div class="row mb-4 d-flex justify-content-between align-items-center">--}}
{{--                    <div class="col-md-2 col-lg-2 col-xl-2">--}}
{{--                      <img--}}
{{--                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img7.webp"--}}
{{--                        class="img-fluid rounded-3" alt="Cotton T-shirt">--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-3 col-xl-3">--}}
{{--                      <h6 class="text-muted">Shirt</h6>--}}
{{--                      <h6 class="text-black mb-0">Cotton T-shirt</h6>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">--}}
{{--                      <button class="btn btn-link px-2"--}}
{{--                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">--}}
{{--                        <i class="fas fa-minus"></i>--}}
{{--                      </button>--}}

{{--                      <input id="form1" min="0" name="quantity" value="1" type="number"--}}
{{--                        class="form-control form-control-sm" />--}}

{{--                      <button class="btn btn-link px-2"--}}
{{--                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">--}}
{{--                        <i class="fas fa-plus"></i>--}}
{{--                      </button>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">--}}
{{--                      <h6 class="mb-0">€ 44.00</h6>--}}
{{--                    </div>--}}
{{--                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">--}}
{{--                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>--}}
{{--                    </div>--}}
{{--                  </div>--}}

{{--                  <hr class="my-4">--}}

{{--                  <div class="pt-5">--}}
{{--                    <h6 class="mb-0"><a href="#!" class="text-body"><i--}}
{{--                          class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>--}}
{{--                  </div>--}}
{{--                </div>--}}
{{--              </div>--}}
{{--              <div class="col-lg-4 bg-grey">--}}
{{--                <div class="p-5">--}}
{{--                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>--}}
{{--                  <hr class="my-4">--}}

{{--                  <div class="d-flex justify-content-between mb-4">--}}
{{--                    <h5 class="text-uppercase">items 3</h5>--}}
{{--                    <h5>€ 132.00</h5>--}}
{{--                  </div>--}}

{{--                  <h5 class="text-uppercase mb-3">Shipping</h5>--}}

{{--                  <div class="mb-4 pb-2">--}}
{{--                    <select class="select">--}}
{{--                      <option value="1">Standard-Delivery- €5.00</option>--}}
{{--                      <option value="2">Two</option>--}}
{{--                      <option value="3">Three</option>--}}
{{--                      <option value="4">Four</option>--}}
{{--                    </select>--}}
{{--                  </div>--}}

{{--                  <h5 class="text-uppercase mb-3">Give code</h5>--}}

{{--                  <div class="mb-5">--}}
{{--                    <div class="form-outline">--}}
{{--                      <input type="text" id="form3Examplea2" class="form-control form-control-lg" />--}}
{{--                      <label class="form-label" for="form3Examplea2">Enter your code</label>--}}
{{--                    </div>--}}
{{--                  </div>--}}

{{--                  <hr class="my-4">--}}

{{--                  <div class="d-flex justify-content-between mb-5">--}}
{{--                    <h5 class="text-uppercase">Total price</h5>--}}
{{--                    <h5>€ 137.00</h5>--}}
{{--                  </div>--}}

{{--                  <button type="button" class="btn btn-dark btn-block btn-lg"--}}
{{--                    data-mdb-ripple-color="dark">Register</button>--}}

{{--                </div>--}}
{{--              </div>--}}
{{--            </div>--}}
{{--          </div>--}}
{{--        </div>--}}
{{--      </div>--}}
{{--    </div>--}}
{{--  </div>--}}
{{--</section>--}}

    <!-- Footer -->



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
