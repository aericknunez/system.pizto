<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ingresar al sistema</title>

    <link rel="stylesheet" href="assets/css/font-awesome.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/mdb.min.css" rel="stylesheet">
    <link href="assets/css/galeria.css" rel="stylesheet">

    <style>/* Required for full background image */

html,
body,
header,
.view {
  height: 100%;
}


@media (max-width: 740px) {
  html,
  body,
  header,
  .view {
    height: 700px;
    background-color: #000 !important;
  }
}
@media (min-width: 800px) and (max-width: 850px) {
  html,
  body,
  header,
  .view {
    height: 650px;
  }
}

.top-nav-collapse {
  background-color: #3f51b5 !important;
}

.navbar:not(.top-nav-collapse) {
  background: transparent !important;
}

@media (max-width: 991px) {
  .navbar:not(.top-nav-collapse) {
    background: #3f51b5 !important;
  }
}

/*.rgba-gradient {
  background: -webkit-linear-gradient(45deg, rgba(0, 0, 0, 0.7), rgba(72, 15, 144, 0.4) 100%);
  background: -webkit-gradient(linear, 45deg, from(rgba(0, 0, 0, 0.7), rgba(72, 15, 144, 0.4) 100%)));
  background: linear-gradient(to 45deg, rgba(0, 0, 0, 0.7), rgba(72, 15, 144, 0.4) 100%);
}*/

.card {
  background-color: rgba(100, 100, 100, 0.2);
}

.md-form label {
  color: #ffffff;
}

h6 {
  line-height: 9.7;
}
body { overflow-x: hidden; padding-left: 5px; padding-right: 5px; }</style>

</head>
<body class="hidden-sn navy-blue-skin">

<!-- Main navigation -->
<header>

  <!-- Full Page Intro -->
  <div class="view" style="background-image: url('assets/img/Photos/loginsp.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
    <!-- Mask & flexbox options-->
    <div class="mask rgba-gradient d-flex justify-content-center">
      <!-- Content -->
      <div class="container">
        <!--Grid row-->
        <div class="row mt-5">
          <!--Grid column-->
          



          <div class="col-md-6 mb-5 mt-md-0 mt-5 white-text text-center text-md-left d-none d-md-block">
            <!-- <h1 class="h1-responsive font-weight-bold wow fadeInLeft" data-wow-delay="0.3s">Registrese Ahora! </h1> 

            <hr class="hr-light wow fadeInLeft" data-wow-delay="0.3s"> -->
            <h6 class="mb-3 wow fadeInLeft" data-wow-delay="0.3s">
      <img src="assets/img/secure.png" alt="">
            </h6>

          </div>



          <!--Grid column-->
          <!--Grid column-->
          <div class="col-md-6 col-xl-5 mb-4">
            <!--Form-->
      <form id="form-login" name="form-login" > 
            <div class="card wow fadeInRight" data-wow-delay="0.3s">
              <div class="card-body">
                <!--Header-->

                <div class="justify-content-center">
                  <img src="assets/img/logo/sp.png" alt="">
                </div>
                

                <div class="md-form">
                  <i class="fa fa-envelope prefix orange-text active"></i>
                  <input type="text" name="email" class="white-text form-control" />
                  <label for="email" class="active">Email</label>
                </div>

                <div class="md-form">
                  <i class="fa fa-lock prefix orange-text active"></i>
                  
                  <input type="password" 
                             name="password" 
                             id="password" class="orange-text form-control" />

                  <label for="pass">Password</label>
                </div>

                <div class="text-center mt-4">
                  <div id="msj"></div>
                  
                  <button class="btn btn-warning my-4 btn-outline-warning" type="submit" id="btn-login" name="btn-login">Ingresar</button>
                  
                  
                  <hr class="hr-light mb-3 mt-4">                
                  <div class="inline-ul text-center d-flex justify-content-center">


                  </div>
                </div>
              </div>
            </div>

            </form>
            <!--/.Form-->
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </div>
      <!-- Content -->
    </div>
    <!-- Mask & flexbox options-->
  </div>
  <!-- Full Page Intro -->
</header>
<!-- Main navigation -->

<!-- 
<main>



</main>  
 -->

    <script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript" src="assets/js/popper.min.js"></script>

    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="assets/js/mdb.min.js"></script>
    <script>
        // SideNav Initialization
        $(".button-collapse").sideNav();
        
        new WOW().init();

       </script>

<script type="text/javascript" src="system/user/login.js"></script>

</body>

</html>
