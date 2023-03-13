<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto">
          <h1>글 상세</h1>  
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>FreeBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
<div class="untree_co-section rows">
    <div class="container">
		<div class="wrapper row3 rows">
		  <main class="container clear">
		    <table class="table">
		      <tr>
		        <th width=20% class="text-center">번호</th>
		        <td width=30%>{{board_detail.fbno}}</td>
		        <th width=20% class="text-center">작성일</th>
		        <td width=30%>{{board_detail.dbday}}</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center">이름</th>
		        <td width=30%>{{board_detail.name}}</td>
		        <th width=20% class="text-center">조회수</th>
		        <td width=30%>{{board_detail.hit}}</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center">제목</th>
		        <td colspan="3">{{board_detail.subject}}</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center" style="padding-top: 20px;">내용</th>
		        <td colspan="3" valign="top" height="200" style="padding-top: 20px;">
		        <pre style="white-space: pre-wrap;background-color: white;border: none">{{board_detail.content}}</pre>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="4" class="text-right">
		          <a :href="'../board/freeboard_update.do?fbno='+board_detail.fbno" class="btn btn-xs btn-danger">수정</a>
		          <a :href="'../board/freeboard_delete.do?fbno='+board_detail.fbno" class="btn btn-xs btn-success">삭제</a>
		          <a href="../board/freeboard_list.do" class="btn btn-xs btn-info">목록</a>
		        </td>
		      </tr>
		    </table>
		  </main>
		</div>
	</div>
</div>

<script>
  new Vue({
	  el:'.rows',
	  data:{
		  fbno:${fbno},
		  board_detail:{}
	  },
	  mounted:function(){
		  let _this=this
		  axios.get("http://localhost/web/board/freeboard_detail_vue.do",{
			  params:{
				  fbno:this.fbno
			  }
		  }).then(function(response){
			  _this.board_detail=response.data
		  })
	  }
  })
</script>
 
</body>
</html>