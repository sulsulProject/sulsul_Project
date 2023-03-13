<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/freeboard.css?after">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto">
          <h1>글 목록</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>FreeBoard</strong></p>        
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
		                      <a :href="'../board/freeboard_detail.do?fbno='+vo.fbno">{{vo.subject}}</a>
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
	      <a href="../board/freeboard_insert.do" class="boradBtn" v-on:click="move1()">글쓰기</a>
	      <a class="boradBtn">내글보기</a>
	    </div>
	        <div class="pagecontainer">
	          <ul id="pagination">
			    <li v-if="startPage>1"><a style="padding:0px 0px 5px 0px;" v-on:click="prev()">◀</a></li>
			    <li class="current" v-for="i in range(startPage, endPage)" v-if="i===curpage"><a style="padding: 5px; color:#B84592" v-on:click="pageChage(i)"><b>{{i}}</b></a></li>
			    <li v-else><a style="padding: 5px" v-on:click="pageChage(i)">{{i}}</a></li>
			    <li v-if="totalpage>endPage"><a style="padding:0px 0px 5px 0px;" v-on:click="next()">▶</a></li>
			  </ul>
	        </div>
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