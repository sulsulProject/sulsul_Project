<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product-item{
	float: left;
}
.img-fluid-3{
	width: 50px;
}
</style>
</head>
<body>
	<div class="site-footer" style="border-top: solid 1px #cccccc; margin-top: 50px">


		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="widget mb-4">
						<h3 class="mb-2"><b>청소년에 대한 주류판매 금지</b></h3>
						<p style="font-size: 12px">1. 누구든지 청소년을 대상으로 하여 주류를 판매해서는 안 됩니다.<br> 
						2. 이 경우 자동기계장치·무인판매장치·통신장치에 의해 판매한 경우를 포함합니다<br>
						3. 이를 위반하여 청소년에게 주류를 판매한 자는 2년 이하의 징역 또는 2천만원 이하의 벌금에 처해집니다<br>
						4. 주류를 판매하려는 자는 그 상대방의 나이 및 본인 여부를 확인해야 합니다<br>
						</p>
					</div>
					<div class="widget">
						<h3><b style="color:#c71585">※ 미성년자에게 판매 불가합니다.</b></h3>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="widget" style="color:#333333">
						<h3>Quick Link</h3> 
						<ul class="list-unstyled">
							<li><a href="../main/main.do">홈</a></li>
							<li><a href="../trade/trade_list.do">중고거래</a></li>
							<li><a href="../regular/regular.do">정기모임</a></li>
							<li><a href="../board/freeboard_list.do">게시판</a></li>
							<li><a href="../board/eventboard_list.do">이벤트</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
  <div class="col-12">
  			<h3>Weekly Item</h3>
  			<div style="height: 20px;"></div>
            <c:forEach var="vo" items="${list }" begin="1" end="6">
              <div class="product-item">
                <a href="../wine/before_detail.do?ino=${vo.ino }" class="product-img">

                  <img src=${vo.poster } alt="Image" class="img-fluid-3">
                </a>
                <div class="info">
                <p class="prd_name"><a href="../wine/before_detail.do?ino=${vo.ino }">${vo.name }</a></p>
                <div class="price">
                  <p class="price-font">${vo.price }원</p>
                </div>
              </div>
              </div>
              </c:forEach>
              </div>
				</div>

				
			</div>


			<div class="row mt-5">
				<div class="col-12 text-center">
					<ul class="list-unstyled social">
						<li><a href="#"><span class="icon-facebook"></span></a></li>
						<li><a href="#"><span class="icon-instagram"></span></a></li>
						<li><a href="#"><span class="icon-linkedin"></span></a></li>
						<li><a href="#"><span class="icon-twitter"></span></a></li>
					</ul>
				</div>
				<div class="col-12 text-center copyright">
					<b><p>Copyright &copy;</b><script>document.write(new Date().getFullYear());</script> - <b>SIST 강남쌍용</b> - 3강의장 &mdash; Project By <a href="https://github.com/sulsulProject/sulsul_Project"><b style="color:#c71585">Team 2</b></a> <!-- License information: https://untree.co/license/ -->
					</p>

				</div>
			</div>
		</div> <!-- /.container -->
	</div> <!-- /.site-footer -->
</body>
</html>