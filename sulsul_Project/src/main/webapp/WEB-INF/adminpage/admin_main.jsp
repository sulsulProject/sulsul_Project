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
th,h1,h2,li,hhh{font-family: "Playfair Display", serif;}
.untree_co-section {
    padding: 10px 0;
    position: relative;
}
</style>
</head>
<body>
<div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1 style="color: #eaa8b3;">Adminpage</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>Adminpage</strong></p>        
        </div>
      </div>
    </div>
  </div>
<div class="untree_co-section rows">
  <div class="container">
    <div style="height: 30px"></div>
     <h2><b style="color: #92A8D1;">관리자</b> 페이지 입니다.</h2>
    <div style="height: 30px"></div>
     <jsp:include page="../adminpage/admin_menu.jsp"></jsp:include>
      <div class="content"> 
      <jsp:include page="${admin_jsp }"></jsp:include>
    </div>
  </div>
 </div>
</body>
</html>