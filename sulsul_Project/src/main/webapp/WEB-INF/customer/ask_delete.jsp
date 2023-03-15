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
<div class="untree_co-section rows"> 
  <div class="container">
   <div class="row">
     <div class="col-lg-2"></div>
     
     <!-- 비밀번호 확인 -->
     <div class="col-lg-8">
     <div style="height: 80px"></div>
       <table class="table">
        <tr>
         <td class="text-center">
          비밀번호&nbsp;:&nbsp;<input type="password" size=20 class="input-sm" ref="pwd" v-model="pwd">
         </td>
        </tr>
        <tr>
         <td class="text-center">
          <input type="button" value="삭제하기" class="btn btn-sm" style="background-color:#D0F1FB"  v-on:click="del()">
       <input type="button" value="취소" class="btn btn-sm " style="border-color:#DCDCDC" onclick="javascript:history.back()">
         </td>
        </tr>
       </table>
     </div>
     
    <div class="col-lg-2"></div>
   </div>
  </div>
</div>
<script>
	new Vue({
		el:'.rows',
		data:{
			ano:${ano},
			pwd:''
		},
		methods:{
			del:function(){
				let _this=this
				axios.get('http://localhost/web/customer/ask_delete_vue.do',{
					params:{
						ano:this.ano,
						pwd:this.pwd
					}
				}).then(function(response){
					console.log(response.data)
					if(response.data==='yes')
					{
						location.href="../customer/ask.do"
					}
					else
					{
						alert("비밀번호가 틀립니다")
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