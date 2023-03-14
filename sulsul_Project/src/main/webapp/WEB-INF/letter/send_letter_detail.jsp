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
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>쪽지 상세</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>Letter</strong></p>        
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
		        <th width=20% class="text-center">받는사람</th>
		        <td width=30%>{{recv_letter_detail.recv_id}}</td>
		        <th width=20% class="text-center">받은날짜</th>
		        <td width=30%>{{recv_letter_detail.dbday}}</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center">제목</th>
		        <td colspan="3">{{recv_letter_detail.title}}</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center" style="padding-top: 20px;">내용</th>
		        <td colspan="3" valign="top" height="200" style="padding-top: 20px;">
		        <pre style="white-space: pre-wrap;background-color: white;border: none">{{recv_letter_detail.content}}</pre>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="4" class="text-right">
		          <a href="../letter/recv_letter_list.do" class="btn btn-xs btn-danger">확인</a>
		          <a :href="'../letter/letter_insert.do?recv_id='+recv_letter_detail.recv_id" class="btn btn-xs btn-info">답장</a>
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
		  lno:${lno},
		  recv_letter_detail:{}
	  },
	  mounted:function(){
		  let _this=this
		  axios.get("http://localhost/web/letter/send_letter_detail_vue.do",{
			  params:{
				  lno:this.lno
			  }
		  }).then(function(response){
			  _this.recv_letter_detail=response.data
		  })
	  }
  })
</script>
 
</body>
</html>