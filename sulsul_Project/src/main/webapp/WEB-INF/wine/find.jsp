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
.product-item{
	float: left;
	width: 33.33%
}



</style>
</head>
<body>
  
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>FindResult</h1>
          <p class="mb-4"><a href="../main/main.do"><span style="color: #c71585">Sul</span></a> / <strong>검색결과</strong></p>        
        </div>
      </div>
    </div>
  </div>
     <c:if test="${count<1 }">
            <table class="table">
              <tr>
               <td class="text-center">
                 <h3>검색된 결과가 없습니다</h3>
               </td>
              </tr>
            </table>
           </c:if>
  <c:if test="${count>0 }">
         <table class="table">
              <tr>
               <td class="text-center">
                 <h3>총 ${count }건 검색</h3>
               </td>
              </tr>
            </table>
            <hr>
  

  <div class="untree_co-section">
    <div class="container">

      <div class="row align-items-center mb-5">
        <div class="col-lg-8">
          <p class="mb-3 mb-lg-0"></p>
        </div>
      </div>

      <div class="row">
<!-- 		<div class="row g-3 justify-content-center">
		
		</div> -->

  <div class="col-12">
            <c:forEach var="vo" items="${list }">
              <div class="product-item">
                <a href="../wine/before_detail.do?ino=${vo.ino }" class="product-img">
                  <div class="label new top-right">
                    <div class='content'>HOT</div>
                  </div>

                  <img src=${vo.poster } alt="Image" class="img-fluid-1">
                </a>
                <div class="info">
                <p class="prd_name"><a href="../wine/before_detail.do?ino=${vo.ino }">${vo.name }</a></p>
                <div class="cate_label">
                 <span style="background: #E0D8EA">${vo.nation }</span>
                 <span style="background: #E0D8EA">${vo.vintage }</span>
                 <span style="background: #E0D8EA">${vo.capacity }</span>
                </div>
                <div class="price">
                  <p class="price-font">${vo.price }원</p>
                </div>
              </div>
              </div>
              </c:forEach>
              </div>



        </div>
      </div>
      </div><!-- /.untree_co-section -->
	</c:if>



    
       
</body>
</html>