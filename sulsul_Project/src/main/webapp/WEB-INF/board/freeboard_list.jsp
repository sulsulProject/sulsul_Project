<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/pagination.css?after">
<link rel="stylesheet" href="../css/freeboard.css?after">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>글 목록</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>FreeBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
		<section class="board">
		
		  <!-- board seach area -->
		  <div id="board-search">
		      <div class="container">
		          <div class="search-window">
		          		  <form method="post" action="../board/freeboard_find.do">
	          			  <div class="text-center" style="margin-bottom: 15px">
		                      <input type="checkbox" name="fs" value="N"> 이름
					          <input type="checkbox" name="fs" value="S"> 제목
					          <input type="checkbox" name="fs" value="C"> 내용
				          </div>
		                  <div class="search-wrap">
		                      <label for="search" class="blind">공지사항 내용 검색</label>
		                      <input id="search" type="search" name="ss" placeholder="검색어를 입력해주세요." value="">
		                      <button type="submit" class="btn btn-dark">검색</button>
		                  </div>
		                  </form>
		          </div>
		      </div>
		  </div>
		   
		  <!-- board list area -->
		  <div id="board-list">
		      <div class="container">
		          <table class="board-table table-hover">
		                <thead>
		                <tr>
		                  <th scope="col" class="th-num">번호</th>
		                  <th scope="col" class="th-title">제목</th>
		                  <th scope="col" class="th-date">작성자</th>
		                  <th scope="col" class="th-date">등록일</th>
		                  <th scope="col" class="th-date">조회수</th>
		                </tr>
		                </thead>
		                
		                <tbody v-for="vo in freeboard_list">
		                <tr>
		                    <td>{{vo.fbno}}</td>
		                    <th>
		                      <a :href="'../board/freeboard_detail.do?fbno='+vo.fbno+'&cate_no=1'">{{vo.subject}}</a>
		                    </th>
		                    <td>{{vo.name}}</td>
		                    <td>{{vo.dbday}}</td>
		                    <td>{{vo.hit}}</td>
		                </tr>
		                
		                </tbody>
		        </table>
		   </div>
	    </div>
	    <div class="text-right" style="height: 30px;">
	    <c:if test="${sessionScope.id!=null}">
	      <a href="../board/freeboard_insert.do" class="boradBtn" v-on:click="move1()">글쓰기</a>
	      <a class="boradBtn">내글보기</a>
	    </c:if>
	    </div>
	       		<ul id="page_ul" style="padding-left: 0px;">
			    <li class="page_li" v-if="startPage>1"><span class="mypost_page_pre page_a" v-on:click="prev()">◀</span></li>
			    <li class="page_li" v-for="i in range(startPage, endPage)" v-if="i===curpage"><span class="mypost_page page_a li_active" v-on:click="pageChage(i)">{{i}}</span></li>
			    <li class="page_li" v-else><span class="mypost_page page_a" v-on:click="pageChage(i)">{{i}}</span></li>
			    <li class="page_li" v-if="totalpage>endPage"><span class="mypost_page_next page_a" v-on:click="next()">▶</span></li>
			    </ul>
     </section>
  </div>
</div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  freeboard_list:[],
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
			  axios.get("http://localhost/web/board/freeboard_list_vue.do",{
				  params:{
					  page:this.curpage
				  }
			  }).then(function(response) {
				   console.log(response.data)
				  _this.freeboard_list = response.data
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