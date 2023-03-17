<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       <h1 style="margin-bottom: 20px">Notice</h1>
        <table class="table">
      <tr>
        <th width=10% class="text-center">번호</th>
        <td width=20% class="text-center">{{notice_detail.no}}</td>
        <th width=15% class="text-center">작성일</th>
        <td width=20% class="text-center">{{notice_detail.dbday}}</td>
        <th width=15% class="text-center">조회수</th>
        <td width=20% class="text-center">{{notice_detail.hit}}</td>
      </tr>
      <tr>
        <th width=20% class="text-center">제목</th>
        <td colspan="5" >{{notice_detail.subject}}</td>
      </tr>
      <tr>
        <td colspan="6" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">{{notice_detail.content}}</pre></td>
      </tr>
      <tr>
        <td colspan="6" class="text-right">
        <c:if test="${sessionScope.admin=='y' }">
          <a :href="'../notice/update.do?no='+notice_detail.no" class="btn btn-xs btn-dark">수정</a>
          <a :href="'../notice/delete.do?no='+notice_detail.no" class="btn btn-xs btn-dark">삭제</a>
          </c:if>
          <a href="../notice/list.do" class="btn btn-xs btn-dark">목록</a>
        </td>
      </tr>
    </table>
     </div>
    </div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  no:${no},
		  notice_detail:{}
	  },
	  mounted:function(){
		  let _this=this
		  axios.get("http://localhost/web/notice/detail_vue.do",{
			  params:{
				  no:this.no
			  }
		  }).then(function(response){
			  _this.notice_detail=response.data
		  })
	  }
  })
</script>
</body>
</html>