<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<!-- <div style="height: 80px"></div> -->
<div class="untree_co-section" >
 <div class="container" > <!-- controller div태그 줄지 고민중 -->
   <div class="row">
   <div style="height: 50px"></div>
   <!-- TO_DO : 고객센터 문의하기 배너 추가할지 말지 고민중 -->
   <div class="col-lg-1"></div>
    <div class="col-lg-10">
      
       <div class="text-right">
        <a href="../customer/iu.do?page=1" class="btn btn-smtext-right"style="background-color:#D0F1FB;" >
        <span style="font-size: 15px">목록</span>
        </a>   
       </div>
       <div style="height:20px"></div>
       <div class="text-center">
        <b style="font-size: 30px;text-decoration:underline" >${vo.subject }</b>
       </div>
       
     <div style="height: 20px"></div>
     <div>
     <c:forEach var="image" items="${list }">  
         <img src="${image }" style="height: 100%;width:900px">
     </c:forEach>     
    </div>
   </div>
   <div class="col-lg-1"></div>
   </div>
 </div> <!-- container 끝 -->
</div> <!-- untree_co-section
 끝 -->
</body>
</html>