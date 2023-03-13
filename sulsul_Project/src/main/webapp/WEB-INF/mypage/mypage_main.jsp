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
th,h1,h2,li,hhh{font-family: "Playfair Display", serif;}
teduri{
border: 1px solid black;
}
</style>
</head>
<body>
<div class="untree_co-section rows">
  <div class="container">
    <div style="height: 30px"></div>
    <h2>${sessionScope.name}님의 Mypage 입니다.</h2>
    <div style="height: 30px"></div>
     <div>
       <div class="col-md-3">
          <ul class="list-unstyled categories">
            <li><a href="#">회원 정보 수정</a></li>
            <li><a href="#">비밀번호 변경</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">좋아요</a></li>
            <li><a href="#">주문내역</a></li>
          </ul>
        </div>
     </div>
  <div class="col-md-6 memberInfoUpdate teduri">
    <table class="table hhh">
      <tr>
       <th class="text-right" width=15%>아이디</th>
       <td width=85% class="inline">
          ${sessionScope.id}
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>비밀번호</th>
       <td width=85% class="inline">
         <input type=password name=pwd id=join_pwd size=30 class="input-sm" ref="pwd">
         <input type=button id="pBtn" class="btn btn-xs btn-dark" value="비밀번호변경" v-on:click="pwdUpdate()">
         &nbsp;<span style="color:blue" id="pPrint"></span>
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>이름</th>
       <td width=85%>
       ${sessionScope.name }
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>생년월일</th>
       <td width=85%>
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>이메일</th>
       <td width=85% class="inline">
       <!-- value = ${sessionScope.email} -->
         <input type="text" name=email id=email size=30 class="input-sm" value = "shim@co.kr" ref="email">
         <!-- 1. 버튼에서 처음 시작  이메일 확인-->
         <input type=button id="eBtn" class="btn btn-xs btn-dark" value="이메일확인" v-on:click="emailChk()">
         &nbsp;<span style="color:blue" id="ePrint"></span>
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>우편번호</th>
       <td width=85% class='inline'>
         <input type=button id="postBtn" value="우편번호찾기"
          class="btn btn-xs btn-dark">
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>주소</th>
       <td width=85%>
         <!-- value = ${sessionScope.addr1} -->
       <input type="text" id="addr1" name="addr1" size=30 class="input-sm" value = "서울특별시">
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>상세주소</th>
       <td width=85%>
       <input type="text" id="addr1" name="addr1" size=30 class="input-sm" value = "서울특별시">
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>전화번호</th>
       <td width=85% class="inline">
         <input type="text" name=tel id=tel size=30 class="input-sm" value = "010-1234-1234" ref="tel">
         <input type=button id="tBtn" class="btn btn-xs btn-dark" value="번호확인"  v-on:click="telChk()">
         &nbsp;<span style="color:blue" id="tPrint"></span>
       </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <input type=button class="btn btn-xs btn-dark" value="회원수정"
           id="joinBtn"
         >
         <input type=button class="btn btn-xs btn-dark" value="취소"
          onclick="javascript:history.back()"
         >
        </td>
      </tr>
    </table>
     </div>
  </div>
  </div>
<script>
 new Vue({
	  el:'.memberInfoUpdate',
	  data:{
		  id:'',
		  password:'',
		  birth:'',
		  post:'',
		  email:'',
		  addr1:'',
	      addr2:'',
		  tel:''
	  },
	 methods:{
		 //2.버튼 클릭시 호출되는 함수
		 emailChk:function(){
			 //이메일 입력란에 입력된 값 가져오기(입력칸의 refs)
			 oldEmail = this.$refs.email.value; //입력칸에 입력된 이메일
			  if(oldEmail.trim()==""){
				  //동시에 발생하면 포커스가 가지 않기때문에, 이메일 입력 알럿 확인 후(.then) 포커스 이동
				  alert("이메일을 입력해 주세요.").then(function(){this.$refs.email.focus();});
				  return
			  }
			  let _this=this;
			  //3. 컨트롤러 호출
			  axios.get('http://localhost/web/mapage/mypage_email_chk_vue.do',{
				  //컨트롤러 변수가 되는 파람
				  params:{
					  email:oldEmail
				  }
			  //8. 컨트롤러에서 쿼리가 실행된 후 일어나야하는 로직이므로 (.then))
			  }).then(function(response){
				  //응답 값을 가지고 조건문으로 끝.
				  let res=response.data.trim();
				  if(res==='EMAILN'){
					  alert("존재하는 이메일 입니다!");
					  email='';
					  this.$refs.email.focus();
				  }
				  else if(res==='EMAILY'){
					  alert("사용 가능한 이메일 입니다!");
					  email='';
					  this.$refs.email.focus();
				  }
			  })
	 	},
	 	pwdUpdate:function(){
	 		debugger;
			 newPwd = this.$refs.pwd.value; //입력칸에 입력된 비밀번호(변경할 비밀번호)
			 //oldPwd = ${sessionScope.pwd}; //기존 비밀번호
			  if(newPwd.trim()==""){
				  alert("비밀번호를 입력해 주세요.").then(function(){this.$refs.pwd.focus();});
				  return;
			  }
			 /* if(newPwd == oldPwd){
				 alert("기존 비밀번호와 동일합니다.<br>다른 번호를 입력해 주세요.").then(function(){this.$refs.pwd.focus();});
				  return
			 } */
			  let _this=this;
			  axios.get('http://localhost/web/mypage/mypage_pwd_update_vue.do',{
				  params:{
					  pwd:newPwd
				  }
			  }).then(function(response){
				  let res=response.data.trim();
				  if(res==='SUCCESSY'){
					  alert("비밀번호가 변경되었습니다!");
					  pwd='';
					  this.$refs.pwd.focus();
				  }else{
					  alert("비밀번호 변경에 실패했습니다!");
					  pwd='';
					  this.$refs.pwd.focus();
				  }
			  })
	 	},
	 	telChk:function(){
	 		 //이메일 입력란에 입력된 값 가져오기(입력칸의 refs)
			 oldTel = this.$refs.tel.value; //입력칸에 입력된 이메일
			  if(oldTel.trim()==""){
				  //동시에 발생하면 포커스가 가지 않기때문에, 이메일 입력 알럿 확인 후(.then) 포커스 이동
				  alert("전화번호를 입력해 주세요.").then(function(){this.$refs.tel.focus();});
				  return
			  }
			  let _this=this;
			  //3. 컨트롤러 호출
			  axios.get('http://localhost/web/mapage/mypage_tel_chk_vue.do',{
				  //컨트롤러 변수가 되는 파람
				  params:{
					  tel:oldTel
				  }
			  //8. 컨트롤러에서 쿼리가 실행된 후 일어나야하는 로직이므로 (.then))
			  }).then(function(response){
				  //응답 값을 가지고 조건문으로 끝.
				  let res=response.data.trim();
				  if(res==='TELN'){
					  alert("사용 불가능한 번호 입니다!");
					  tel='';
					  this.$refs.tel.focus();
				  }
				  else if(res==='TELY'){
					  alert("사용 가능한 번호 입니다!");
					  tel='';
					  this.$refs.tel.focus();
				  }
			  })
	 	}
	 	
 	}
})
</script>
</body>
</html>