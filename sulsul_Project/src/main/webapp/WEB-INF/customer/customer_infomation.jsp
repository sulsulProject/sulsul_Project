<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
/* .untree_co-section{
	border : 1px solid black;
}
.container{
    border : 1px solid red;
} */
/* TO_DO : 링크 색상 제거 하기*/
.table {
  text-decoration: none; /* 링크의 밑줄 제거 */
  color: inherit; /* 링크의 색상 제거 */ 
}
#side {
    position: sticky;
    top: 100px;
    right: 300px;
}
</style>
</head>
<body>
<div style="height: 20px"></div>
<div class="untree_co-section"> 
  <div class="container" style="max-width: 1100px;">
   <div class="row">
   <!-- 사이드 메뉴 시작 -->
    <div id="aside"class="col-lg-3">   
      <table id="side" class="table">
      <tr >
        <th><h5><b>고객센터</b></h5></th>
       </tr>
       <tr>
        <th><a href="../customer/faq.do" >FAQ</a></th>
       </tr>
       <tr>
        <th><a href="../customer/iu.do">이용안내</a></th>
       </tr>
       <tr>
        <th><a href="../customer/ask.do">1:1 문의하기</a></th>
       </tr>
      </table>
    </div>
  <!-- 사이드 메뉴 끝 -->
  
  <!-- content 시작 -->
  <div id ="content" class="col-lg-9">
    <div class="container" > 
      <div class="row-lg-1">
       <b style="font-size: 23px">이용안내</b>
      </div>
      <div style="height: 10px;"></div>
      <div class="row-lg-3" style="background-color: white">
       <!-- TO_DO : 포스터 내용 우리 이름으로 수정해서 넣기 -->
       <img src="https://post.malltail.com/img/banner/banner_malltail_howto.jpg" style="width: 760px">
      </div>
      <div style="height: 15px;"></div>
      <div class="row-lg-3 rows text-center">
      
         <!-- 이용 안내 테이블 -->
        <table class="table table-hover" style="width:750px">
          <thead style="background-color: #D0F1FB">
           <tr>
            <th width="10%" class="text-center">번호</th>
            <th width="50%" class="text-center">제목</th>
            <th width="20%" class="text-center">작성일</th>
            <th width="10%" class="text-center">조회수</th>
          </tr>
         </thead>
         <tbody>
          <c:forEach var="vo" items="${list }">
           <tr> 
            <td width="10%" class="text-center">${vo.iuno }</td>
            <td width="50%" class="text-left">
              <a href="../customer/iuDetail.do?iuno=${vo.iuno}" style="color: black">${vo.subject }</a>
            </td>
            <td width="20%" class="text-center">${vo.dbday }</td>
            <td width="10%" class="text-center">${vo.hit }</td>
          </tr>
          </c:forEach>
          <tr> 
           <td colspan="5" class="text-center">
             <a href="../customer/iu.do?page=${curpage>1? curpage-1:curpage }" class="btn btn-sm" style="background-color:#D0F1FB "">이전</a>
          	 <b> ${curpage  } / ${totalpage }</b>
            <a href="../customer/iu.do?page=${curpage<totalpage? curpage+1:curpage }" class="btn btn-sm" style="background-color:#D0F1FB "">다음</a>
          </td>
          </tr>
         </tbody>
        </table>
      </div> <!-- row-lg-3 끝 -->
    </div> <!-- container 끝 -->
  </div> 
  <!--  content 끝 -->
  </div> <!-- row 끝 -->
  </div> <!-- 첫번째 container 끝 -->
</div>
</body>
</html>