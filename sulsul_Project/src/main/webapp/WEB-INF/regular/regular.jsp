<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.r1{
   width: 30%
} 

.button2{
   height: 50px; 
   width: 500px;  
   border :1px solid #be539b;
}
input{
   font-size:16px;
   width:420px;
   height:100%;
   border:0px; 
   outline:none;
   float:left;
}
.button3{
   width:70px;
   height:100%;
   border:0px;
   background: #be539b;
   outline:none;
   float:right;
   color:black;
   
}
button:hover{
   background-color: #c71585;
   font-color:white
}
button{
   border-color: #c71585;
   border: 3px #D0F1FB;
   height: 50px;
   width:130px;
}
.untree_co-hero1, .bg-img {
  background-size: 1110px 380px;  <%-- 슬라이드 이미지 크기 조정 (가로 세로) --%>
  background-position: top center;
  background-repeat: no-repeat;
  position: relative;
   min-height: 450px;  
}
.mb-4{
   PADDING-TOP: 100PX;
    padding-left: 850px;
    color: white;
}
</style>
</head>
<body>

<div class="untree_co-section regulars changes">
   <div class="container">
   
      <table class="table">
         <tr>
           <td class="text-right"  style="border: none;">
           <c:if test="${sessionScope.id!=null }">
             <a href="../regular/insert.do" class="btn btn-sm btn-primary">모임생성</a>
           </c:if>
           <c:if test="${sessionScope.id ==null }">
             <a href="../member/login.do" class="btn btn-sm btn-primary">모임생성 로그인 후 이용</a>
           </c:if>
           </td>
         </tr>
       </table>
   </div>
   
  <div class="container">
     <div class="owl-carousel owl-single home-slider">
      <div class="item">
         <div class="untree_co-hero1" style="background-image: url('../images/meeting-slide-1.png'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">

                     <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>

                     <p class="mb-0" data-aos="fade-up" data-aos-delay="300"></p> 

                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>


      <div class="item">
         <div class="untree_co-hero1" style="background-image: url('../images/meeting-slide-2.png'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"></p>
                       
                       <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>
                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>
      
      <div class="item">
         <div class="untree_co-hero1" style="background-image: url('../images/meeting-slide-3.png'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"></p>
                       
                       <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>
                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>
      
            <div class="item">
         <div class="untree_co-hero1" style="background-image: url('../images/meeting-slide-4.png'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                            <h4 class="mb-4 heading" style="color:white"data-aos="fade-up" data-aos-delay="100">3월 명언집 나눔/자존감 상승 프로젝트</h4>
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"></p>
                       
                       <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>
                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>
     </div>
   </div><!-- 메인 슬라이더 container 끝 -->
   
   
  <!-- 높이조절 -->
   <div style="height: 40px"></div>
   
  <!-- 검색창 관련 내용-->
   <div class="container" style="padding-left: 340px">
    <div class="row" >
     <div>
      <form method="post" action="../regular/find.do">
         <div class="button2" >
            <input type="text" placeholder=" 검색어를 입력하세요" name="name">
             <button class="button3" >검색</button>
          </div>
        </form> 
    </div>
    </div>
  </div>
  <div style="height: 50px"></div>
  
  <!-- 밴드 -->
  <div class="container ">
    <div class="row">
      <b style="font-size:30px;">주제별 모임을 찾아보세요</b>
    </div>
    <div style="height: 20px;"></div>
    <div class="row" >
    <table class="table">
      <tr>
         <button class="button" style="margin-left: 10px;" v-on:click="change(1)">취미</button>
         <button class="button" style="margin-left: 10px;" v-on:click="change(2)">방송/연예</button>
         <button class="button" style="margin-left: 10px;"  v-on:click="change(3)">게임</button>
         <button class="button" style="margin-left: 10px;"   v-on:click="change(4)">맛집</button>
         <button class="button" style="margin-left: 10px;"  v-on:click="change(5)">문화/예술</button>
         <button class="button" style="margin-left: 10px;"  v-on:click="change(6)">교육/공부</button>
         <button class="button" style="margin-left: 10px;"  v-on:click="change(7)">친목/모임</button>
         <button class="button" style="margin-left: 10px;"  v-on:click="change(99)">전체</button>
      </tr>
      </table>
    </div>
    <!-- ================================================================== -->
    <div style="height: 40px"></div>

    <!-- 정기모임리스트 ================================================================== -->
    <div class="container">
      <div class="row" >
        <div class="col-md-3" v-for="vo in category_list">
          <div class="thumbnail">
            <a :href="'../regular/detail.do?no='+vo.rno">
              <img :src="vo.poster" alt="Lights" style="width:250px; height: 250px">
              <div class="caption">
                <p class="text-center">{{vo.name}}</p>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- ================================================================== -->

   <div style="height: 40px"></div>

   <div class="untree_co-section">
      <div class="container">
         <div class="row ">
            <b style="font-size: 30px;">이런 모임은 어때요?</b>
            <div class="owl-4-slider owl-carousel">
               <div class="item" v-for="vo in new_list">
                  <div class="product-item">
                     <a :href="'../regular/detail.do?no='+vo.rno"> <img
                        :src="vo.poster" alt="Lights"
                        style="width: 250px; height: 250px">
                        <p class="text-center">{{vo.name}}</p>
                     </a>
                  </div>
               </div>
            </div>
         </div>
         <!-- /.heading -->
      </div>
      <!-- /.container -->
   </div>
   <div style="height: 40px"></div>

   <div class="untree_co-section">
      <div class="container">
         <div class="row ">
            <b style="font-size: 30px;">인기 모임</b>
            <div class="owl-4-slider owl-carousel">
               <div class="item" v-for="vo in popular_list">
                  <div class="product-item">
                     <a :href="'../regular/detail.do?no='+vo.rno"> <img
                        :src="vo.poster" alt="Lights"
                        style="width: 250px; height: 250px">
                        <p class="text-center">{{vo.name}}</p>
                     </a>
                  </div>
               </div>
            </div>
         </div>
         <!-- /.heading -->
      </div>
      <!-- /.container -->
   </div>
      <!-- /.untree_co-section -->
   </div>

<script>
   new Vue(
         {
            el : '.changes',
            data : {
               category_list : [],
               popular_list : [],
               new_list :[],
               no : 99,
               ss : ''
            },
            mounted : function() {
               this.change(this.no);
               this.popularChange();
               this.newChange();
            },
            methods : {
               change : function(no) {
                  let _this = this;
                  axios
                     .get(
                           "http://localhost/web/regular/regular_list_vue.do",
                           {
                              params : {
                                 rcate_no : no
                              }
                           }).then(function(response) {
                        console.log(response.data)
                        _this.category_list = response.data
                     })
               },
               popularChange : function() {
                  let _this = this;
                  axios
                     .get(
                           "http://localhost/web/regular/regular_popularList_vue.do",
                           {}).then(function(response) {
                        console.log(response.data)
                        _this.popular_list = response.data
                     })
               },
               newChange : function() {
                  let _this = this;
                  axios
                     .get(
                           "http://localhost/web/regular/regular_newList_vue.do",
                           {}).then(function(response) {
                        console.log(response.data)
                        _this.new_list = response.data
                     })
               },
               find : function() {
                  let _this = this;
                  axios.get("http://localhost/web/regular/find_vue.do", {
                     params : {
                        name : this.ss
                     }
                  }).then(function(response) {
                     console.log(response.data)
                  })
               }
            }

         })
</script>



</body>
</html>


