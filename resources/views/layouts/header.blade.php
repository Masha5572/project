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
            {{--     <form method="get" action="{{route('shop/search')}}" class="d-flex">--}}
            {{--            <input class="form-control me-2" id="s" name="s" type="search" placeholder="Search" aria-label="Search">--}}
            {{--            <button class="btn btn-outline-success" type="submit">Search</button>--}}
            {{--        </form>--}}
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
                                                <div class="col-md-2 d-flex">
                                                    <div>
                                                        <p class="small text-muted mb-4 pb-2">Изображение</p>
                                                        <img style="width: 100px" src="../../../public/storage/{{$item->attributes->img}}">

                                                    </div>
                                                </div>
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
    <a style="font-size: 2em" class="text-reset me-3" href="@auth {{route('shop/account')}}@endauth @guest{{route('login')}}@endguest" role="button">
        <i class="bi bi-person-circle"></i>
    </a>
    </div>
    </div>

</nav>

