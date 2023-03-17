<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
th,h1{font-family: "Playfair Display", serif;}
.contents {
    clear: both;
    position: relative;
    padding: 20px;
    border-bottom: 1px solid #ddd;
}
.untree_co-section {
    padding: 10px 0;
    position: relative;
}
</style>
</head>
<body>
<div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>Notice</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>Notice</strong></p>        
        </div>
      </div>
    </div>
  </div>
<div class="untree_co-section rows" >
    <div class="container">
     <!--   관리자 권한-->
      <div style="float: right;">
         <c:if test="${sessionScope.admin=='y' }">
          <a href="../notice/insert.do" class="btn btn-xs btn-dark">new</a>
         </c:if>
       </div> 
      <table class="table contents">
       <thead>
        <tr>
          <th width=10% class="text-center">No.</th>
          <th width=45% class="text-center">제목</th>
          <th width=20% class="text-center">작성일</th>
          <th width=10% class="text-center">조회수</th>
        </tr>
       </thead>
       <tbody>
       <tr v-for="vo in notice_list">
        <td width=10% class="text-center">{{vo.no}}</td>
        <td width=45%><a :href="'../notice/detail.do?no='+vo.no">{{vo.subject}}</a></td>
        <td width=20% class="text-center">{{vo.dbday}}</td>
        <td width=10% class="text-center">{{vo.hit}}</td>
      </tr>
      <tr>
        <td colspan="5" class="text-center">
         <input type=button value="이전"  class="btn btn-xs btn-dark " v-on:click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button value="다음"  class="btn btn-xs btn-dark" v-on:click="next()">
        </td>
      </tr>
     </tbody>
      </table>
    </div>
  </div>  
  <script>
  new Vue({
	  el:'.rows',
	  data:{
		  notice_list:[],
		  curpage:1,
		  totalpage:0
	  },
	  mounted:function(){
		  this.send()
	  },
	  methods:{
		  send:function(){
			  let _this=this
			  axios.get("http://localhost/web/notice/list_vue.do",{
				  params:{
					  page:this.curpage
				  }
			  }).then(function(response){
				  console.log(response.data)
				  _this.notice_list=response.data
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
		  }
	  }
  })
</script>
</body>
</html>