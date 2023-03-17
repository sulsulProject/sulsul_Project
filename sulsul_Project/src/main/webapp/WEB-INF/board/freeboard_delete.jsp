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
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>글 삭제</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>FreeBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
<div class="untree_co-section rows">
    <div class="container">
      <table class="table">
	      <tr>
	        <td class="text-center inline">
	         비밀번호 : <input type=password size=20 class="input-sm" ref="pwd" v-model="pwd">
	        </td>
	      </tr>
	      <tr>
	        <td class="text-center">
	          <input type=button value="삭제" class="btn btn-sm btn-danger" v-on:click="del()">
	          <input type=button value="취소" class="btn btn-sm btn-danger"  onclick="javascript:history.back()">
	        </td>
	      </tr>
      </table>
    </div>
</div>
<script>
new Vue({
	  el:'.rows',
	  data:{
		  fbno:${fbno},
		  pwd:''
	  },
	  methods:{
		  del:function(){
			 let _this=this
			 axios.get('http://localhost/web/board/freeboard_delete_vue.do',{
				 params:{
					 fbno:this.fbno,
					 pwd:this.pwd
				 }
			 }).then(function(response){
				 if(response.data==='yes')
				 {
					 location.href="../board/freeboard_list.do"
				 }
				 else
				 {
				     alert("비밀번호가 틀립니다!!")
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