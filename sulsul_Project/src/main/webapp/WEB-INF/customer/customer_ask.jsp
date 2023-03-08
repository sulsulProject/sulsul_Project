<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.untree_co-section{
	border : 1px solid black;
}
.container{
    border : 1px solid red;
}
table tr.menu {
    position: sticky;
    top: 100px;
    right: 300px;
}
</style>
</head>
<body>
<div class="untree_co-section"> <!-- untree_co-section -->
  <div class="container">
   <div class="row">
   <!-- style="text-decoration:none;color: #212121" 알아내기 -->
    <div id="aside"class="col-lg-3">   
      <table class="table">
      <tr class ="menu" >
        <th><h5>고객센터</h5></th>
       </tr>
       <tr class ="menu" >
        <th><a href="../customer/faq.do">FAQ</a></th>
       </tr>
       <tr class ="menu" >
        <th><a href="../customer/iu.do">이용안내</a></th>
       </tr>
       <tr>
        <th><a href="../customer/ask.do">1:1 문의하기</a></th>
       </tr>
      </table>
    </div>
  
  <!-- aside를 눌렀을 때 content 내용 바뀌기 -->
  <div id ="content" class="col-lg-9" style="background-color: pink">
    <div class="container" background-color: black"> <!-- controller div태그 줄지 고민중 -->
      <div class="row-lg-1" style="background-color: white">
       <h4 style="padding: 0.75rem;">1:1 문의하기</h4>
       <!-- <img src="https://post.malltail.com/img/page/new_faqs_main_01.gif"> -->
      </div>
      <div style="height: 15px;"></div>
      <div class="row-lg-3" style="background-color: white">
      1:1 문의하기 내용
      </div>
      <div class="row-lg-3" style="background-color: green">
       문의하기 버튼 클릭 => 챗봇 나오게 할지 말지 고민중
      </div>
    </div>
  </div>
  </div>
  </div>
</div>
</body>
</html>