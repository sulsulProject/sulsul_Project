<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.teduri2{
box-shadow: 0px 10px 40px 0px rgb(192 192 192 / 20%);
margin-left:50px;
padding: 10px;
} 
h2{margin-top: 0px;}
</style>
</head>
<body>
    <div class="col-md-7 teduri2">
     <h2>비밀번호 변경</h2>
     <table>
     <tr style="float: center;">
       <th>현재 비밀번호 :&nbsp;</th>
       <td width=75% class="inline">
         <input type=password name=oldpwd id=oldpwd size=30 class="input-sm" ref="oldpwd" v-model="oldpwd">
         <input type=button id="oBtn" class="btn btn-xs btn-dark" value="비밀번호확인" v-on:click="pwdChk()">
         &nbsp;<span style="color:blue" id="npPrint" ></span>
          </td>
         </tr>
         <tr>
       <th style="float: center;">비밀번호 :&nbsp;</th>
       <td width=80% >
         <input type=password name=newpwd id=newpwd size=30 class="input-sm" ref="newpwd" v-model="newpwd" v-bind:disabled="dd">
         <input type=button id="nBtn" class="btn btn-xs btn-dark" value="비밀번호변경" v-on:click="pwdUpdate()">
         &nbsp;<span style="color:blue" id="opPrint" ></span>
          </td>
         </tr>
        </table>
     </div>
  <script>
  new Vue({
	  el:'.teduri2',
	  data:{
		  oldpwd:'',
		  newpwd:'',
		  dd:true
	  },
	  methods:{ 
		  pwdChk:function(){
			  let _this=this
			  axios.get('http://localhost/web/mypage/mypage_pwd_chk_update_vue.do',{
				  params:{
					  pwd:this.$refs.oldpwd.value
				  }
			  }).then(function(response){
				  let res=response.data
		 			if(res==="yes"){
		 				 alert("비밀번호가 확인되었습니다.");
		 				  _this.dd=false
		 			     _this.$refs.newpwd.focus();
		 				 
		 			}else
		 				{
		 				  alert("비밀번호가 틀렸습니다.");
		 				 _this.$refs.oldpwd.value=""
		 				 _this.$refs.oldpwd.focus();
		 				 
		 				}
			  })
		  },
		  pwdUpdate:function(){
			  this.newpwd=this.$refs.newpwd.value
			  this.oldpwd=this.$refs.oldpwd.value
			  if(this.newpwd.trim()==""){
				  alert("비밀번호를 입력해 주세요.")
				  this.$refs.newpwd.focus();
			  }
			   if(this.newpwd == this.oldpwd){
				 alert("기존 비밀번호와 동일합니다. 다른 번호를 입력해 주세요.")
			  
					 this.newpwd='';
					 this.$refs.pwd.focus();
			   } 
			  axios.get('http://localhost/web/mypage/mypage_pwd_update_vue.do',{
				  params:{
					  pwd:this.newpwd
				  }
			  }).then(function(){
				 
		 				 alert("비밀번호가 변경되었습니다.");
		 				location.href="../member/login.do";		 				 
		 			
			  })
		  }
		  
		
		  
	  }
  })
 </script>
</body>
</html>