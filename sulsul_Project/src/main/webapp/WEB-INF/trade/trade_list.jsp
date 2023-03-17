<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/pagination.css?after">
<link rel="stylesheet" href="../css/trade.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<head>
<meta charset="utf-8">
<style>

</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>중고거래</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>Trade</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows" style="padding-bottom: 0px">
      

  <nav id="main_menu" style="width: 100%">
	<div class="box">
		<ul style="margin: 0px">
		<li>전체상품</li>
		<li>와인</li>
		<li>위스키</li>
		<li>브랜디&amp;꼬냑</li>
		<li>리큐르&amp;보드카</li>
		<li>민속주&amp;중국술&amp;사케</li>
		</ul>
	</div>
  </nav>

  <section id="content_box" >
	<div class="box">
		<h3>전체 상품</h3>
		<p> 판매자추천순 | 인기도순 | 평점높은순 | 최신등록순</p>
		<div class="clear" style="height: 40px"></div>

		<ul class="items" v-for="vo in tradedata_list">
			<li><a :href="'../trade/trade_detail.do?tdno='+vo.tdno"><img :src="vo.image" style="width: 232px; height: 302px;"></a></li>
			<div class="titlebox">
			<a :href="'../trade/trade_detail.do?tdno='+vo.tdno">
			<li class="a titlebox">{{vo.title}}</li>
			</a>
			</div>
			<li class="b">{{vo.price}}</li>
			<li class="c">{{vo.loc}}</li>
			<li class="d">판매자 <b><span>{{vo.seller}}</span></b>&nbsp;<b>·</b>&nbsp;조회수&nbsp;<b><span>{{vo.hit}}</span></b></li>
		</ul>
	</div>
	
	
	<div class="clear" style="height:30px"></div>
				<ul id="page_ul" style="padding-left: 0px;">
			    <li class="page_li" v-if="startPage>1"><span class="mypost_page_pre page_a" v-on:click="prev()">◀</span></li>
			    <li class="page_li" v-for="i in range(startPage, endPage)" v-if="i===curpage"><span class="mypost_page page_a li_active" v-on:click="pageChage(i)">{{i}}</span></li>
			    <li class="page_li" v-else><span class="mypost_page page_a" v-on:click="pageChage(i)">{{i}}</span></li>
			    <li class="page_li" v-if="totalpage>endPage"><span class="mypost_page_next page_a" v-on:click="next()">▶</span></li>
			    </ul>
  </section>

	<div class="box">
	</div>
  </div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  tradedata_list:[],
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
			  axios.get("http://localhost/web/trade/trade_list_vue.do",{
				  params:{
					  page:this.curpage
				  }
			  }).then(function(response) {
				   console.log(response.data)
				  _this.tradedata_list = response.data
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