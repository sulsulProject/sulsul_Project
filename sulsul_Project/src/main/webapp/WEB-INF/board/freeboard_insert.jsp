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
          <h1>글 작성</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>FreeBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
        <div class="form-group">
            <label for="exampleFormControlInput1"><b>제목</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요." v-model="subject">
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2"><b>작성자</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput2" name="crea_id" placeholder="이름을 적어주세요." v-model="name">
        	<input type=hidden name=id size=45 value="${sessionScope.id }" v-model="id" required>
        </div>
        
        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>내용</b></label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10" v-model="content"></textarea>
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput3"><b>비밀번호</b></label>
            <input type="password" class="form-control" id="exampleFormControlInput3" name="crea_pwd" placeholder="비밀번호를 적어주세요." style="width: 20%" v-model="pwd">
        </div>
        <div class="text-center">
        <input type="button" class="btn btn-info" value="등록하기" v-on:click="write()">
        <a href="../board/freeboard_list.do" class="btn btn-secondary">목록</a>
    	</div>
  </div>
</div>
<script>
	new Vue({
		el:'.rows',
		data:{
			id:'',
			name:'',
			subject:'',
			content:'',
			pwd:''
		},
		methods:{
			write:function(){
				let _this = this;
				axios.get('http://localhost/web/board/freeboard_insert_vue.do',{
					params:{
						id:this.id,
						name:this.name,
						subject:this.subject,
						content:this.content,
						pwd:this.pwd
					}
				}).then(function(response){
					location.href="../board/freeboard_list.do"
				})
			}
		}
	})
</script>
</body>
</html>