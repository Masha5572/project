<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet"  href="style.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+Thai+Looped:wght@100&family=Kaushan+Script&family=Quicksand:wght@300&display=swap" rel="stylesheet">
</head>
<body>
  <header>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Men</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav w-100 justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="{{route('shop/main')}}">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
    </div>
  </div>
</nav>
</header>
<main>
 <div class="container my-5">
<div class="row">
<div class="col">
     <img  src="../../../public/img/1ab073950c26aed4a15b5454cb86e93a.jpg" class="container-fluid" alt="...">
    </div>
<div class="col">
  <img  src="../../../public/img/Jegor-Venned-GQ-Spain-Diego-Merino-01-620x833.jpg" class="container-fluid" alt="...">
    </div>
    <div class="col">
  <img  src="../../../public/img/4362ac292af81fc2df535838a11d74ec--magazine-online-female-models.jpg" class="container-fluid" alt="...">
    </div>
</div>
  </div>
  <div class="row">
  @foreach($products as $product)
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="../../../public/storage/{{$product->img}}" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">{{$product->name}}</h5>
        <p class="card-text">{{$product->description}}</p>
         <span>Цена: {{$product->price}}</span>
      </div>
    </div>
  </div>
</div>








  </div>
   @endforeach
</main>
 </body> 