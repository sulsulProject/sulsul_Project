<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.min.js"></script>
</head>
<body>
  <div class="page-heading bg-light" >
    <div class="container">
      <div class="row align-items-end text-center">
        <div class="col-md-7 mx-auto">
          <h1>아이디 찾기</h1>
          <p class="mb-4"><a href="../main/main.do">Home</a> / <strong>아이디 찾기</strong></p>        
        </div>
      </div>
    </div>
  </div>
  <div class="untree_co-section log-in">
    <div class="container">
      <div class="row rows">
        <div class="col-lg-2">
        
        </div>
        <div class="col-lg-8">
           <div class="mr-auto order-1" data-aos="fade-up" data-aos-delay="200">
	          <div class="idFind">
			    <b-card no-body>
				  <b-tabs pills card vertical nav-wrapper-class="w-30">
				    <b-tab title="전화번호로 찾기" active>
				      <b-card-text>
				        <div class="col-lg-1"></div>
				        <div class="col-lg-10">
				            <div class="form-floating mt-3">
				             <label for="name">이름</label>
				             <input type="text" class="form-control" id="tname" name="tname" v-model="tname" ref="tname">
				            </div>
				            <div class="form-floating mt-3">
				             <label for="tel">전화번호</label>
				             <input type="text" class="form-control" id="tel" name="tel" v-model="tel" ref="tel"
				             	oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,'$1-$2-$3').replace('--', '-')" maxlength="13"
				             >
				            </div>
				            <div class="mt-3">
				              <font size="4">
				                <b v-show="wrongT" id="wrongT" v-model="wrongT" name="wrongT">
				                  <span class="text-danger">이름 또는 전화번호를 다시 확인해주세요.</span></b>
				                <b v-show="successT" id="successT" v-model="successT" name="successT">
				                  <span class="text-success">{{tname}}님의 아이디는 {{msg}}입니다.</span></b>
				              </font>
				            </div>
				            <!-- 
				            <div v-if="password!==pwCheck">
		                      <small id="pwHelp" class="form-text text-muted">입력하신 비밀번호와 일치하지 않습니다.</small>
		                    </div>
				             -->
				          <div class="mt-3 text-center">
				            <button class="btn btn-lg btn-primary" id="idfind_tel" type="button" v-on:click="idFindTel()">찾기</button>
				          </div>
				        </div>
				        <div class="col-lg-1"></div>
				      </b-card-text>
				    </b-tab>
				    <b-tab title="이메일로 찾기">
				      <b-card-text>
				        <div class="col-lg-1"></div>
				        <div class="col-lg-10">
				            <div class="form-floating mt-3">
				             <label for="name">이름</label>
				             <input type="text" class="form-control" id="ename" name="ename" v-model="ename" ref="ename">
				            </div>
				            <div class="form-floating mt-3">
				             <label for="email">이메일</label>
				             <input type="email" class="form-control" id="email" name="email" v-model="email" ref="email">
				            </div>
				            <div class="mt-3">
				              <font size="4">
				                <b v-show="wrongE" id="wrongE" v-model="wrongE" name="wrongE">
				                  <span class="text-danger">이름 또는 이메일을 다시 확인해주세요.</span></b>
				                <b v-show="successE" id="successE" v-model="successE" name="successE">
				                  <span class="text-success">{{ename}}님의 아이디는 {{msg}}입니다.</span></b>
				              </font>
				            </div>
				          <div class="mt-3 text-center">
				            <button class="btn btn-lg btn-primary" id="idfind_email" type="button" v-on:click="idFindEmail()">찾기</button>
				          </div>
				        </div>
				        <div class="col-lg-1"></div>
				      </b-card-text>
				    </b-tab>
				  </b-tabs>
				</b-card>
			  </div>


	          <div class="text-center" style="margin-top: 40px">
	            <!-- <span>아직 회원이 아니신가요?</span> -->
	            <a href="../member/signup.do" class="text-decoration-none">회원가입</a>
	              &nbsp;|&nbsp;
	            <a href="../member/login.do" class="text-secondary text-decoration-underline">로그인</a>
	          </div>
        	</div>
          </div>
          <div class="col-lg-2">
          
          </div>
      	</div>
    </div>
  </div> <!-- /.untree_co-section -->
<script>
  new Vue({
	  el:'.idFind',
	  data:{
		  tname:'',
		  ename:'',
		  tel:'',
		  email:'',
		  msg:'',
		  wrongT:false,
		  successT:false,
		  wrongE:false,
		  successE:false
	  },
	  methods:{
		  idFindTel:function(){
			  if(this.tname.trim()==""){
		          this.$refs.tname.focus();
		          return
		      }
			  if(this.tel.trim()==""){
				  this.$refs.tel.focus();
				  return
			  }
			  let _this=this
			  axios.get('http://localhost/web/member/idfind_tel_vue.do',{
				  params:{
					  name:this.tname,
					  tel:this.tel
				  }
			  }).then(function(response){
				  _this.msg=response.data;
				  console.log(_this.msg)
				  if(_this.msg==='NO'){
					  _this.wrongT=true;
				  }
				  else{
					  _this.successT=true;
				  }
			  })
		  },
		  idFindEmail:function(){
			  if(this.ename.trim()==""){
		          this.$refs.ename.focus();
		          return
		      }
			  if(this.email.trim()==""){
				  this.$refs.email.focus();
				  return
			  }
			  let _this=this
			  axios.get('http://localhost/web/member/idfind_email_vue.do',{
				  params:{
					  name:this.ename,
					  email:this.email
				  }
			  }).then(function(response){
				  _this.msg=response.data;
				  console.log(_this.msg)
				  if(_this.msg==='NO'){
					  _this.wrongE=true;
				  }
				  else{
					  _this.successE=true;
				  }
			  })
		  }
	  }
  })
</script>
</body>
</html>