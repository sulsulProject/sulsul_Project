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
	<div class="untree_co-section regulars">
		<div class="container">
			<h2 class="text-center">모임생성</h2>
		
		<table class="table">
  	    <tr>
  	      <th width=20%>모임 이름</th>
  	      <td width=80%><input type=text size="95" class="input-sm" v-model="name"></td>
  	    </tr>
  	    
  	    <!-- <tr>
  	      <th width=20%>카테고리</th>
  	      <td width=80%>
  	      	<div class="btn-group">
			  <button type="button" value="1" class="btn btn-sm btn-primary">취미</button>
			  <button type="button" value="2" class="btn btn-sm btn-info">방송/연예</button>
			  <button type="button" value="3" class="btn btn-sm btn-warning">게임</button>
			  <button type="button" value="4" class="btn btn-sm btn-danger">맛집/요리</button>
			  <button type="button" value="5" class="btn btn-sm btn-success">문화/예술</button>
			  <button type="button" value="6" class="btn btn-sm btn-default">교육/공부</button>
			  <button type="button" value="7" class="btn btn-sm btn-info">친목/모임</button>
			</div>
		  </td>
  	    </tr> -->
  	   
  	    <tr>
  	      <th width=20%>소개</th>
  	      <td width=80%><textarea rows="10" cols="95" v-model="content"></textarea></td>
  	    </tr>
  	    <tr>
  	      <td colspan="2" class="text-center">
  	        <input type=button value="모임생성" class="btn btn-sm btn-primary" v-on:click="create()">
  	        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
  	      </td>
  	    </tr>
  	  </table>
  	  </div>
	</div>
	
	<script>
	new Vue({
		el:'.regulars',
		data:{
			name:'',
			content:'',
			src='../regular/detail.do'
		},
		methods:{
			create:function(){
				//location.href="../main/main.do"
				let _this = this;
				axios.get('http://localhost/web/regular/insert_vue.do',{
					params:{
						name:this.name,
						content:this.content
					}
				}).then(function(response){
					/* location.href="../regular/detail.do" */
				})
			}
		}
	})
	</script>
</body>
</html>