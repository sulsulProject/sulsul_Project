<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
 a.product-img{
}
.img-fluid-1{
   width: 50%;
   height: 200px;
}
.custom-pagination li.pagess:hover{
   color:#ccc;
}
.custom-pagination ul li a:active, .custom-pagination ul li a:focus, .custom-pagination ul li span:active, .custom-pagination ul li span:focus {
      outline: none;
}
.ddd:hover{
  cursor: pointer
}
.categories:hover{
  cursor: pointer
}
.prd_name{
	display: block;
}
.prd_name a{
	font-size: 16px;
	width: 100%;
	font-weight: 500;
	color: #111;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
.cate_label span{
	margin-right: 5px;
	margin-bottom: 0;
	display: inline-block;
	width: auto;
	padding: 2px 8px;
	border-radius: 20px;
	font-size: 12px;
	color: #111;
	font-weight: inherit;
}
.price-font{
	font-size: 20px;
	font-weight: 700;
	color: #000;
	text-decoration: none;
}
.mb-3{
	font-size: 32px;
	font-weight: 500;
	color: #111;
}
.count-box{
	float: right;
	vertical-align: middle;
}
.count-text{
	font-size: 18px;
	font-weight: 700;
	float: right;
	vertical-align: middle;
	margin-top: 9px;
	margin-right: 20px;
}

.sort-filter:hover {
	background-color: white;
	border-bottom: 1px solid black;
}



</style>
</head>
<body>
  
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>Wine</h1>
          <p class="mb-4"><a href="../main/main.do"><span style="color: #c71585">Sul</span></a> / <strong>와인</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section pt-3">
    <div class="container">

      <div class="row align-items-center mb-5">
        <div class="col-lg-8">
          <p class="mb-3 mb-lg-0"></p>
        </div>
        <div class="col-lg-4 count-box">
         <span class="count-text">와인 <strong style="color: #c71585">${count }개</strong>의 상품</span>
        </div>
      </div>

      <div class="row rows">

        <div class="col-md-3">
          <ul class="list-unstyled categories">
            <li class="sort-filter"><span v-on:click="hit(1)">인기순</span></li>
            <li class="sort-filter"><span v-on:click="hit(2)">높은 가격순</span></li>
            <li class="sort-filter"><span v-on:click="hit(3)">낮은 가격 </span></li>
          </ul>
        </div>
        <div class="col-md-9">
          <div class="row">
            <div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4" v-for="vo in wine_list">
              <div class="product-item">
                <a :href="'../wine/before_detail.do?ino='+vo.ino" class="product-img">
                  <div class="label new top-right">
                    <div class='content'>HOT</div>
                  </div>

                  <img :src="vo.poster" alt="Image" class="img-fluid-1">
                </a>
                <div class="info">
                <p class="prd_name"><a :href="'../wine/before_detail.do?ino='+vo.ino">{{vo.name}}</a></p>
                <div class="cate_label">
                 <span style="background: #E0D8EA">{{vo.nation}}</span>
                 <span style="background: #E0D8EA">{{vo.vintage}}</span>
                 <span style="background: #E0D8EA">{{vo.capacity}}</span>
                </div>
                <div class="price">
                  <p class="price-font">{{vo.price}}원</p>
                </div>
              </div>
              </div>
            </div>


          </div>

          <div class="row mt-5 pb-5">
            <div class="col-lg-12">
              <div class="custom-pagination">
                <ul class="list-unstyled">
                  <li v-if="startPage>1" class="ddd">
                    <a v-on:click="prev()">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M5.854 4.646a.5.5 0 0 1 0 .708L3.207 8l2.647 2.646a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 0 1 .708 0z"/>
                        <path fill-rule="evenodd" d="M2.5 8a.5.5 0 0 1 .5-.5h10.5a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                      </svg>                      
                    </a>
                  </li>
                  <li v-for="i in range(startPage, endPage)" class="ddd"><a v-on:click="pageChange(i)">{{i}}</a></li>
                  <li v-if="totalpage>endPage" class="ddd">
                    <a v-on:click="next()">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
                        <path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z"/>
                      </svg>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>


        </div>
      </div>
      </div>
    </div> <!-- /.untree_co-section -->



    <div class="untree_co-section bg-light">
      <div class="container">
        <div class="row align-items-stretch">
          <div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-0">
            <div class="feature h-100">
              <div class="icon mb-4">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-truck" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5v7h-1v-7a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .5.5v1A1.5 1.5 0 0 1 0 10.5v-7zM4.5 11h6v1h-6v-1z"/>
                  <path fill-rule="evenodd" d="M11 5h2.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5h-1v-1h1a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4.5h-1V5zm-8 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
                  <path fill-rule="evenodd" d="M12 13a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
                </svg>
              </div>
              <h3>Worldwide Delivery</h3>
              <p>Far far away, behind the word mountains, far from the countries.</p>
            </div>
          </div>
          <div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-0">
            <div class="feature h-100">
              <div class="icon mb-4">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-shield-lock" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z"/>
                  <path d="M9.5 6.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                  <path d="M7.411 8.034a.5.5 0 0 1 .493-.417h.156a.5.5 0 0 1 .492.414l.347 2a.5.5 0 0 1-.493.585h-.835a.5.5 0 0 1-.493-.582l.333-2z"/>
                </svg>
              </div>
              <h3>Secure Payments</h3>
              <p>Far far away, behind the word mountains, far from the countries.</p>
            </div>
          </div>
          <div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-0">
            <div class="feature h-100">
              <div class="icon mb-4">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-counterclockwise" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M12.83 6.706a5 5 0 0 0-7.103-3.16.5.5 0 1 1-.454-.892A6 6 0 1 1 2.545 5.5a.5.5 0 1 1 .91.417 5 5 0 1 0 9.375.789z"/>
                  <path fill-rule="evenodd" d="M7.854.146a.5.5 0 0 0-.708 0l-2.5 2.5a.5.5 0 0 0 0 .708l2.5 2.5a.5.5 0 1 0 .708-.708L5.707 3 7.854.854a.5.5 0 0 0 0-.708z"/>
                </svg>
              </div>
              <h3>Simple Returns</h3>
              <p>Far far away, behind the word mountains, far from the countries.</p>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- /.untree_co-section -->
    
        <script>
       new Vue({
          el:'.rows',   
          data:{
             wine_list:[],
             curpage:1,
             totalpage:0,
             startPage:0,
             endPage:0,
             winecount:0,
             no:0
          },
          mounted:function(){
             let _this=this
             axios.get('http://localhost/web/wine/wine_list_vue.do',{
                params:{
                   page:this.curpage,
                   ino:this.ino,
                   no:this.no
                }
             }).then(function(response){
                console.log(response.data)
                _this.wine_list=response.data
                _this.curpage=response.data[0].curpage
                   _this.totalpage=response.data[0].totalpage
                   _this.startPage=response.data[0].startPage
                   _this.endPage=response.data[0].endPage
                   _this.winecount=response.data[0].winecount
             })
          },
          methods:{
             send:function(){
             let _this=this
             axios.get('http://localhost/web/wine/wine_list_vue.do',{
                params:{
                   page:this.curpage,
                   no:this.no
                }
             }).then(function(response){
                console.log(response.data)
                _this.wine_list=response.data
                _this.curpage=response.data[0].curpage
                   _this.totalpage=response.data[0].totalpage
                   _this.startPage=response.data[0].startPage
                   _this.endPage=response.data[0].endPage

             })
          },
          prev:function(){
             this.curpage=this.startPage-1
             if(this.no==0)
               this.send()
             else
                this.hit(this.no,this.curpage)
          },
          next:function(){
             this.curpage=this.endPage+1
             if(this.no==0)
                 this.send()
               else
                this.hit(this.no,this.curpage)
            },
            range:function(min,max){
               let array=[],
               j=0
               for(let i=min; i<=max; i++){
                  array[j] =i
                  j++
               }
               return array
            },
            pageChange:function(page){
               this.curpage=page
               if(this.no==0)
                   this.send()
                 else
                    this.hit(this.no,page)
              },
            hit:function(no,page){
            this.curpage=page
            this.no=no
             let _this=this;
             axios.get("http://localhost/web/wine/wine_hit_vue.do",{
                params:{
                   no:no,
                   page:this.curpage
                }
             }).then(function(response){
                console.log(response.data)
                _this.wine_list=response.data
                _this.curpage=response.data[0].curpage
                _this.totalpage=response.data[0].totalpage
                _this.startPage=response.data[0].startPage
                _this.endPage=response.data[0].endPage
             })
           }
       }
    })
   </script>
</body>
</html>