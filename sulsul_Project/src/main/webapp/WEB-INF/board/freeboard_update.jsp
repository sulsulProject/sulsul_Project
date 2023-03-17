<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
.form-group {
	margin-bottom: 15px;
}
</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>글 수정</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>Freeboard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
        <div class="form-group">
            <label for="exampleFormControlInput1"><b>제목</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" v-model="subject" :value="subject">
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2"><b>작성자</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput2" name="crea_id" v-model="name" :value="name">
        	<input type=hidden name=id size=45 value="${sessionScope.id }" v-model="id" required> 
        </div>
        
        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>내용</b></label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10" v-model="content">{{content}}</textarea>
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput3"><b>비밀번호</b></label>
            <input type="password" class="form-control" id="exampleFormControlInput3" name="crea_pwd" placeholder="비밀번호를 적어주세요." style="width: 20%" v-model="pwd" ref="pwd">
        </div>
        <div class="text-center">
        <input type="button" class="btn btn-info" value="수정" v-on:click="update()">
        <a href="../board/freeboard_list.do" class="btn btn-secondary">목록</a>
    	</div>
  </div>
</div>
<script>
	new Vue({
		  el:'.rows',
		  data:{
			  name:'',
			  subject:'',
			  content:'',
			  pwd:'',
			  id:'',
			  fbno:${fbno}
		  },
		  mounted:function(){
				  let _this=this;
				  axios.get('http://localhost/web/board/freeboard_update_vue.do',{
					  params:{
						 fbno:this.fbno
					  }
				  }).then(function(response){
					  _this.name=response.data.name
					  _this.subject=response.data.subject
					  _this.content=response.data.content
					  _thos.id=response.data.id
				  })
		  },
		  methods:{
			  update:function(){
				  let _this=this;
				  axios.get('http://localhost/web/board/freeboard_update_ok_vue.do',{
					  params:{
						 fbno:this.fbno,
						 name:this.name,
						 subject:this.subject,
						 content:this.content,
						 pwd:this.pwd,
						 id:this.id
					  }
				  }).then(function(response){
					  let res=response.data;
					  if(res==='yes')
					  {
						  location.href="../board/freeboard_detail.do?fbno="+_this.fbno
					  }
					  else
					  {
						  alert('비밀번호가 틀립니다!!')
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