<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contents{font-family: "Playfair Display", serif;}
.teduri3{
box-shadow: 0px 10px 40px 0px rgb(192 192 192 / 20%);
margin-left:50px;
} 
</style>
</head>
<body>
<div class="col-md-8 teduri3">
<h2 >회원관리</h2>
   <table class="table contents">
       <thead>
        <tr>
          <th width=10% class="text-center" >id</th>
          <th width=15% class="text-center" >이름</th>
          <th width=10% class="text-center">성별</th>
          <th width=30% class="text-center">email</th>
          <th width=30% class="text-center">전화번호</th>
          <th width=10% class="text-center">관리</th>
        </tr>
       </thead>
         <tbody>
          <tr v-for="vo in member_list">
         <td width=10% class="text-center" style="color: #F7CAC9;"><b>{{vo.id}}</b></td>
         <td width=15% class="text-center" style="color: #92A8D1;"><b>{{vo.name}}</b></td>
         <td width=10% class="text-center">{{vo.sex}}</td> 
         <td width=30% class="text-center">{{vo.email}}</td> 
        <td width=30% class="text-center">{{vo.tel}}</td>
        <td width=10% class="text-center">
        <input type="button" value="강퇴" class="btn btn-xs btn-dark" v-on:click="del(vo.id)">
        </td>
      </tr> 
      <tr>
        <td colspan="7" class="text-center">
         <input type=button value="이전"  class="btn btn-xs btn-dark " v-on:click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button value="다음"  class="btn btn-xs btn-dark" v-on:click="next()">
        </td>
      </tr>
     </tbody>  
     </table>
    </div>
    <script>
    new Vue({
    	el:'.teduri3',
    	data:{
    		member_list:[],
    		curpage:1,
    		totalpage:1
    	},
    	  mounted:function(){
      		  this.send()
      		  
      	  },
      	  methods:{
      		  send:function(){
      		  let _this=this
      		  axios.get("http://localhost/web/adminpage/adminpage_member_list_vue.do",{
      			  params:{
      				  page:this.curpage
      			  }
      		  }).then(function(response){
      			  console.log(response.data)
      			  _this.member_list=response.data
      			  _this.curpage=response.data[0].curpage
      			  _this.totalpage=response.data[0].totalpage
      		  })
      	   },
      	   prev:function(){
      			  this.curpage=this.curpage>1?this.curpage-1:this.curpage
      			  this.send()
      		  },
      		  next:function(){
      			  this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
      			  this.send()
      		  },
      		del: function(id) {
      		  let _this = this;
      		  if (confirm("정말 강퇴시키겠습니까?")) {
      		    axios
      		      .get("http://localhost/web/adminpage/admin_member_delete_vue.do", {
      		        params: {
      		          id: id,
      		        },
      		      })
      		      .then(function(response) {
      		        alert("회원을 강퇴시킵니다.");
      		        location.href = "../adminpage/admin_member_list.do";
      		      });
      		  }
      		}
      	  }
    })
    </script>
</body>
</html>