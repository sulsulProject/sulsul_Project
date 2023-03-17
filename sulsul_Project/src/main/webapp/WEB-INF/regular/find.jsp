<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.button2{
   height: 50px; 
   width: 500px;  
   border :1px solid #be539b;
}
input{
   font-size:16px;
   width:420px;
   height:100%;
   border:0px; 
   outline:none;
   float:left;
}
.button3{
   width:70px;
   height:100%;
   border:0px;
   background: #be539b;
   outline:none;
   float:right;
   color:black;
   
}
</style>
</head>
<body>
<div style="height:50px "></div>
<div class="untree_co-section regulars changes">
   <!-- 검색창 관련 내용-->
   <div class="container" style="padding-left: 340px">
    <div class="row" >
     <div>
      <form method="post" action="../regular/find.do">
         <div class="button2" >
            <input type="text" placeholder=" 검색어를 입력하세요" name="name">
             <button class="button3" >검색</button>
          </div>
        </form> 
    </div>
    </div>
  </div>
  
  <!-- 검색 결과 출력 -->
  <div style="height: 50px"></div>
      <div class="container">
         <div class="row">
               <b style="font-size:30px;">검색결과 : ${fn:length(fList) }&nbsp;개</b>
         </div>
        <div style="height: 20px"></div>
        <c:if test="${fList.size()==0  }">
           <div class="row">
             <b class="text-center" style="color:red">검색어를 확인해주세요!</b>
         </div>
      </c:if>
        <c:if test="${fn:length(fList)>0 }">
           <div class="row">
           <c:forEach var="vo" items="${fList}">
            <div class="col-md-3">
                <div class="thumbnail">
                   <a href="../regular/detail.do?no=${vo.no }">
                    <img src="${vo.poster }" style="width:230px;height: 230px">
                    <div class="caption">
                      <p class="text-center">${vo.name }</p>
                    </div>
                  </a>
                </div>
              </div>
          </c:forEach>
         </div>
      </c:if>
      </div>
   </div>
</body>
</html>