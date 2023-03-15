<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
body,
ul,
li {
    list-style: none;
    padding: 0;
    margin: 0;
}
a {
    text-decoration: none;
    color: inherit;
}

/*라이브러리*/

.con {
    margin-left: auto;
    margin-right: auto;
}

.cell {
    float: left;
    box-sizing: border-box;
    margin-bottom: 20px;
}
.row::after {
    content: "";
    display: block;
    clear: both;
}
.img-box > a > img {
    display: block;
    width: 100%;
}
/*커스텀*/
html,
body {
    overflow-x: hidden;
}
.con {
    max-width: 1000px;
}
.logo-bar {
    text-align: center;
    margin-bottom: 20px;
    margin-top: 20px;
}

.bn-box {
    margin-bottom: 20px;
    margin-top: 20px;
}
@media ( max-width:700px ) {
    .top-bn-box-1 {
        overflow-x:hidden;
    }

    .top-bn-box-1 > .img-box {
        margin-left:-50%;
    }
}


@media (max-width: 800px) {
    .menu-box {
        display: none;
    }
}


.list > ul > li {
    width: calc(100% / 4);
}

.list > ul > li {
    padding: 0 10px;
}
.list > ul {
    margin: 0 -10px;
}

.list > ul > li > .event-name {
    font-weight: bold;
    font-size: 1rem;
    padding-top: 15px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.list > ul > li:hover > .event-name {
    text-decoration: underline;
}
.list > ul > li > .event-period {
    text-align: center;
    font-weight: bold;
    font-size: 0.8rem;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.list > ul > li > .event-period::after {
    font-size: 1rem;
    font-weight:normal;
}



@media (max-width: 650px) {
    .list > ul > li {
        width: calc(100% / 3);
    }
}


@media (max-width: 400px) {
    .list > ul > li {
        width: calc(100% / 2);
    }
}

@media (max-width: 300px) {
    .list > ul > li {
        width: calc(100% / 1);
    }
}

#pagination {
	text-align: center;
}
#pagination li {
	display: inline-block;
}

#pagination li:hover {
	cursor: pointer;
	font-weight: bold;
	color: #B84592;
}
</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>이벤트</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>EventBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
      
	<div class="bn-box con">
	    <div class="img-box">
	        <a><img src="https://wine21.speedgabia.com/BANNER_MST/W0000586.gif" alt=""></a>
	    </div>
	</div>
	<div class="list con">
	    <ul class="row">
	        <li class="cell" v-for = "vo in eventboard_list">
	            <div class="img-box"><a :href="'../board/eventboard_detail.do?ebno='+vo.ebno"><img :src="vo.image"></a></div>
	            <div class="event-name" style="border-top: 0.5px solid lightgrey; padding-top: 10px">{{vo.title}}</div>
	            <div class="event-period">[{{vo.loc}}]</div>
	            <div class="event-period">{{vo.rdate}}</div>
	            <div class="event-period" style="border-bottom: 0.5px solid lightgrey; padding-bottom: 10px"><span style="color: #b84592">[{{vo.kind}}]</span></div>
	        </li>
	    </ul>
	</div>
	
	<div class="pagecontainer">
         <ul id="pagination">
	    <li v-if="startPage>1"><a style="padding:0px 0px 5px 0px;" v-on:click="prev()">◀</a></li>
	    <li class="current" v-for="i in range(startPage, endPage)" v-if="i===curpage"><a style="padding: 5px; color:#B84592" v-on:click="pageChage(i)"><b>{{i}}</b></a></li>
	    <li v-else><a style="padding: 5px" v-on:click="pageChage(i)">{{i}}</a></li>
	    <li v-if="totalpage>endPage"><a style="padding:0px 0px 5px 0px;" v-on:click="next()">▶</a></li>
	  </ul>
    </div>
    
	</div>
  </div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  eventboard_list:[],
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
			  axios.get("http://localhost/web/board/eventboard_list_vue.do",{
				  params:{
					  page:this.curpage
				  }
			  }).then(function(response) {
				   console.log(response.data)
				  _this.eventboard_list = response.data
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