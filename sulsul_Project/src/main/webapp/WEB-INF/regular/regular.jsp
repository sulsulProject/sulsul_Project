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
         <div class="untree_co-hero1" style="background-image: url('https://cdn.pixabay.com/photo/2018/05/18/12/43/rose-3411110__340.jpg'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                            <h4 class="mb-4 heading" style="color:white"data-aos="fade-up" data-aos-delay="100">나를 알아가는 힐링컬러</h4>
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black" style="color:white">둘러보기</a></p>
                       
                       <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>
                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>


      <div class="item">
         <div class="untree_co-hero1" style="background-image: url('data:image/jpeg;base64,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'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                            <h4 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">나만의 책 쓰기 프로젝트/스토리텔링</h4>
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black" >둘러보기</a></p>
                       
                       <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>
                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>
      
      <div class="item">
         <div class="untree_co-hero1" style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaNUxDaNd78kV0TNzI2xBURLfjWurAq3g60Q&usqp=CAU'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                            <h4 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">요리백서 쿠욱쿠욱</h4>
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">둘러보기</a></p>
                       
                       <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
                     </div>
                  </div>
               </div>
            </div>
         </div> <!-- /.untree_co-hero -->
      </div>
      
            <div class="item">
         <div class="untree_co-hero1" style="background-image: url('https://cdn.pixabay.com/photo/2018/05/18/12/43/rose-3411110__340.jpg'); margin-top: 20px; width:100%;height:400px">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6">
                  
                            <h4 class="mb-4 heading" style="color:white"data-aos="fade-up" data-aos-delay="100">3월 명언집 나눔/자존감 상승 프로젝트</h4>
                        <p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black" style="color:white">둘러보기</a></p>
                       
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
      <b style="font-size:30px;">주제별 밴드를 찾아보세요</b>
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
  <div class="container"><!-- ----------------------------------- -->
     <div class="row">
        <div class="col-md-6">
        <b style="font-size:30px;">이런 모임은 어때요</b>
      </div>
   </div>
   <div class="row">
            <div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
              <div class="product-item">
                <a href="shop-single.html" class="product-img">

                  <div class="label new top-right">
                    <div class="content">New</div>
                  </div>


                  <img src="images/products/jacket-1-min.jpg" alt="Image" class="img-fluid">
                </a>
                <h3 class="title"><a href="#">Dark Jacket</a></h3>
                <div class="price">
                  <span>£69.00</span>
                </div>
              </div>
            </div>
          </div>
  </div><!-- ----------------------------------- -->
  
  
  
  <div class="container"><!-- ----------------------------------- -->
     <div class="untree_co-section">
      <div class="container">
         <div class="row mb-5 align-items-center">
            <div class="col-md-6">
               <b style="font-size:30px;">인기 모임</b>    
            </div>
            <div class="col-sm-6 carousel-nav text-sm-right">
               <a href="#" class="prev js-custom-prev-v2">
                  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                     <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                     <path fill-rule="evenodd" d="M8.354 11.354a.5.5 0 0 0 0-.708L5.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z"/>
                     <path fill-rule="evenodd" d="M11.5 8a.5.5 0 0 0-.5-.5H6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5z"/>
                  </svg>
               </a>
               <a href="#" class="next js-custom-next-v2">
                  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                     <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                     <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                     <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                  </svg>
               </a>
            </div>
         </div> <!-- /.heading -->
         <div class="owl-3-slider owl-carousel">
            <div class="item">
               <div class="product-item">
                  <a href="#" class="product-img">
                     <div class="label sale top-right">
                        <div class='content'>Sale</div>
                     </div>
                     <img src="../images/products/watch-1-min.jpg" alt="Image" class="img-fluid">
                  </a>
                  <h3 class="title"><a href="#">The Murray</a></h3>
                  <div class="price">
                     <del>£99.00</del> &mdash; <span>£69.00</span>
                  </div>
               </div>
            </div> <!-- /.item -->


            <div class="item">
               <div class="product-item">
                  <a href="#" class="product-img">

                     <div class="label new top-right">
                        <div class='content'>New</div>
                     </div>

                     
                     <img src="../images/products/jacket-1-min.jpg" alt="Image" class="img-fluid">
                  </a>
                  <h3 class="title"><a href="#">Dark Jacket</a></h3>
                  <div class="price">
                     <span>£69.00</span>
                  </div>
               </div>
            </div> <!-- /.item -->


            <div class="item">
               <div class="product-item">
                  <a href="#" class="product-img">
                     <div class="label new top-right">
                        <div class='content'>New</div>
                     </div>

                     <div class="label sale top-right second">
                        <div class='content'>Sale</div>
                     </div>
                     <img src="../images/products/bottoms-1-min.jpg" alt="Image" class="img-fluid">
                  </a>
                  <h3 class="title"><a href="#">Chino Bottoms</a></h3>
                  <div class="price">
                     <del>£99.00</del> &mdash; <span>£69.00</span>
                  </div>
               </div>
            </div> <!-- /.item -->

            <div class="item">
               <div class="product-item">
                  <a href="#" class="product-img">
                     <img src="../images/products/sock-1-min.jpg" alt="Image" class="img-fluid">
                  </a>
                  <h3 class="title"><a href="#">The Modern Sock</a></h3>
                  <div class="price">
                     <span>£29.00</span>
                  </div>
               </div>
            </div> <!-- /.item -->
            
         </div>
      </div> <!-- /.container -->
   </div> <!-- /.untree_co-section -->  
  </div><!-- ----------------------------------- -->
</div>

<script>
   new Vue({
      el:'.changes',
      data:{
         category_list:[],
         no:99,
         ss:''
      },
      mounted:function(){
         this.change(this.no);
      },
      methods:{
         change:function(no){
            let _this = this;
            axios.get("http://localhost/web/regular/regular_list_vue.do",{
               params:{
                  rcate_no:no
               }
            }).then(function(response){
               console.log(response.data)
               _this.category_list = response.data
            })
         },
      find:function(){
         let _this = this;
         axios.get("http://localhost/web/regular/find_vue.do",{
            params:{
               name:this.ss
            }
      }).then(function(response){
         console.log(response.data)
         })
      }
      }
      
   })
</script>



</body>
</html>