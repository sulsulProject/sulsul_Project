<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   $(document).one('click', '.like-review', function(e) {
      $(this).html('<i class="fa fa-heart" aria-hidden="true"></i> 찜하기 완료');
      $(this).children('.fa-heart').addClass('animate-like');
   });
});

$(function(){
   $('.like__btn').on('click', function(){
        // Check if it's already been clicked
        if (!$(this).hasClass('like__btn--disabled')) {
          // Update the number
          updated_likes = parseInt($('.like__btn span').html()) + 1;
          $('.like__btn span').html(updated_likes);
         }
        // Make btn disabled
        $(this).attr('disabled', true).addClass('tada');
      });
})

$(function(){
   $('#account_select').change(function(){
      let price=$(this).attr("data-price");
      let temp=price.replace("원","");
      temp=temp.replace(",","")
      console.log(temp)
      let count=$(this).val();
      let total=Number(count)*Number(temp);
      console.log("가격:"+price);
      console.log("수량:"+count)
      $('#total_price').text(total);
      $('#goods_account').val(count)
      $("#goods_total").val(total)
      
   })
})

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
       amount : 14000,
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
.goodsLeft {
    width: 400px;
    height: 520px;
    float: left;
    border: 0px solid #ddd;
}
.goodsImg {
    width: 400px;
    padding: 20px 0px;
    margin-bottom: 13px;
    background-color: #fff;
    text-align: center;
}
.goods_detail {
    float: right;
    width: 600px;
    margin-top: 30px;
}
.goods_name {
    padding-bottom: 25px;
    border-bottom: 1px solid #463032;
}
.goods_name p {
    font-size: 26px;
    color: #252525;
}
.good_tit1 {
    font-weight: bold;
    letter-spacing: -0.05em;
}
.goods_option_name{
   font-size: 20px;
   font-weight: bold;
}
.goods_price_name{
   font-size: 20px;
   font-weight: bold;
}
.goods_option, .goods_price {
    border-bottom: 1px solid #c2c2c2;
    padding: 20px 0px;
}
.goods_option, .goods_price {
    border-bottom: 1px solid #c2c2c2;
}
.goods_reply{
   margin-top: 150px;
   position: absolute;
}
.align-items-center{
   width: 100%;
}
.item{
    border: 1px solid #ccc;
   border-radius: 10px;
    text-align: center;
    height: 360px;
}
.item-img{
   height: 100px;
   width: 100%;
   padding-bottom: 20px;
}
.reivew-item{
   width: 100px;
    height: 100px;
    display: inline-block;
    border-radius: 100%;
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
}
.review-name{
   width: 100%;
    height: 40px;
    font-size: 24px;
    color: #000;
    padding: 30px 0px 10px 0px;
    margin-top: 30px;
    display: block;
}
.review-text{
   width: 100%;
    height: 90px;
    padding: 0px 50px;
    font-size: 16px;
    color: #000;
    text-align: center;
    line-height: 22px;
    letter-spacing: -1px;
    overflow: hidden;
    white-space: break-spaces;
    text-overflow: ellipsis;
    word-wrap: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
}
.location{
   width: 1010px;
    height: 70px;
    margin: 0px auto;
    float: right;
}
.location ul > li{
    height: 100%;
    line-height: 70px;
    display: inline-block;
    position: relative;
}
.last {
    width: 100%;
    height: 36px;
    overflow: hidden;
}
.amount span.minus {
    border-right: 1px solid #e0e0e0;
}
.amount {
    width: 135px;
    height: 34px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    overflow: hidden;
    float: left;
}
.amount span {
    width: 33px;
    height: 100%;
    text-align: center;
    display: inline-block;
    cursor: pointer;
    float: left;
}
.amount span.minus img {
    margin-top: 15px;
}
.amount input {
    width: 67px;
    height: 100%;
    display: inline-block;
    border: 0px;
    outline: 0px;
    text-align: center;
    font-size: 16px;
    float: left;
}
.amount span.plus {
    border-left: 1px solid #e0e0e0;
}
.amount span {
    width: 33px;
    height: 100%;
    text-align: center;
    display: inline-block;
    cursor: pointer;
    float: left;
}
.amount span.plus img {
    margin-top: 9px;
}
.bot .last .total_price {
    width: 250px;
    height: 100%;
    line-height: 36px;
    text-align: right;
    float: right;
}
.bot .last .total_price strong {
    font-family: 'NotoSansKR-Bold';
    font-size: 24px;
}
.bot .btns {
    width: 100%;
    height: 74px;
    padding-top: 30px;
    overflow: hidden;
}
.bot .btns a.btn01 {
    width: 212px;
    height: 72px;
    line-height: 72px;
    border: 1px solid #000;
    color: #000;
    float: left;
}
.bot .btns a {
    display: inline-block;
    font-size: 22px;
    text-align: center;
    font-weight: bold;
}
.bot .btns a.btn02 {
    width: 214px;
    height: 74px;
    line-height: 74px;
    color: #fff;
    background-color: #d7263d;
    float: right;
}
.btn-secondary {
   display: block;
   margin: 0px auto;
    text-align: center;
    background: #ed2553;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.like-content .btn-secondary:hover {
     transform: translateY(-3px);
}
.like-content .btn-secondary .fa {
     margin-right: 5px;
}
.animate-like {
   animation-name: likeAnimation;
   animation-iteration-count: 1;
   animation-fill-mode: forwards;
   animation-duration: 0.65s;
}
@keyframes likeAnimation {
  0%   { transform: scale(30); }
  100% { transform: scale(1); }
}
.prd_table {
    width: 100%;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    overflow: hidden;
}
.prd_table ul {
    width: 100%;
}
.prd_table ul li {
    width: 100%;
    height: 60px;
    line-height: 59px;
    font-size: 16px;
    border-bottom: 1px solid #e7e7e7;
    overflow: hidden;
}
.prd_table ul li .tit {
    width: 160px;
    height: 100%;
    background-color: #f7f7f7;
    color: #888;
    font-weight: bold;
    text-indent: 20px;
    float: left;
}
.prd_table ul li .cnt {
    width: 850px;
    height: 100%;
    text-indent: 20px;
    float: left;
}
.prd_table ul {
    width: 100%;
}
.like__btn {
    border: none;
    background-color: #e74c3c;
    color: white;
    cursor: pointer;
    padding: 0.8rem;
    border-radius: 0.4rem;
    max-width: 200px;
    transition: all ease 0.3s;
    display: flex;
    align-items: center;
}
.like__btn:hover {
        background-color: rgba(#e74c3c, 0.8);
    }

.like__btn:disabled {
        background-color: #d4cfcf;
        cursor: pointer;
    }


.like__icon {
    font-size: 1.2rem;
    margin-right: 0.3rem;
}

.like__number {
    font-size: 0.8rem;
}
.tab {
    width: 100%;
    height: 67px;
    padding-bottom: 100px;
    overflow: hidden;
}
.tab ul {
    width: 100%;
    height: 65px;
    border-top: 1px solid #000;
    border-bottom: 1px solid #e0e0e0;
    text-align: center;
    background-color: #fff;
    z-index: 101;
}
.tab ul li {
    width: 300px;
    height: 100%;
    line-height: 65px;
    display: inline-block;
    cursor: pointer;
}
.btn01{
   width: 214px;
   height: 74px;
   line-height: 74px;
   color: #000;
   background-color: #fff;
   border: 1px solid #000;
   float: left;
   display: inline-block;
   font-size: 22px;
   text-align: center;
   font-weight: bold;
}
.input-sm{
    width: 100%; /* 가로 사이즈 */
    padding: 10px; /* 내부여백 */
    padding-left: 12px;
    border: 1px solid #ddd;
    background: url(./arrow_down_18dp.png) no-repeat right 50%; /* 화살표 위치 */
    background-size: 30px; /* 화살표 크기 */
    border-radius: 4px;
    box-sizing: border-box;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    font-size: 12px;
    color: #000;
    outline:none;
    text-align: center;
    font-size: 20px;
}
.option-text{
   text-align: center;
}

.input-sm:hover {border: 1px solid #aaa;} /* 마우스오버 */
.img-fluid-1{
   width: 50%;
   height: 270px;
   padding: 15px;
}
.title{
   color: black;
}
a:visited {
   black;
}
.total_price{
   margin-top: 20px;
}
.orderBtn{
       width: 214px;
    height: 74px;
    line-height: 74px;
    color: #fff;
    background-color: #d7263d;
    float: right;
    display: inline-block;
    font-size: 22px;
    text-align: center;
    font-weight: bold;
}

</style>
</head>
<body>
  <div class="page-heading bg-light">
    <div class="container">
      <div class="row align-items-end text-center">
        <div class="col-lg-7 mx-auto">
          <h1>Product</h1>  
          <p class="mb-4"><a href="../main/main.do"><span style="color: #c71585">Home</span></a> /<a href="javascript:history.back();"><strong>목록</strong></a></p>        
        </div>
      </div>
    </div>
  </div>


  <div class="untree_co-section">
    <div class="container">
    <div class="row">

    
    <!-- detail 시작 -->
   <div class="goodsBox clear">

    <!-- 상품 요약정보 및 구매 시작 { -->
        <!-- 상품이미지 미리보기 시작 { -->
    <div class="goodsLeft">
    <div class="goodsImg">
       <img :src="wine_detail.poster" width="360" height="480" alt="">       
     </div>
    </div>
    <!-- } 상품이미지 미리보기 끝 -->
    <section class="goods_detail" style="padding-left: 20px;">
       <div class="goods_name">
          <div style="display: inline-block;">
          <p class="good_tit1">{{wine_detail.name}}</p>
          <p class="good_tit1">{{wine_detail.name_sub}}</p>
          </div>
          <div style="display: inline-flex; float: right;">

<%--             <button class="like__btn animated">
             <i class="like__icon fa fa-heart"></i>
             <span class="like__number">${like_total }</span>
           </button>  --%>

             </div>
      </div>
      <div class="goods_option">
         <table cellpadding="0" cellspacing="0" border="0" width="100%">
          <tbody><tr style="padding-bottom:5px;padding-top:5px;">
         <td class="goods_option_name" width="60">원산지</td>
            <td style="padding-right:10px"><span>{{wine_detail.nation}}</span></td>
         <td class="goods_option_name" width="90">용량</td>
            <td><span>{{wine_detail.capacity}}</span></td>
         </tr>
         <tr>
            <td class="goods_option_name">종류</td>
               <td><span>레드</span></td>
            <td class="goods_option_name">알콜도수</td>
               <td><span>{{wine_detail.alcohol}}</span></td>
         </tr>   
           
                   </tbody></table>
     </div><!-- // 옵션목록 끝 -->
     
     <div class="goods_price" style="height: 100%">
        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-bottom:1px solid #c2c2c2">
                  <tbody><tr>
            <td class="goods_price_name" width="130">소비자가격</td>
            <td colspan="3"><span style="font-size: 17px;"><strike>{{wine_detail.first_price}}</strike></span></td>
         </tr>   
                  <!-- 고객할인가만 있는 경우 -->
         <tr>
           <td class="goods_price_name">할인율</td>
           <td colspan="3"><span><strong style="color: #c71585; font-size: 19px;">{{wine_detail.discount}}</strong></span></td>
         </tr>
         <tr>
           <td class="goods_price_name">고객할인가</td>
          <td width="125" style="font-size: 17px;">
            {{wine_detail.price}}
         </td>
           </tr>
         </tbody></table>
         <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tbody><tr>
              
              <td>
              
              <div class="bot">
                     <p class="delivery_charge" style="margin-top: 20px;"> 배송비 <strong>무료</strong></p>
                     <p class="delivery_charge" style="margin: 0">출고정보&nbsp; <strong>결제일 3일 이내 출고</strong></p>   
                     <p class="delivery_charge"> 배송정보&nbsp; <strong>국내 배송 / 입점사 배송 / CJ대한통운</strong></p>                           
                        <div class="last" style="height: 100%">
                        
                  <!-- Select Box(수량) -->
                        옵션선택&nbsp;
                    <select name="account" class="input-sm" data-price="${vo.price }" id="account_select">
                    <c:forEach var="i" begin="1" end="${vo.account }">
                      <option class="option-text" value="${i }">${i }개</option> 
                    </c:forEach>
                  </select> 
                  <!-- Select Box(수량) -->
                    
                <div class="total_price">합계<strong class="dh_total_price">{{wine_detail.price}}</strong>원</div>
                        </div>

                        <div class="btns" style="margin-bottom: 50px;height: 100%;">
                         <form method="post" action="../wine/cart_insert.do">
                        <input type="hidden" name=ino id="wine_ino" value="${vo.ino }">
                        <input type="hidden" name=account id="goods_account">
                        <input type="hidden" name=total id="goods_total"> 
                            <input type=submit value="장바구니" class="btn01 purchase_proxy" data-gb="">
                             </form> 
                            <button title="바로구매" class="orderBtn" data-gb="direct">바로구매</button>
                        </div>
                    </div>
                 </td>
             </tr>
         </tbody></table>
      </div>
      
   </section>
</div>

    <!-- detail 끝 -->
    
   </div>
      </div> <!-- /.container -->
   </div> <!-- /.untree_co-section -->
   
      <div class="untree_co-section" style="padding: 50px; font-size: 20px;">
      <div class="container">
      <div class="row">
      <div class="tab">
            <ul>
              <li class="on tab_prd_detail" onclick="location.href='#info_1'"><span>상품설명</span></li>
              <li class="tab_prd_review" onclick="location.href='#info_2'"><span>구매후기</span></li>
              <li class="tab_prd_relate" onclick="location.href='#info_3'"><span>연관상품</span></li>
            </ul>
                </div>
        
        
        
      <p class="good_tit1" style="margin-bottom: 30px;" id="info_1">제품 상세정보</p>
      <div class="prd_table">
      <c:forEach var="vo" items="${list }">
      <ul>
              <li>
                   <div class="tit">생산국</div><div>
                   <div class="cnt">
                    ${vo.nation }  </div>
                   </div></li>
                   <li>
                   <div class="tit">생산지</div><div>
                   <div class="cnt">${vo.place }</div>
                   </div></li>
                     <li>
                    <div class="tit">빈티지</div><div>
                    <div class="cnt">${vo.vintage }</div>
                   </div></li>
                     <li>
                   <div class="tit">와이너리</div><div>
                   <div class="cnt">${vo.winery }</div>
                                </div></li>
                   <li>
                  <div class="tit">알콜도수</div><div>
                  <div class="cnt">${vo.alcohol }</div>
                  </div></li>
                    <li>
                    <div class="tit">용량</div><div>
                    <div class="cnt">${vo.capacity }</div>
                    </div></li>
                    </ul>
                    </c:forEach>
       </div>
      </div>
      </div>
      </div>
   
   
      <!-- 후기 영역 -->
      <div class="untree_co-section">
      <div class="container">
      <div class="row">


         <div class="row mb-5 align-items-center">
            <div class="col-md-6">
               <p class="good_tit1" style="font-size: 20px;"id="info_2">제품 구매후기</p>        
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
            <div class="riview-name" style="padding: 30px 0px 10px 0px;font-size: 24px;">chu****님</div>
               <div class="product-item" style="padding-bottom: 20px;">
               <div class="item-img" style="padding-bottom: 20px;">
                  <a href="#" class="product-img">
                  <span style="background-image:url(https://www.mydaynlife.com/wp-content/uploads/2021/06/CU-%ED%8E%B8%EC%9D%98%EC%A0%90-%EC%9D%8C-%EC%99%80%EC%9D%B8-%ED%9B%84%EA%B8%B0.jpg)" class="reivew-item"></span>
                  </a>
                  </div>
                  <div class="review-text" style="padding-top: 30px; text-align: center;">좋습니다 배송 빠르고 엄청 꼼꼼하게 배송옵니당</div>
                  <h3 class="title"><a href="#">2023-02-22</a></h3>
<!--                   <div class="price">
                     <del>£99.00</del> &mdash; <span>£69.00</span>
                  </div> -->
               </div>
            </div> <!-- /.item -->


            <div class="item">
            <div class="riview-name" style="padding: 30px 0px 10px 0px;font-size: 24px;">sun****님</div>
               <div class="product-item" style="padding-bottom: 20px;">
               <div class="item-img" style="padding-bottom: 20px;">
                  <a href="#" class="product-img">
                  <span style="background-image:url(https://blog.kakaocdn.net/dn/qlvXa/btqPe2IGVGV/IUHbdbvqgGGyM3u2hSQB00/img.jpg)" class="reivew-item"></span>
                  </a>
                  </div>
                  <div class="review-text" style="padding-top: 30px; text-align: center;">와린이도 감동하고 와인에 빠지게한 레전드 와인</div>
                  <h3 class="title"><a href="#">2023-02-22</a></h3>
<!--                   <div class="price">
                     <del>£99.00</del> &mdash; <span>£69.00</span>
                  </div> -->
               </div>
            </div> <!-- /.item -->


            <div class="item">
            <div class="riview-name" style="padding: 30px 0px 10px 0px;font-size: 24px;">oool****님</div>
               <div class="product-item" style="padding-bottom: 20px;">
               <div class="item-img" style="padding-bottom: 20px;">
                  <a href="#" class="product-img">
                  <span style="background-image:url(https://image.idus.com/image/files/16a4e4554bfd4295af3c9876ce4dfbc0_512.jpg)" class="reivew-item"></span>
                  </a>
                  </div>
                  <div class="review-text" style="padding-top: 30px; text-align: center;">포장이 섬세해서 좋았어요!</div>
                  <h3 class="title"><a href="#">2023-02-22</a></h3>
<!--                   <div class="price">
                     <del>£99.00</del> &mdash; <span>£69.00</span>
                  </div> -->
               </div>
            </div> <!-- /.item -->

            <div class="item">
            <div class="riview-name" style="padding: 30px 0px 10px 0px;font-size: 24px;">chu****님</div>
               <div class="product-item" style="padding-bottom: 20px;">
               <div class="item-img" style="padding-bottom: 20px;">
                  <a href="#" class="product-img">
                  <span style="background-image:url(https://www.mydaynlife.com/wp-content/uploads/2021/06/CU-%ED%8E%B8%EC%9D%98%EC%A0%90-%EC%9D%8C-%EC%99%80%EC%9D%B8-%ED%9B%84%EA%B8%B0.jpg)" class="reivew-item"></span>
                  </a>
                  </div>
                  <div class="review-text" style="padding-top: 30px; text-align: center;">금요일에 퇴근하고 한잔하니 정말 좋아요!</div>
                  <h3 class="title"><a href="#">2023-02-22</a></h3>
<!--                   <div class="price">
                     <del>£99.00</del> &mdash; <span>£69.00</span>
                  </div> -->
               </div>
            </div> <!-- /.item -->
            
         </div>


   </div>
   </div>
   </div>
   <!-- 후기 영역 -->
  
        <!-- 연관상품 영역 -->
      <div class="untree_co-section">
      <div class="container">
      <div class="row">
         <div class="row mb-5 align-items-center" id="info_3">
            <div class="col-md-6">
               <p class="good_tit1" style="font-size: 20px;">이 상품과 연관된 상품</p>        
            </div>
         </div> <!-- /.heading -->
         <div class="owl-4-slider owl-carousel">
         <c:forEach var="vo" items="${alist }" begin="1" end="6" step="2">
            <div class="item">
              <div class="product-item">
                <a href="../wine/before_detail.do?ino=${vo.ino }" class="product-img">
                  <img src="${vo.poster }" alt="Image" class="img-fluid-1">
                </a>
                <h5 class="title"><a href="../wine/before_detail.do?ino=${vo.ino }">${vo.name }</a></h5>
                <div class="price">
                  <span>${vo.price }원</span>
                </div>
              </div>
            </div> <!-- /.item -->
            </c:forEach>
         </div>


   </div>
   </div>
   </div>
   <!-- 후기 영역 -->
  
  
    <script>
  new Vue({
     el:'.goodsBox',
     data:{
        ino:${ino},
        wine_detail:{}
     },
     mounted:function(){
        let _this=this
        axios.get("http://localhost/web/wine/detail_vue.do",{
           params:{
              ino:this.ino
           }
        }).then(function(response){
           console.log(response.data)
           _this.wine_detail=response.data
        })
     }
  })
  
 
  
  

  
</script>
</body>
</html>