<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contents{font-family: "Playfair Display", serif;}
.teduri4{
box-shadow: 0px 10px 40px 0px rgb(192 192 192 / 20%);
margin-left:50px;
} 

</style>
</head>
<body>
<div class="col-md-9 teduri4">
<h2>주문내역</h2>
   <table class="table contents">
       <thead>
        <tr>
          <th width=5% class="text-center">No.</th>
          <th width=5% class="text-center">id</th>
          <th width=10% class="text-center"></th>
          <th width=20% class="text-center">상품목록</th>
          <th width=10% class="text-center">수량</th>
          <th width=15% class="text-center">총가격</th>
          <th width=20% class="text-center">주문일자</th>
          <th width=15% class="text-center">주문관리</th>
        </tr>
       </thead>
         <tbody>
          <tr v-for="vo in order_list">
         <td width=5% class="text-center">{{vo.bno}}.</td>
         <td width=5% class="text-center">{{vo.id}}</td>
         <td width=10% class="text-center"><a :href="'../wine/before_detail.do?ino='+vo.ino"><img :src="vo.poster" style="width: 70px;"height="70px;"></a></td>
         <td width=20% class="text-center"><a :href="'../wine/before_detail.do?ino='+vo.ino">{{vo.name}}</a></td> 
         <td width=10% class="text-center">{{vo.account}}</td> 
         <td width=15% class="text-center">{{vo.total_price}}원</td>
         <td width=20% class="text-center">{{vo.dbday}}</td>
         
         <td width=15% class="text-center" v-if="vo.buy_ok=='n'"><span class="btn btn-xs btn-outline-primary" v-on:click="Bok(vo)">주문승인</span></td>
         <td width=15% class="text-center" v-else><span class="btn btn-xs btn-outline-info" >승인완료</span>
         </td>
         
      </tr> 
      <tr>
        <td colspan="8" class="text-center">
         <input type=button value="이전"  class="btn btn-xs btn-dark " v-on:click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button value="다음"  class="btn btn-xs btn-dark" v-on:click="next()">
        </td>
      </tr>
     </tbody>  
     </table>
    </div>
    <script>
    new Vue({
    	el:'.teduri4',
    	data:{
    		order_list:[],
    		curpage:1,
    	    totalpage:1
    	},
    	mounted:function(){
    		  this.send()
    		  
    	  },
    	  methods:{
      		  send:function(){
      		  let _this=this
      		  axios.get("http://localhost/web/adminpage/admin_order_list_vue.do",{
      			  params:{
      				  page:this.curpage
      			  }
      		  }).then(function(response){
      			  console.log(response.data)
      			  _this.order_list=response.data
      			  _this.curpage=response.data[0].curpage
      			  _this.totalpage=response.data[0].totalpage
      		  })
      	   },
      	   prev:function(){
      			  this.curpage=this.curpage>1?this.curpage-1:this.curpage
      			  this.send()
      		  },
      		  next:function(){
      			  this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
      			  this.send()
      		  } ,
      		Bok:function(vo){
      			let _this=this
      			axios.get("http://localhost/web/adminpage/admin_order_ok_vue.do",{
      				params:{
      					bno:vo.bno
      				}
      			}).then(function(){
      				alert("승인접수되었습니다.")
      				location.href="../adminpage/order_list.do";	
      		})
    	   }
    	  }
    })
    </script>
</body>
</html>