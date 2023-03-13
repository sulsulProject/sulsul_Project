<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
th,h1{font-family: "Playfair Display", serif;}
</style>
</head>
<body>
<div class="untree_co-section rows">
  <div class="container">
    <div style="height: 30px"></div>
    <h2>${sessionScope.name}님의 Mypage 입니다.</h2>
     <div class="row">
       <div class="col-md-3">
          <ul class="list-unstyled categories">
            <li><a href="../mypage/member_info_update">회원 수정</a></li>
            <li><a href="../mypage/member_addr_update">회원 주소</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">좋아요</a></li>
            <li><a href="#">주문내역</a></li>
          </ul>
        </div>
     </div>
  </div>
</div>
</body>
</html>