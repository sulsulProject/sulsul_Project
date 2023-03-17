<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script rel="script" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumAddressAPI() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            $("#postcode").val(data.zonecode);
            $("#addr1").val(addr);
            $("#addr2").val(""); // addr2 값을 초기화.
            $("#addr2").focus();
        }
    }).open();
}
</script>
<style type="text/css">
.teduri{
box-shadow: 0px 10px 40px 0px rgb(192 192 192 / 20%);
margin-left:50px;
} 
</style>
</head>
<body>
    <div class="col-md-7 teduri">
    <h2>회원 정보 수정</h2>
    <table class="table hhh">
      <tr>
       <th class="text-right" width=15%>아이디</th>
       <td width=85% class="inline">
          ${sessionScope.id}
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
       {{member_info.Bday}}
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>이메일</th>
       <td width=85% class="inline">
         <input type="text" name=email id=email size=30 class="input-sm" :value = "member_info.email" ref="email">
         <!-- 1. 버튼에서 처음 시작  이메일 확인-->
         <input type=button id="eBtn" class="btn btn-xs btn-dark" value="이메일확인" v-on:click="emailChk()">
         &nbsp;<span style="color:blue" id="ePrint"></span>
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>우편번호</th>
       <td width=85% class='inline'>
          <input type="text" id="postcode" class="input-sm" :value="member_info.postcode" name="postcode"  ref="postcode">
          <input type="button" onclick="daumAddressAPI()" value="우편번호 찾기" style="" class="btn btn-xs btn-dark"><br>
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>주소</th>
       <td width=85%>
       <input type="text" id="addr1" name="addr1" size=30 class="input-sm" :value = "member_info.addr1" ref="addr1">
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>상세주소</th>
       <td width=85%>
       <input type="text" id="addr2" name="addr2" size=30 class="input-sm" :value ="member_info.addr2" ref="addr2">
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>전화번호</th>
       <td width=85% class="inline">
         <input type="text" name=tel id=tel size=30 class="input-sm" :value = "member_info.tel" ref="tel">
         <input type=button id="tBtn" class="btn btn-xs btn-dark" value="번호확인"  v-on:click="telChk()">
         &nbsp;<span style="color:blue" id="tPrint"></span>
       </td>
      </tr>
      <tr>
       <th class="text-right" width=15%>비밀번호</th>
       <td width=85%>
       <input type="password" id="pwd" name="pwd" size=30 class="input-sm" value = "" ref="pwd">
       </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <input type=button class="btn btn-xs btn-dark" value="회원수정"
           id="joinBtn" v-on:click="infoUpd()"
         >
         <input type=button class="btn btn-xs btn-dark" value="취소"
          onclick="javascript:history.back()"
         >
        </td>
      </tr>
    </table>
     </div>
   <script>
   new Vue({
	   el:'.teduri',
	   data:{
		   member_info:{},
		   email:'',
		   postcode:'',
		   addr1:'',
		   addr2:'',
		   tel:'',
		   pwd:''
	   },
	   mounted:function(){
			  let _this=this
			  axios.get("http://localhost/web/member/member_info_vue.do").then(function(response){
				  _this.member_info=response.data
			  })
			  
		  },
		  methods:{
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
					  _this.$refs.email.value="";
					  _this.$refs.email.focus();
				  }
				  else if(res==='EMAILY'){
					  alert("사용 가능한 이메일 입니다!");
					  _this.$refs.postcode.focus();
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
					  _this.$refs.tel.value='';
					  _this.$refs.tel.focus();
				  }
				  else if(res==='TELY'){
					  alert("사용 가능한 번호 입니다!");
					  _this.$refs.tel.focus();
					  _this.$refs.pwd.focus();
				  }
			  })
	 	},
	 	infoUpd:function(){
	 		let _this=this
	 		axios.get('http://localhost/web/mypage/mypage_info_update_vue.do',{
	 			params:{
	 				   
		 			   email:this.$refs.email.value,
		 			   postcode:this.$refs.postcode.value,
	 				   addr1:this.$refs.addr1.value,
	 				   addr2:this.$refs.addr2.value,
	 				   tel:this.$refs.tel.value,
	 				   password:this.$refs.pwd.value
	 				   
	 			}
	 		}).then(function(response){
	 			let res=response.data
	 			if(res==="yes"){
	 				 alert("회원정보가 변경되었습니다.");
	 				location.href="../mypage/mypage_info_update.do";
	 				 
	 			}else
	 				{
	 				  alert("비밀번호가 틀렸습니다.");
	 				 _this.$refs.pwd.value=""
	 				 _this.$refs.pwd.focus();
	 				 
	 				}
	 		})
	 	}	
      }
   
})
   </script>
</body>
</html>