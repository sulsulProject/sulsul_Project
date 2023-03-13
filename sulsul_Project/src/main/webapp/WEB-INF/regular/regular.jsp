<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
<style type="text/css">
.r1{
	width: 30%
} 
</style>
</head>
<body>

<div class="untree_co-section regulars">
	<div class="container">
		<table class="table">
	      <tr>
	        <td class="text-right">
	          <a href="../regular/insert.do" class="btn btn-sm btn-primary">모임생성</a>
	        </td>
	      </tr>
	    </table>
	</div>
	
  <div class="container">
	<div class="owl-carousel owl-single home-slider">
			<div class="row">
				<div class="col-lg-3 r1" style="background-image: url('https://cfile1.onoffmix.com/images/event/269465/s');">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-6">
								<h4 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">나를 알아가는 힐링컬러</h4>
								<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">둘러보기</a></p>
							</div>
								
							</div>
						</div>
					</div>
				<div class="col-lg-3 r1" style="background-image: url('https://cfile1.onoffmix.com/images/event/270852/s');">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-6">
								<h4 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">3월 명언집 나눔/자존감 상승 프로젝트 & 일반인 명언집 제작 프로젝트/스토리텔링</h4>
								<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">둘러보기</a></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 r1" style="background-image: url('https://cfile1.onoffmix.com/images/event/251607/s');">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-6">
								<h4 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">3월 명언집 나눔/자존감 상승 프로젝트 & 일반인 명언집 제작 프로젝트/스토리텔링</h4>
								<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">둘러보기</a></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 r1" style="background-image: url('https://cfile1.onoffmix.com/images/event/271538/s');">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-6">
								<h4 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">3월 명언집 나눔/자존감 상승 프로젝트 & 일반인 명언집 제작 프로젝트/스토리텔링</h4>
								<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">둘러보기</a></p>
							</div>
						</div>
					</div>
				</div>
				</div> <!-- /.untree_co-hero -->
			
	
	
			<!-- <div class="item">
				<div class="untree_co-hero" style="background-image: url('webapp/images/hero-slider-2-min.jpg');">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-3">
	
								<h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">The New Way To Sell Your Products by <a href="#">Untree.co</a></h1>
								<div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
								</div>
	
								<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">Explore now</a></p>
	
							</div>
						</div>
					</div>
				</div> /.untree_co-hero
			</div> -->
			</div>
		</div>
  </div><!-- ----------------------------------- -->
   <div style="height: 40px"></div>
  <!-- ================================================================== -->
  <div class="container changes">
  	<div class="row">
  		<h3>주제별 밴드를 찾아보세요---------------------</h3>
  	</div>
	<div class="row">
		<button class="btn btn-xs" style="background-color: salmon" v-on:click="change(1)">취미</button>
	     <button class="btn btn-xs btn-success" v-on:click="change(2)">방송/연예</button>
	     <button class="btn btn-xs btn-info" v-on:click="change(3)">게임</button>
	     <button class="btn btn-xs btn-warning" v-on:click="change(4)">맛집</button>
	     <button class="btn btn-xs btn-warning" v-on:click="change(6)">문화/예술</button>
	     <button class="btn btn-xs btn-warning" v-on:click="change(7)">교육/공부</button>
	     <button class="btn btn-xs btn-warning" v-on:click="change(8)">친목/모임</button>
	     <button class="btn btn-xs btn-warning" v-on:click="change(9)">전체</button>
		
	</div>
   </div>
     <!-- ================================================================== -->
  <div style="height: 40px"></div>
  
  <!-- 정기모임리스트 ================================================================== -->
  <div class="container" style="background-color: orange">
    <h2>모임리스트-------------------------------------</h2>
  	<div class="row">
  	  <c:forEach var="vo" items="${rList }">
  	  	<!-- <div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4"> -->
	    <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="../regular/detail.do?no=${vo.no }">
		        <img src="${vo.poster }" alt="Lights" style="width:250px; height: 250px">
		        <div class="caption">
		          <p style="color: red">${vo.name}</p>
		        </div>
		      </a>
		    </div>
	    </div>
  	  </c:forEach>
  	  
	</div>
  </div>
  <!-- ================================================================== -->
   <div style="height: 40px"></div>
  <div class="container"><!-- ----------------------------------- -->
  	<div class="row">
  		<div class="col-md-6">
		  <h2 class="h3">이런 모임은 어때요-----------------------</h2>        
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
					<h2 class="h3">인기 모임--------------</h2>        
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
			category_list:[]
		},
		methods:{
			change:function(no){
				let _this = this;
				axios.get("http://localhost/web/regular/list_change.do",{
					params:{
						no:no,
						rcate:crate
					}
				})
			}
		}
	})
</script>


<!-- <script>
	new Vue({
		el:'.regulars',
		data:{
			regular_list:[]
		},
		mounted:function(){
			this.regu();
		},
		methods:{
			regu:function(){
				let _this=this
				axios.get("http://localhost/web/regular/list_vue.do").then(function(response){
					console.log(response.data)
					_this.regular_list = response.data
				})	
			}
			
		}
	})
</script> -->

</body>
</html>