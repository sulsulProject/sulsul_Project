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
<style>
/* .untree_co-section{
   border : 1px solid black;
}
.container{
    border : 1px solid red;
} 
 */
#side { //사이드바 같이 이동 시키려고
    position: sticky;
    top: 100px;
    right: 300px;
}

.button1{
   height: 40px;
   width: 400px;
   border :1px solid #D0F1FB;
   background:  #D0F1FB;
}
input{
   font-size:16px;
   width:347px;
   height:100%;
   border:0px; 
   outline:none;
   floate:left;
}
button{
   width:50px;
   height:100%;
   border:0px;
   background: #D0F1FB;
   outline:none;
   float:right;
   color:black;
}
button:hover{
   cursor:pointer;
   background-color: #DCDCDC;
}
/*/////////////////////////////////////////////*/
.postBox:hover {
   cursor:pointer;
   background-color: #D0F1FB;
   color: black;
}
</style>
</head>
<body>
<div style="height: 20px"></div>
<div class="untree_co-section" style=" max-height: 1500px">
 <div class="container">
   <div class="row">
     <!-- 사이드 메뉴 시작 -->
       <div id="aside"class="col-lg-3">   
         <table id="side" class="table" >
           <tr class ="menu" >
            <th><h5><b>고객센터</b></h5></th>
           </tr>
          <tr>
           <th style="padding: 8px"><a href="../customer/faq.do" style="color:#337AB7;font-size: 14px" class="test">FAQ</a></th>
          </tr>
          <tr>
           <th style="padding: 8px"><a href="../customer/iu.do" style="color:#337AB7;font-size: 14px" class="test">이용안내</a></th>
          </tr>
          <tr>
           <th style="padding: 8px"><a href="../customer/ask.do" style="color:#337AB7;font-size: 14px" class="test">1:1 문의하기</a></th>
          </tr>
         </table>
       </div>
  <!-- 사이드 메뉴 끝 -->

  <!-- content 시작 (우측 내용)-->
  <div id ="content" class="col-lg-9 container" >
     <div class="" background-color: black"> <!-- controller div태그 줄지 고민중 -->
        <div class="row-lg-1">
         <b style="font-size: 23px">고객센터FAQ</b>
        </div>
      </div>
      <div style="height:10px"></div>
       
       <!-- 나라별 고객 센터 소개 시작 -->
       <div class="container">
         <div class="row">
           <div class="owl-4-slider owl-carousel">
          <c:forEach var="vo" items="${nList }" begin="0" end="21">
            <div class="item" >
               <div class="product-item" style="background-color: #D0F1FB;border-radius: 1em;"">
                     <sub style="color: gray">${vo.nation }</sub><br>
                     <b>${vo.title }</b>
                     <div style="padding-left:70px;">
                     <img src="${vo.image }" style="height:60px;width: 60px;">
                    </div>
                    
                    <!--  TO_DO : 나라별 현재 시간 추가 / 업무 상태 추가 -->
                    
                  <!-- <div><b>시간추가</b></div>-->
                  <div><b>${vo.work_state }</b></div>
                  <div style="height: 10px"></div>
               </div>
            </div> <!-- /.item -->
            </c:forEach>
         </div>
      </div> <!-- /.container --> 
     </div>
     <!-- 나라별 고객센터 소개 끝 -->
     
    
       <div style="height: 70px"></div>
       <!-- 검색창  start -->
       <div style="padding-left: 190px">
        <form method="post" action="../customer/faq.do" >
         <div class="button1 "  >
            <input type="text" placeholder="검색어를 입력하세요" name="subject">
             <button> <b>검색</b></button>
          </div>
        </form>
        </div> 
      <div style="height: 30px"></div>
      
      <!-- 검색 결과 받는 부분 -->
       <c:if test="${count==0 }">
        <div class="text-center">
           <span style="color:red;font-size:30px">검색한 결과가 없습니다</span>
         </div>
      </c:if>
      
      <!-- 검색결과가 있는 경우 -->
      <c:if test="${count>0 && count<78 }">
      <div style="height: 20px"></div>
            <table class="table table-hover">
              <thead>
               <tr>
                 <th width="20%" class="text-center" style="border-right: 0.5px solid lightgray">타입</th>
                 <th width="80%" class="text-center" style="border-right: 0.5px solid lightgray" >제목</th>
               </tr>
              </thead>
              <c:forEach var="vo" items="${sList}">
             <tr>
              <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray"><b>${vo.type}</b></td>
              <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray">
                  <a href="../customer/faq_detail.do?fno=${vo.fno}" style="color: black">${vo.subject}</a>
               </td>
             </tr>
             </c:forEach>
           </table>
     </c:if> 
      
     <!-- Faq 테이블 기본 값 -->
      <c:if test="${subject=='ALL'}">
        <div class="rows">
          <div>
            <table class="table">
              <tr>
               <th  class="text-center postBox" style="border-right: 0.5px solid lightgray; border-bottom: 0.5px solid lightgray" v-on:click="change(1)">
                 전체
                 </th>
                 <th  class="text-center postBox" style="border-right: 0.5px solid lightgray;border-bottom: 0.5px solid lightgray" v-on:click="change(2)">
                 배송신청서&회원관련
                </th>
                <th  class="text-center postBox" style="border-right: 0.5px solid lightgray;border-bottom: 0.5px solid lightgray" v-on:click="change(3)">
                 입고관련
                </th>
                <th  class="text-center postBox" style="border-right: 0.5px solid lightgray;border-bottom: 0.5px solid lightgray" v-on:click="change(4)">
                 배송관련
                </th>
                <th  class="text-center postBox" style="border-right: 0.5px solid lightgray;border-bottom: 0.5px solid lightgray" v-on:click="change(5)">
                 결제관련
                </th>
                <th  class="text-center postBox" style="border-right: 0.5px solid lightgray;border-bottom: 0.5px solid lightgray" v-on:click="change(6)">
                 반송관련
                </th>
                <th  class="text-center postBox" style="border-right: 0.5px solid lightgray;border-bottom: 0.5px solid lightgray" v-on:click="change(7)">
                 다해줌
                </th>
                <th  class="text-center postBox" style="border-bottom: 0.5px solid lightgray" v-on:click="change(8)">
                 기타
                </th>
              </tr>
            </table>
            <div style="height: 20px"></div>
            <table class="table table-hover">
              <thead>
               <tr>
                 <th width="20%" class="text-center" style="border-right: 0.5px solid lightgray">타입</th>
                 <th width="80%" class="text-center" style="border-right: 0.5px solid lightgray" >제목</th>
               </tr>
              </thead>
              <tbody v-for="vo in faq_list">
                <tr>
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==1"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==1">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==2"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==2">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==3"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==3">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==4"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==4">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==5"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==5">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==6"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==6">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==7"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==7">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                 
                 <td width="20%" class="text-center" style="border-right: 0.5px solid lightgray" v-if="no==8"><b>{{vo.type}}</b></td>
                 <td width="80%" class="text-left" style="border-right: 0.5px solid lightgray" v-if="no==8">
                  <a :href="'../customer/faq_detail.do?fno='+vo.fno" style="color: black">{{vo.subject}}</a>
                 </td>
                </tr>
              </tbody>
            </table>
            <!-- 페이지 기능 -->
            <ul id="page_ul" style="padding-left: 0px;">
             <li class="page_li" v-if="startPage>1">
                <span class="mypost_page_pre page_a" v-on:click="prev()">
                    ◀
                 </span>
             </li>
             
             <li class="page_li" v-for="i in range(startPage, endPage)" v-if="i===curpage">
                  <span class="mypost_page page_a li_active" v-on:click="pageChage(i)">
                  {{i}}
                </span>
             </li>
             
             <li class="page_li" v-else>
                <span class="mypost_page page_a" v-on:click="pageChange(i)">
                {{i}}
                </span>
             </li>
             
             <li class="page_li" v-if="totalpage>endPage">
                <span class="mypost_page_next page_a" v-on:click="next()">
                ▶
                </span>
             </li>
          </ul> 
          </div> 
         </div>
     </c:if>
   </div> <!-- #content 끝 -->
  </div>
  </div>
</div>
<script>
   new Vue({
      el:'.rows',
      data:{
         faq_list:[],
         curpage:1,
         startPage:0,
         endPage:0,
         totalpage:0,
         no:1,
         ss:'',
         search_list:[]
      },
      mounted:function(){
         let _this=this
         axios.get('http://localhost/web/customer/faq_list_vue.do',{
            params:{
                 page:this.curpage,
                     no:this.no
              }
         }).then(function(response) {
               console.log(response.data)
              _this.faq_list = response.data
              _this.curpage = response.data[0].curpage
              _this.totalpage = response.data[0].totalpage
              _this.startPage = response.data[0].startPage
              _this.endPage = response.data[0].endPage
         })
      },
      methods:{
         send:function(){
            let _this=this
            axios.get('http://localhost/web/customer/faq_list_vue.do',{
               params:{
                    page:this.curpage,
                        no:this.no
                 }
            }).then(function(response) {
                  console.log(response.data)
                 _this.faq_list = response.data
                 _this.curpage = response.data[0].curpage
                 _this.totalpage = response.data[0].totalpage
                 _this.startPage = response.data[0].startPage
                 _this.endPage = response.data[0].endPage
            })
         }, //send
         getData:function(){
            let _this=this;
            axios.get("http://localhost/web/customer/faq_find_vue.do",{
               params:{
                  subject:this.ss
               }
            }).then(function(response){
               console.log(resposne.data)
               _this.search_list=response.data;
                  _this.curpage=response.data[0].curpage
                  _this.totalpage=response.data[0].totalpage
                  _this.startPage=response.data[0].startPage
                  _this.endPage=response.data[0].endPage
            })
         },
         find:function(){
            //this.curpage=1;
            this.getData();
         },
         // 범위
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
                   this.change(this.no,page)
           },
         find:function() {
            this.curpage=1;
            this.send();
         },
         prev:function(){
                this.curpage=this.startPage-1
                if(this.no==0)
                  this.send()
                else
                   this.change(this.no,this.curpage)
             },
          next:function(){
                this.curpage=this.endPage+1
                if(this.no==0)
                    this.send()
                  else
                   this.change(this.no,this.curpage)
           },
         change:function(no,page){
            this.curpage=page;
            this.no=no
            let _this=this;
            axios.get("http://localhost/web/customer/faq_change_vue.do",{
                   params:{
                         no:no,
                         page:this.curpage
                      }
              }).then(function(response){
                  console.log(response.data)
                  _this.faq_list=response.data
                  _this.curpage=response.data[0].curpage
                   _this.totalpage=response.data[0].totalpage
                   _this.startPage=response.data[0].startPage
                   _this.endPage=response.data[0].endPage
          })
      }
   } //methods
}) //전체

</script>
</body>
</html>