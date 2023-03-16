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
</head>
<body>
<div class="untree_co-section rows"> 
  <main>
  <div class="container">
   <div class="row">
      <div class="col-lg-1"></div> 
     
     <!-- detail 상세 내용 -->
     <div class="col-lg-10">
     <div style="height: 80px"></div>
      <div class="text-center" style="background-color: #D0F1FB; height:120px;padding-top:30px">
        <b style="font-size: 40px">1:1 문의내용</b>
          <p class="mb-4">
          <a href="../main/main.do">Sul</a> / <strong>고객센터</strong></p>        
      </div> 
        <div style="height: 30px"></div>
	   <table class="table" >
	   <tr>
	      <th width=20% class="text-center">번호</th>
	      <td width=30% class="text-center">{{ask_detail.ano}}</td>
	      <th width=20% class="text-center">작성일</th>
	      <td width=30% class="text-center">{{ask_detail.dbday}}</td>
	    </tr>
	    <tr>
	     <th width=20% class="text-center">아이디</th>
	     <td width=30% class="text-center">{{ask_detail.id}}</td>
	     <th width=20% class="text-center"></th> <!-- 첨부 파일 자리 -->
	     <td width=30% class="text-center"></td>
	    </tr>
	    <tr>
	     <th width=20% class="text-center">제목</th>
	     <td width=30% class="text-center">{{ask_detail.subject}}</td>
	     <th width=20% class="text-center"></th> <!-- 첨부 파일 자리 -->
	     <td width=30% class="text-center"></td>
	    </tr>
	    <tr>
	     <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">{{ask_detail.content}}</pre></td>
	    </tr>
	    <tr>
	     <td colspan="4" class="text-right">
	      <a :href="'../customer/ask_update.do?ano='+ask_detail.ano" class="btn btn-sm" style="background-color:#D0F1FB">수정</a>
	      <a :href="'../customer/ask_delete.do?ano='+ask_detail.ano" class="btn btn-sm" style="background-color:#DCDCDC">삭제</a>
	      <a href="../customer/ask.do" class="btn btn-sm" style="border-color:#D0F1FB ">목록</a>
	     </td>
	    </tr>
	   </table> 
     </div>
     <div class="col-lg-1"></div> 
    </div> <!-- row -->
   </div> <!--container  -->
   </main>
</div><!-- untree_co-section -->
<script>
	new Vue({
		el:'.rows',
		data:{
			ano:${ano},
			ask_detail:{}
		},
		mounted:function(){
			let _this=this
			axios.get("http://localhost/web/customer/ask_detail_vue.do",{
				params:{
					ano:this.ano
				}
			}).then(function(response){
				console.log(response.data)
				_this.ask_detail=response.data
			})
		}
	
	})
</script>
</body>
</html>