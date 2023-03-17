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
.tradeBtn {
	padding: 0.5rem 0.8rem;
	margin-top:10px;
	margin-right: 5px;
	font-size: 16px;
	font-weight: bold;
	-webkit-appearance: none;
  	-moz-appearance: none;
 	appearance: none;
 	text-align: center;
 	text-decoration: none;
    display: inline-block;
    width: auto;
    border: none;
    border-radius: 4px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    cursor: pointer;
    transition: 0.5s;
    background-color : #B84592;
}
.tradeBtn:hover {
  opacity: 0.8;
}
.tradeBtn:disabled {
  opacity: 0.5;
}
.origin {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>판매제품</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>Trade</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows" style="padding: 20px 0px;">
    <div class="container text-center" style="width: 720px;">
      <hr>
   	  <table class=table style="table-layout: fixed;">
   	      <tr>
   	        <a :href="trade_detail.image" class="gal-item" data-fancybox="gal">
    		<img :src="trade_detail.image" style="width: 360px; height: 480px; margin-bottom: 40px">
    		</a>
   	      </tr>
   	      <tr>
   	        <th width="20%">판매자</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.seller}}&nbsp;&nbsp;<a :href="'../letter/letter_insert.do?recv_id='+trade_detail.seller"><img src="../images/trade/letter-n.png" style="width: 20px; height: 20px"></a></td>
   	        <th width="20%">조회수</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.hit}}</td>
   	      </tr>
   	      <tr style="vertical-align: middle;">
   	        <th width="20%">제품</th>
   	        <td colspan="3" style="text-align: left">
   	        {{trade_detail.t1}}<br>
   	        {{trade_detail.t2}}
   	        </td>
   	      </tr>
   	      </tr>
   	        <th width="20%">지역</th>
   	        <td colspan="3" class="origin" style="text-align: left">{{trade_detail.loc}}</td>
   	      <tr>
   	      <tr>
   	        <th width="20%">가격</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.price}}</td>
   	        <th width="20%">판매이유</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.reason}}</td>
   	      </tr>
   	      <tr>
   	        <th width="20%">상태</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.state}}</td>
   	        <th width="20%">상품번호</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.pnum}}</td>
   	      </tr>
   	      <tr>
   	        <th width="20%">구매일</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.pdate}}</td>
   	        <th width="20%">거래방법</th>
   	        <td width="30%" style="text-align: left">{{trade_detail.method}}</td>
   	      </tr>
   	      <tr>
   	      	<th colspan="4" class="text-center">
   	          <a href="../chat/chat.do" class="tradeBtn"><span style="color: white;">채팅하기</span></a>
   	          <a href="../trade/trade_list.do" class="tradeBtn" style="background-color: #777777"><span style="color: white;">목&nbsp;&nbsp;록</span></a>
   	      	</th>
   	      </tr>
   	  </table>
    </div>
  </div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  tdno:${tdno},
		  trade_detail:{}
	  },
	  mounted:function() {
		  let _this = this;
		  axios.get("http://localhost/web/trade/trade_detail_vue.do",{
			  params:{
				  tdno:this.tdno
			  }
		  }).then(function(response){
			  console.log(response.data)
			  _this.trade_detail = response.data
		  }) 
	  }
  })
</script>
</body>
</html>