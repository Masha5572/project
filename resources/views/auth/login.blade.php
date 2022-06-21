
{{--<x-guest-layout>--}}
{{--    <x-auth-card>--}}
{{--        <x-slot name="logo">--}}
{{--            <a href="/">--}}
{{--                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />--}}
{{--            </a>--}}
{{--        </x-slot>--}}

{{--        <!-- Session Status -->--}}
{{--        <x-auth-session-status class="mb-4" :status="session('status')" />--}}

{{--        <!-- Validation Errors -->--}}
{{--        <x-auth-validation-errors class="mb-4" :errors="$errors" />--}}


    <!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"  name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="../../../public/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@1,300&display=swap" rel="stylesheet">

</head>
<body style="font-family: Roboto,serif;background-image: url(../../../public/img/il_fullxfull.2831610259_j2qw.jpg)">
<div class="container d-flex flex-column">
    <div class="row align-items-center justify-content-center">
        <div class="col-lg-5 col-md-6">
            <x-guest-layout>
                <x-auth-card>
                    <x-slot name="logo">
                        <a href="/">
                            <h1 class="display-3">Авторизация</h1>
                        </a>
                    </x-slot>

                    <!-- Session Status -->
                    <x-auth-session-status class="mb-4" :status="session('status')" />



                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <!-- Email Address -->
                        <div class="mt-4">
                            <x-label class="form-label" for="email" :value="__('Email')" />

                            <x-input id="email" class="block mt-1 w-full form-control  rounded-pill" type="email" name="email" :value="old('email')" required />
                            @error('email')
                            <div class="alert alert-danger" role="alert">
                                <h4 class="alert-heading">Упс у вас ошибка</h4>
                                <hr>
                                <p>{{$message}}</p>
                            </div>
                            @enderror
                        </div>
                        <!-- Password -->
                        <div class="mt-4">
                            <x-label class="form-label" for="password" :value="__('Password')" />

                            <x-input id="password" class="block mt-1 w-full form-control  rounded-pill"
                                     type="password"
                                     name="password"
                                     required autocomplete="new-password" />
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
                                <a href="{{route('/registration')}}" class="btn btn-outline-dark rounded-pill me-2">У вас ещё нет аккаунта?</a>
                                <a class="btn btn-outline-dark rounded-pill" href="{{ route('password.request') }}">
                                    {{ __('Забыли пароль?') }}
                                </a>
                            @endif

                            <x-button class="ml-3 bg-dark  rounded-pill">
                                {{ __('Log in') }}
                            </x-button>
                        </div>
                    </form>
                </x-auth-card>
            </x-guest-layout>
        </div>
    </div>
</div>
