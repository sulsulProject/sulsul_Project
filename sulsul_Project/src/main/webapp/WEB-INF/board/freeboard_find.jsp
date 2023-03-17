<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/freeboard.css?after">
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>글 목록</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>FreeBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
		<section class="board">
  <div class="container">
    <h2>검색결과</h2>
    <div style="height: 15px"></div>
    <div class="row">
     <c:if test="${count<1 }">
      <table class="table">
        <tr>
         <td class="text-center">
           <h3>검색된 결과가 없습니다</h3>
         </td>
        </tr>
      </table>
      </c:if>
      <c:if test="${count>0 }">
      <table class="table">
       <tr>
        <th class="text-right">
         총 ${count }건 검색
        </th>
       </tr>
      </table>
      <table class="board-table table-hover">
      	<thead>
        <tr>
          <th scope="col" class="th-num">번호</th>
          <th scope="col" class="th-title">제목</th>
          <th scope="col" class="th-date">작성자</th>
          <th scope="col" class="th-date">등록일</th>
          <th scope="col" class="th-date">조회수</th>
        </tr>
        </thead>
        
        <c:forEach var="vo" items="${list }">
        <tbody>
            <tr>
	          <td>${vo.fbno }</td>
	          <th><a href="../board/freeboard_detail.do?fbno=${vo.fbno}">${vo.subject }</a></th>
	          <td>${vo.name }</td>
	          <td>${vo.dbday }</td>
	          <td>${vo.hit }</td>
	        </tr>
	    </tbody>
        </c:forEach>
      </table>
      </c:if>
    </div>
  </div>
  </section>
  </div>
  </div>
</body>
</html>
