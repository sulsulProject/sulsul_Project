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
     
     <!-- detail 상세 내용 -->
     <div class="col-lg-8">
     <div style="height: 80px"></div>
      <div class="text-center">
        <b style="font-size: 40px">1:1 문의 수정</b>
          <p class="mb-4">
          <a href="../main/main.do">Sul</a> / <strong>고객센터</strong></p>        
      </div> 
        <div style="height: 30px"></div>
	 <table class="table" >
	  <tr>
        <th width="20%">제목</th>
        <td width="80%"><input type="text" size="45" class="input-sm" v-model="subject" :value="subject"></td>
      </tr>
      <tr>
        <th width="20%">내용</th>
        <td width="80%"><textarea rows="10" cols="45" v-model="content" >{{content}}</textarea></td>
      </tr>
      <tr>
        <th width="20%">비밀번호</th>
        <td width="80%"><input type="password" size="10" class="input-sm" v-model="pwd" ref="pwd"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="수정하기" class="btn btn-sm" style="background-color:#D0F1FB "v-on:click="update()">
          <input type="button" value="취소" class="btn btn-sm" style="border-color:#D0F1FB "onclick="javascript:history.back()">
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
			subject:'',
			content:'',
			pwd:'',
			ano:${ano}
		},
		mounted:function(){
			let _this=this;
			axios.get('http://localhost/web/customer/ask_update_vue.do',{
	              params:{
	                 ano:this.ano
	              }
	           }).then(function(response){
	        	   console.log(response.data.subject)
	              _this.subject=response.data.subject
	              _this.content=response.data.content
	           })
		},
		methods:{
			update:function(){
				let _this=this;
				axios.get('http://localhost/web/customer/ask_update_ok_vue.do',{
	                params:{
	                   ano:this.ano,
	                   subject:this.subject,
	                   content:this.content,
	                   pwd:this.pwd
	                }
	             }).then(function(response){
	             	let res=response.data;
	             	if(res==='yes')
	             	{
	             		location.href="../customer/ask_detail.do?ano="+_this.ano 
	             	}
	             	else
	             	{
	             		alert("비밀번호가 틀립니다!")
	             		_this.pwd='';
	             		_this.$refs.pwd.focus() // $('#pwd').focus()
	             	}
	             })
				
			}
		}
	})
</script>
</body>
</html>