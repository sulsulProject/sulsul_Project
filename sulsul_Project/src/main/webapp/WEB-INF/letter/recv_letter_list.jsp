<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/pagination.css?after">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>쪽지함</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>Letter</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
        <table class="table">
               <tr>
                 <th colspan="3" width="50%" class="text-center" style="border-right: 0.5px solid lightgray; border-bottom: 0.5px solid lightgray">
                 받은쪽지함
                 </th>
                 <th colspan="3" class="text-center" style="border-bottom: 0.5px solid lightgray">
                 보낸쪽지함
                 </th>
               </tr>
        </table>
        <div style="height: 20px"></div>
        <table class="table table-hover">
        	   <thead>
               <tr>
                 <th class="text-center" style="border-right: 0.5px solid lightgray">번호</th>
                 <th class="text-center" style="border-right: 0.5px solid lightgray">보낸사람</th>
                 <th class="text-center" style="border-right: 0.5px solid lightgray">제목</th>
                 <th class="text-center" style="border-right: 0.5px solid lightgray">받은시간</th>
                 <th class="text-center" style="border-right: 0.5px solid lightgray">읽음여부</th>
                 <th class="text-center" style="border-right: 0.5px solid lightgray">삭제여부</th>
               </tr>
        	   </thead>
               <tbody v-for="vo in recvletter_list">
               <tr style="border-bottom: 0.5px solid lightgray">
                 <td width="15%" class="text-center" style="border-right: 0.5px solid lightgray">{{vo.lno}}</td>
                 <td width="15%" class="text-center" style="border-right: 0.5px solid lightgray">{{vo.send_id}}</td>
                 <td width="35%" class="text-center" style="border-right: 0.5px solid lightgray">
                 <a :href="'../letter/recv_letter_detail.do?lno='+vo.lno">
                 {{vo.title}}
                 </a>
                 </td>
                 <td width="15%" class="text-center" style="border-right: 0.5px solid lightgray">{{vo.dbday}}</td>
                 <td width="10%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="vo.read_chk == 0">안읽음</td>
                 <td width="10%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="vo.read_chk == 1">읽음</td>
                 <td width="10%" class="text-center" style="border-right: 0.5px solid lightgray">
                 <a :href="'letter/recv_letter_delete.do?lno='+vo.lno+'&?id='+vo.recv_id">
                 삭제
                 </a>
                 </td>
               </tr>
               </tbody>
        </table>
        
		        <ul id="page_ul" style="padding-left: 0px;">
			    <li class="page_li" v-if="startPage>1"><span class="mypost_page_pre page_a" v-on:click="prev()">◀</span></li>
			    <li class="page_li" v-for="i in range(startPage, endPage)" v-if="i===curpage"><span class="mypost_page page_a li_active" v-on:click="pageChage(i)">{{i}}</span></li>
			    <li class="page_li" v-else><span class="mypost_page page_a" v-on:click="pageChage(i)">{{i}}</span></li>
			    <li class="page_li" v-if="totalpage>endPage"><span class="mypost_page_next page_a" v-on:click="next()">▶</span></li>
			    </ul>
   </div>
 </div>
 <script>
  new Vue({
	  el:'.rows',
	  data:{
		  recvletter_list:[],
		  curpage:1,
		  startPage:0,
		  endPage:0,
		  totalpage:0
	  },
	  mounted:function() {
		  this.send()
	  },
	  methods:{
		  send:function(){
			  let _this=this
			  axios.get("http://localhost/web/letter/recv_letter_list_vue.do",{
				  params:{
					  page:this.curpage
				  }
			  }).then(function(response) {
				   console.log(response.data)
				  _this.recvletter_list = response.data
				  _this.curpage = response.data[0].curpage
				  _this.totalpage = response.data[0].totalpage
				  _this.startPage = response.data[0].startPage
				  _this.endPage = response.data[0].endPage
			  })
		  },
		  range: function(min, max){
			  let array = [],
			  j = 0;
			  for(let i=min; i<= max; i++){
				  array[j] = i;
				  j++;
			  }
			  return array;
		  },
		  pageChage:function(page){
			  this.curpage = page;
			  this.send();
		  },
		  find:function() {
			  this.curpage=1;
			  this.send();
		  },
		  next:function() {
			  this.curpage=this.endPage+1;
			  this.send();
		  },
		  prev:function() {
			  this.curpage=this.startPage-1;
			  this.send();
		  }
	  }
  })
</script>
</body>
</html>