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
        <td class="text-center">
          비밀번호:<input type="password" size="20" class="input-sm" ref="pwd" v-model="pwd">
         </td>
       </tr>
       <tr>
         <td class="text-center">
            <input type="button" value="삭제" class="btn btn-xs btn-dark" v-on:click="del()">
            <input type="button" value="취소" class="btn btn-xs btn-dark" onclick="javascript:history.back()">
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
		   pwd:''
	   },
	   methods:{
		   del:function(){
			   let _this=this
			   axios.get('http://localhost/web/notice/delete_vue.do',{
				   params:{
					   no:this.no,
					   pwd:this.pwd
				   }
			   }).then(function(response){
				   if(response.data==='yes')
					   {
					     location.href="../notice/list.do"
					   }
				   else
				   {
					  alert("비밀번호가 틀립니다!")
					  _this.pwd='';
					  _this.$refs.pwd.focus();
				   }
			   })    
		   }
	   }
   })
	   
   
  </script>
</body>
</html>