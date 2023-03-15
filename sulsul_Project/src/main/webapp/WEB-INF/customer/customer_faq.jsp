<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
.untree_co-section{
	border : 1px solid black;
}
.container{
    border : 1px solid red;
} 

#side { //사이드바 같이 이동 시키려고
    position: sticky;
    top: 100px;
    right: 300px;
}

.button1{
	padding-left:500px;
	height: 40px;
	width: 400px;
	border :1px solid #D0F1FB;
	background:  #D0F1FB;
}
input{
	font-size:16px;
	width:347px;
	height:100%;
	border:0px; 
	outline:none;
	floate:left;
}
button{
	width:50px;
	height:100%;
	border:0px;
	background: #D0F1FB;
	outline:none;
	float:right;
	color:black;
}
a.test:hover {
   text-decoration: underline; // 언더라인(아래줄) 스타일 부여
}
/*/////////////////////////////////////////////*/

</style>
</head>
<body>
<div style="height: 20px"></div>
<div class="untree_co-section" style=" max-height: 1500px">
 <div class="container">
   <div class="row">
     <!-- 사이드 메뉴 시작 -->
       <div id="aside"class="col-lg-3">   
         <table id="side" class="table" >
           <tr class ="menu" >
            <th><h5><b>고객센터</b></h5></th>
           </tr>
	       <tr>
	        <th style="padding: 8px"><a href="../customer/faq.do" style="color:#337AB7;font-size: 14px" class="test">FAQ</a></th>
	       </tr>
	       <tr>
	        <th style="padding: 8px"><a href="../customer/iu.do" style="color:#337AB7;font-size: 14px" class="test">이용안내</a></th>
	       </tr>
	       <tr>
	        <th style="padding: 8px"><a href="../customer/ask.do" style="color:#337AB7;font-size: 14px" class="test">1:1 문의하기</a></th>
	       </tr>
	      </table>
       </div>
  <!-- 사이드 메뉴 끝 -->

  <!-- content 시작 (우측 내용)-->
  <div id ="content" class="col-lg-9 container" >
     <div class="" background-color: black"> <!-- controller div태그 줄지 고민중 -->
        <div class="row-lg-1">
         <b style="font-size: 23px">고객센터FAQ</b>
        </div>
      </div>
      <div style="height:10px"></div>
       
       <!-- 나라별 고객 센터 소개 시작 -->
       <div class="container">
			<div class="row">
	        <div class="owl-4-slider owl-carousel">
			 <c:forEach var="vo" items="${nList }" begin="0" end="21">
				<div class="item" >
					<div class="product-item" style="background-color: #D0F1FB;border-radius: 1em;">
							<sub style="color: gray">${vo.nation }</sub><br>
							<b>${vo.title }</b>
							<div style="padding-left:70px;">
							<img src="${vo.image }" style="height:60px;width: 60px;">
					     </div>
					     
					     <!--  TO_DO : 나라별 현재 시간 추가 / 업무 상태 추가 -->
						<div><b>시간추가</b></div>
						<div><b>업무중 추가</b></div>
						
					</div>
				</div> <!-- /.item -->
				</c:forEach>
			</div>
		</div> <!-- /.container --> 
     </div>
     <!-- 나라별 고객센터 소개 끝 -->
     
     <!-- 크기 맞추려고 -->
     <div class="col-lg-3"></div>
     
	 <div class="col-lg-9">
	   <!-- 나라별 고객센터 소개 dot 때문에 높이 조정 -->
       <div style="height: 50px"></div>
       <!-- 검색창  start -->
         <!-- 검색 창 수정할지 말지 고민중 -->
       <!-- <div class="button1">
         <input type="text" placeholder="검색어를 입력하세요">
         <button>검색</button>
       </div> -->
       <div class="container">
	       <div class="text-center" style="border-color: black">
			<!--  <label for="search" class="blind">공지사항 내용 검색</label> -->
			   <input id="search" type="search" name="ss" placeholder="검색어를 입력해주세요." value="">
			   <button type="submit" class="btn btn-sm" style="background-color: #D0F1FB">검색</button>
		   </div>
       </div>
       <!-- Faq (탭스 사용) 시작 -->
       <div style="height: 50px"></div>
       <div >
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(1)">전체</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(2)">배송신청서& 회원관련</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(3)">입고관련</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(4)">배송관련</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(5)">결제관련</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(6)">반송관련</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(7)">다해줌</button>
          <button class="btn btn-xs" style="width: 120px;height:30px;background-color: #D0F1FB;" v-on:click="change(8)">기타</button>
        </div>
       

      <!-- Faq (탭스 사용) 끝 -->
  
   

    </div><!-- .col-lg-9 끝 -->
   </div> <!-- #content 끝 -->
  </div>
  </div>
</div>
</body>
</html>