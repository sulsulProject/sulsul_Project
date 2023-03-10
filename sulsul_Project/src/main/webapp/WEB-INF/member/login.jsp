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
  <div class="page-heading bg-light" >
    <div class="container">
      <div class="row align-items-end text-center">
        <div class="col-md-7 mx-auto">
          <h1>Login</h1>  
          <p class="mb-4"><a href="../main/main.do">Home</a> / <strong>Login</strong></p>        
        </div>
      </div>
    </div>
  </div>
  <div class="untree_co-section log-in">
    <div class="container " >
      <div class="row  "style="padding-left: 38%">
        <div>
           <div class="col-md-5 mr-auto order-1" data-aos="fade-up" data-aos-delay="200">
	          <form action="#">
	            <div class="row">
	              <div class="col-12 mb-3">
	                <input type="text" class="form-control" placeholder="Your ID" v-model="id" ref="id">
	              </div>
	              <div class="col-12 mb-3">
	                <input type="password" class="form-control" placeholder="Your Password" v-model="password" ref="password">
	              </div>
	              <div class="col-12 mb-3">
	                <input type="checkbox" placeholder="saveID">
	                <label for="saveID" style="font-size: 12px">아이디 저장</label>
	              </div>
	              <div class="col-12 text-center">
	                <input type="button" value="Login" class="btn btn-primary" v-on:click="login()">
	              </div>
	            </div>
	          </form>
	          <div class="text-center">
	            <span>아직 회원이 아니신가요?</span>
	            <a href="#" class="text-decoration-none">
	                회원가입 GO
	            </a>
	            <div class="mb-3">
	                <a href="#" class="text-secondary text-decoration-underline">아이디 찾기</a>
	                <a href="#" class="text-secondary text-decoration-underline">비밀번호 찾기</a>
	            </div>
	          </div>
        	</div>
          </div>
      	</div>
    </div>
  </div> <!-- /.untree_co-section -->
<script>
  new Vue({
	  el:'.log-in',
	  data:{
		  id:'',
		  password:'',
		  msg:''
	  },
	  methods:{
		  login:function(){
			  if(this.id.trim()==""){
				  this.$refs.id.focus();
				  return
			  }
			  if(this.password.trim()==""){
				  this.$refs.password.focus();
				  return
			  }
			  let _this=this
			  axios.get('http://localhost/web/member/login_vue.do',{
				  params:{
					  id:this.id,
					  password:this.password
				  }
			  }).then(function(response){
				  let res=response.data.trim();
				  if(res==='NOID'){
					  alert("존재하지 않는 아이디입니다!");
					  id='';
					  password='';
					  this.$refs.id.focus();
				  }
				  else if(res==='WRONGPASSWORD'){
					  alert("비밀번호가 틀렸습니다!");
					  password='';
					  this.$refs.password.focus();
				  }
				  else{
					  location.href="../main/main.do"
				  }
			  })
		  },
		  logout:function(){
			  axios.get('http://localhost/web/member/logout_vue.do').then(function(response){
				  location.href="../main/main.do";
			  })
		  }
	  }
  })
</script>
</body>
</html>