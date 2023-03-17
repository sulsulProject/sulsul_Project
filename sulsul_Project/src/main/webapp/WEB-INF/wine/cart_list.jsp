<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   $('.orderBtn').click(function(){
      requestPay();
   })
   var IMP = window.IMP; // 생략 가능
IMP.init("imp68206770"); // 예: imp00000000
function requestPay() {
   console.log('clicked');
  // IMP.request_pay(param, callback) 결제창 호출
   IMP.request_pay({
       pg : 'kakao', // version 1.1.0부터 지원.
           /*
               'kakao':카카오페이,
               'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
               'nice':나이스,
               'jtnet':jtnet,
               'uplus':LG유플러스
           */
       pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '주문명:결제테스트',
       amount : ${tCount},
       buyer_email : 'iamport@siot.do',
       buyer_name : '구매자이름',
       buyer_tel : '010-1234-5678',
       buyer_addr : '서울특별시 강남구 삼성동',
       buyer_postcode : '123-456',
       app_scheme : 'iamporttest' //in app browser결제에서만 사용 
   }, function(rsp) {
       if ( rsp.success ) {
           var msg = '결제가 완료되었습니다.';
           msg += '고유ID : ' + rsp.imp_uid;
           msg += '상점 거래ID : ' + rsp.merchant_uid;
           msg += '결제 금액 : ' + rsp.paid_amount;
           msg += '카드 승인번호 : ' + rsp.apply_num;
       } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
       }
   });
}
})
</script>
<style type="text/css">
.img-fluid-1{
	width: 50%;
	height: 112px;
}
.plain-btn{
	line-height: 22px;
	font-weight: normal;
	background: #fff;
	color: #000;
	border: 1px solid #ddd !important;
	padding: 10px; !important;
	font-size: inherit;
	text-align: center;
}
.product-no .product-name .product-price .product-quantity .product-total .product-remove{
	font-weight: normal;
	padding: 10px;
	vertical-align: middle;
}
.order-price{
	font-size: 18px;
}
.remove-text{
	font-size: 12px;
}
</style>
</head>
<body>

 

	<c:if test="${cCount<1 }">
	<div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>Cart</h1>
          <p class="mb-4"><a href="../main/main.do"><span style="color: #c71585">Sul</span></a> / <strong>장바구니</strong></p>        
        </div>
      </div>
    </div>
  </div>

	  <div class="untree_co-section">
    <div class="container">
      <div class="row mb-5">
      	<h3>장바구니가 비었습니다.</h3>
      </div>
      </div>
      </div>
</c:if>

  
	<c:if test="${cCount>0 }">
	 <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>Cart</h1>
          <p class="mb-4"><a href="../main/main.do"><span style="color: #c71585">Sul</span></a> / <strong>장바구니</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section">
    <div class="container">
      <div class="row mb-5">
        <form class="col-md-12" method="post">
          <div class="site-blocks-table">
            <table class="table table-bordered">
              <thead>
                <tr>
                <th class="product-no">상품번호</th>
                  <th class="product-thumbnail">상품사진</th>
                  <th class="product-name">상품명</th>
                  <th class="product-price">판매가</th>
                  <th class="product-quantity">수량</th>
                  <th class="product-total">주문금액</th>
                  <th class="product-remove">주문관리</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="vo" items="${list }">
                <tr>
                    <td class="product-no">
                    <p>${vo.ino }</p>
                  </td>
                  <td class="product-thumbnail">
                    <a href="../wine/before_detail.do?ino=${vo.ino }"><img src="${vo.wvo.poster }" alt="Image" class="img-fluid-1"></a>
                  </td>
                  <td class="product-name">
                    <p>${vo.wvo.name }<br>${vo.wvo.name_sub }</p>
                    
                  </td>
                  <td class="product-price">
                  <p>${vo.wvo.price }원</p>
                  </td>
                   <td class="product-quantity">
                   <p>${vo.account }</p>
                  </td> 
                  <td class="product-total">
                  <p>${vo.total_price }원</p>
                  </td>
                  <td class="product-remove">
                  <a href="../wine/cart_delete.do?bno=${vo.bno }" class="plain-btn btn"><span class="remove-text">삭제하기</span></a>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </form>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="row mb-5">
            <div class="col-md-6 mb-3 mb-md-0">
             <a href="javascript:history.back();"><button class="btn btn-black btn-sm btn-block">이전 화면</button></a>
            </div>
            <div class="col-md-6">
              <a href="../wine/list.do"><button class="btn btn-outline-black btn-sm btn-block">쇼핑 계속하기</button></a>
            </div>
          </div>
          <div class="row">
           <!--  <div class="col-md-12">
              <label class="text-black h4" for="coupon">Coupon</label>
              <p>Enter your coupon code if you have one.</p>
            </div>
            <div class="col-md-8 mb-3 mb-md-0">
              <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
            </div>
            <div class="col-md-4">
              <button class="btn btn-black">Apply Coupon</button>
            </div> -->
          </div>
        </div>
        <div class="col-md-6 pl-5">
          <div class="row justify-content-end">
            <div class="col-md-7">
              <div class="row">
                <div class="col-md-12 text-right border-bottom mb-5">
                  <p class="order-price">최종 결제 금액</p>
                </div>
              </div>
              <div class="row mb-3">
<!--                 <div class="col-md-6">
                  <span class="text-black">Subtotal</span>
                </div>
                <div class="col-md-6 text-right">
                  <strong class="text-black">$230.00</strong>
                </div> -->
              </div>
              <div class="row mb-5">
                <div class="col-md-6">
                  <span class="text-black">Total</span>
                </div>
                <div class="col-md-6 text-right tp">
                  <strong class="text-black">${tCount }원</strong>

                </div>
              </div>

              <div class="row">
                <div class="col-md-12">
                  <button class="btn btn-black btn-lg py-3 btn-block orderBtn">주문하기</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </c:if>


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
  </div> <!— /.untree_co-section —>


</body>
</html>