<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!-- /*
* Template Name: UntreeStore
* Template Author: Untree.co
* Author URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!doctype html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="author" content="Untree.co">
   <link rel="shortcut icon" href="../favicon.png">

   <meta name="description" content="" />
   <meta name="keywords" content="" />

   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@400;700&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

   <link rel="stylesheet" href="../css/bootstrap.min.css">
   <link rel="stylesheet" href="../css/animate.min.css">
   <link rel="stylesheet" href="../css/owl.carousel.min.css">
   <link rel="stylesheet" href="../css/owl.theme.default.min.css">
   <link rel="stylesheet" href="../css/jquery.fancybox.min.css">
   <link rel="stylesheet" href="../fonts/icomoon/style.css">
   <link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
   <link rel="stylesheet" href="../css/aos.css">
   <link rel="stylesheet" href="../css/style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet" href="../css/fontAwesome.css">
   <link rel="stylesheet" href="https://kit.fontawesome.com/2fd2b83183.css" crossorigin="anonymous">
   <title>Sul</title>
   <style type="text/css">
.goup_btn {

    top: 90%;
    left: 95%;
    width: 50px;
    height: 50px;
    border-radius: 80%;
    background-color: #ffffff;
    border: 1px solid lightgray;
    position: fixed;
    z-index: 2;
}
   </style>
</head>

<body>

   <div class="search-form" id="search-form">
      <form method="post" action="../wine/find.do">
         <input type="search" name="ss" class="form-control" placeholder="검색내용을 입력하세요.">
         <button class="button" type="submit">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
               <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
               <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
            </svg>
         </button>
         <button class="button">
            <div class="close-search">
               <span class="icofont-close js-close-search"></span>
            </div>
         </button>

      </form>
   </div>

   <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
         <div class="site-mobile-menu-close">
            <span class="icofont-close js-menu-toggle"></span>
         </div>
      </div>
      <div class="site-mobile-menu-body"></div>
   </div>


   <!-- Header Start -->
     <tiles:insertAttribute name="header"/>

   <!-- Header End -->

   <!-- Home Start -->

 <tiles:insertAttribute name="home"/>

   <!-- Home End -->

   <button class="goup_btn" onclick="goup()"><i class="fa-solid fa-arrow-up"></i></button>

   <!-- Footer Start -->
 <tiles:insertAttribute name="footer"/>
   <!-- Footer End -->
   
   <div id="overlayer"></div>
   <div class="loader">
      <div class="spinner-border" role="status">
         <span class="sr-only">Loading...</span>
      </div>
   </div>

   <script src="../js/jquery-3.4.1.min.js"></script>
   <script src="../js/popper.min.js"></script>
   <script src="../js/bootstrap.min.js"></script>
   <script src="../js/owl.carousel.min.js"></script>
   <script src="../js/jquery.animateNumber.min.js"></script>
   <script src="../js/jquery.waypoints.min.js"></script>
   <script src="../js/jquery.fancybox.min.js"></script>
   <script src="../js/jquery.sticky.js"></script>
   <script src="../js/aos.js"></script>
   <script src="../js/custom.js"></script>
   
   <script>
      
         function goup() {
            window.scrollTo({top:0, left:0, behavior:'smooth'});
          }

    </script>
</body>

</html>