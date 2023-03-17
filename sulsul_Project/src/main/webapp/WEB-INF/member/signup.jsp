<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            document.getElementById("addr2").focus();
        }
    }).open();
}
</script>
</head>
<body>
  <div class="page-heading bg-light">
    <div class="container">
      <div class="row align-items-end text-center">
        <div class="col-lg-7 mx-auto">
          <h1>Sign up</h1>  
          <p class="mb-4"><a href="../main/main.do">Home</a> / <strong>Sign up</strong></p>        
        </div>
      </div>
    </div>
  </div>

<!-- 회원가입 폼 영역 -->
  <div class="untree_co-section">
    <div class="container">
      <div class="row rows">
        <div class="col-lg-3">
         
        </div>
        <div class="col-lg-6">
          <div class="custom-block" data-aos="fade-up" data-aos-delay="100">
            <h2 class="section-title">회원 가입</h2>
            <!-- <form class="contact-form" method="post" id="signupForm"> -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="" for="name">이름</label>
                    <input type="text" class="form-control" id="name" v-model="name" ref="name">
                  </div>
                </div>
                <div class="col-md-6"></div>
              </div>
              <div class="row">
                <div class="col-md-8">
                  <div class="form-group">
                    <label class="" for="id">아이디</label>
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="5자리 이상의 ID를 입력하세요" id="id" v-model="id" ref="id">
                      <div width="10px"></div>
                      <button class="btn btn-default" style="background-color:#c71585; color:white;" type="button" id="checkIdBtn" v-on:click="idCheck()">중복확인</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-4"></div>
              </div>
              <div class="row">
                <div class="col-md-8">
                  <div class="form-group">
                    <label class="" for="password">비밀번호</label>
                    <input type="password" class="form-control" placeholder="" id="password" v-model="password" ref="password">
                  </div>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-8">
                  <div class="form-group">
                    <label class="" for="pwCheck">비밀번호 확인</label>
                    <input type="password" class="form-control" id="pwCheck" v-model="pwCheck">
                    <div v-if="password!==pwCheck">
                      <small id="pwHelp" class="form-text text-muted">입력하신 비밀번호와 일치하지 않습니다.</small>
                    </div>
                  </div>
                </div>
                <div class="col-md-4"></div>
              </div>
              <div class="form-group">
			    <p class="d-inline-block align-top">성별</p>&nbsp;&nbsp;
			    <div class="d-inline-block">
			      <div class="radio">
			        <input id="m" name="sex" type="radio" value="남자" v-model="picked">
			        <label for="radio-1" class="radio-label">남자</label>
			      </div>
			      <div class="radio">
			        <input id="w" name="sex" type="radio" value="여자" v-model="picked">
			        <label for="radio-2" class="radio-label">여자</label>
			      </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <p>
				  <label for="bday">생년월일</label>
    			  <input id="bday" type="text" name="mb_date" v-model="bday" ref="bday"
    			    oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/^(19[0-9][0-9]|20\d{2})?(0[0-9]|1[0-2])?(0[1-9]|[1-2][0-9]|3[0-1])$/,'$1-$2-$3').replace('--', '-')" maxlength="11"
    			  >
 				</p>
			  </div>
              <div class="row">
                <div class="col-md-8">
                  <div class="form-group">
                    <label class="" for="tel">전화번호</label>
                    <input type="text" class="form-control" id="tel" v-model="tel" ref="tel" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,'$1-$2-$3').replace('--', '-')" maxlength="13">
                  </div>
                </div>
                <div class="col-md-4"></div>
              </div>
              <div class="row">
                <div class="col-md-8">
                  <div class="form-group">
	                <label class="" for="email">이메일</label>
	                <div class="input-group">
	                  <input type="email" class="form-control" id="email" v-model="email" ref="email">
	                  <button class="btn btn-default" style="background-color:#c71585; color:white;" type="button" v-on:click="emailCheck()">중복확인</button>
	                </div>
	              </div>
                </div>
              </div>
              
<!--               
			<div class="form-group">
                    <label class="" for="id">아이디</label>
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="아이디 조건" id="id" v-model="id" ref="id">
                      <div width="10px"></div>
                      <button class="btn btn-default" style="background-color:#c71585; color:white;" type="button" id="checkIdBtn" v-on:click="idCheck()">중복확인</button>
                    </div>
                  </div>
-->
              
			  <div class="form-group">
			    <label class="" for="postcode" name="postcode" >주소</label>
			    <div class="input-group">
				  <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" v-model="postcode" ref="postcode">
				  <input type="button" class="btn btn-default" style="background-color:#c71585; color:white;" onclick="daumAddressAPI()" value="우편번호 찾기">
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" id="addr1" name="addr1" v-model="addr1" placeholder="주소" ref="addr1">
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" id="addr2" name="addr2" v-model="addr2" placeholder="상세주소">
				</div>
			  </div>
            </div>
            <div class="text-center" style="margin:70px 0 0 0">
          	  <input type=button class="btn btn-primary" style="background-color:#991167; color:white; font-size:18px; padding: 15px 30px" value="Sign Up" v-on:click="signUp()">  
            </div>
        </div>
      </div>
    </div>
  </div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  name:'',
		  id:'',
		  password:'',
		  pwCheck:'',
		  picked:'',
		  bday:'',
		  tel:'',
		  email:'',
		  postcode:'',
		  addr1:'',
		  addr2:''
	  },
	  methods:{
		  idCheck:function(){
				if(this.id==='')
			    {
					this.$refs.id.focus()
					return
			    }
				let _this=this
				axios.get('http://localhost/web/member/idcheck_vue.do',{
					params:{
						id:this.id
					}
				}).then(function(response){
					let result=response.data
					if(result==='yes')
					{
						alert(_this.id+"는 사용 가능한 ID입니다")
					}
					else
					{
						alert(_this.id+"는(은) 이미 존재하는 ID입니다");
						_this.id=''
						_this.$refs.id.focus()
					}
				})
		  },
		  emailCheck:function(){
				if(this.email==='')
			    {
					this.$refs.email.focus()
					return
			    }
				let _this=this
				axios.get('http://localhost/web/member/emailcheck_vue.do',{
					params:{
						email:this.email
					}
				}).then(function(response){
					let result=response.data
					if(result==='yes')
					{
						alert(_this.email+"는 사용 가능한 이메일입니다")
					}
					else
					{
						alert(_this.email+"는(은) 이미 등록된 이메일입니다");
						_this.email=''
						_this.$refs.email.focus()
					}
				})
		  },
		  signUp:function(){
			  let _this=this
			  // password,name,tel,bday => not null
			  if(this.name===''){
				  alert("이름을 입력하세요")
				  this.$refs.name.focus()
				  return
			  }
			  else if(this.id===''||this.id.length<5){
			  	  alert("조건에 따라 ID를 입력하세요.")
				  this.$refs.id.focus()
				  return
			  }
			  else if(this.password===''){
				  alert("비밀번호를 입력하세요.")
				  this.$refs.password.focus()
				  return
			  }
			  else if(this.bday===''){
				  alert("생년월일을 입력하세요.")
				  this.$refs.bday.focus()
				  return
			  }
			  else if(this.tel===''){
				  alert("전화번호를 입력하세요.")
				  this.$refs.tel.focus()
				  return
			  }
			  else if(this.email===''){
				  alert("이메일을 입력하세요.")
				  this.$refs.email.focus()
				  return
			  }
			  axios.get('http://localhost/web/member/signup_done.do',{
				  params:{
					  id:this.id,
					  password:this.password,
					  name:this.name,
					  sex:this.picked,
					  bday:this.bday,
					  tel:this.tel,
					  email:this.email,
					  postcode:this.$refs.postcode.value,
					  addr1:this.$refs.addr1.value,
					  addr2:this.addr2
				  }
			  }).then(function(response){
				  alert(_this.id+"님 환영합니다!")
				  location.href="../member/login.do"
			  })
		  }
	  }
  })
</script>
</body>
</html>