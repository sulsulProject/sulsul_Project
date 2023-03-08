<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.untree_co-section{
	border : 1px solid black;
}
.container{
    border : 1px solid red;
}
.table {
  text-decoration: none; /* 링크의 밑줄 제거 */
  color: inherit; /* 링크의 색상 제거 */ 
}
#side {
    position: sticky;
    top: 100px;
    right: 300px;
}
</style>
</head>
<body>
<div class="untree_co-section"> <!-- untree_co-section -->
  <div class="container" style="max-width: 1100px;">
   <div class="row">
   <!-- style="text-decoration:none;color: #212121" 알아내기 -->
    <div id="aside"class="col-lg-3">   
      <table id="side" class="table" style="background-color: yellow">
      <tr >
        <th><h5>고객센터</h5></th>
       </tr>
       <tr >
        <th><a href="../customer/faq.do">FAQ</a></th>
       </tr>
       <tr>
        <th><a href="../customer/iu.do">이용안내</a></th>
       </tr>
       <tr>
        <th><a href="../customer/ask.do">1:1 문의하기</a></th>
       </tr>
      </table>
    </div>
  
  <!-- aside를 눌렀을 때 content 내용 바뀌기 -->
  <div id ="content" class="col-lg-9" style="background-color: pink">
    <div class="container" background-color: black"> <!-- controller div태그 줄지 고민중 -->
      <div class="row-lg-1" style="background-color: white">
       <h4 style="padding: 0.75rem;"><b>이용안내</b></h4>
       <!-- <img src="https://post.malltail.com/img/page/new_faqs_main_01.gif"> -->
      </div>
      <div style="height: 10px;"></div>
      <div class="row-lg-3" style="background-color: white">
       <!-- 우리 이름으로 수정해서 넣기 -->
       <img src="https://post.malltail.com/img/banner/banner_malltail_howto.jpg" style="width: 750px">
      </div>
      <div style="height: 15px;"></div>
      <div class="row-lg-3 rows" style="background-color: green">
         <!-- 이용 안내 테이블 -->
        <table class="table">
          <thead>
           <tr>
            <th width="10%" class="text-center">번호</th>
            <th width="50%" class="text-center">제목</th>
            <th width="20%" class="text-center">작성일</th>
            <th width="10%" class="text-center">조회수</th>
          </tr>
         </thead>
         <tbody>
          <c:forEach var="vo" items="${list }">
           <tr> 
            <td width="10%" class="text-center">${vo.iuno }</td>
            <td width="50%" class="text-center">${vo.subject }</td>
            <td width="20%" class="text-center">${vo.dbday }</td>
            <td width="10%" class="text-center">${vo.hit }</td>
          </tr>
          </c:forEach>
          <tr> <!-- 수정  -->
           <td colspan="5" class="text-center">
          <input type="button" value="이전"class="btn btn-sm btn-danger" >
          <input type="button" value="다음"class="btn btn-sm btn-warning" >
        </td>
          </tr>
         </tbody>
        </table>
      </div> <!-- row-lg-3 끝 -->
    </div> <!-- container 끝 -->
  </div> <!-- id 값 content 끝 -->
  </div> <!-- row 끝 -->
  </div> <!-- 첫번째 container 끝 -->
</div>
<!-- <script>
new Vue({
		el:'.rows',
		data:{
			information_list:[],
			curepage:1,
			totalpage:0
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				let _this=this
				axios.get("http://localhost/web/infomation/list_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(function(response){
					console.log(response.data)
					_this.information_list=response.data
					_this.curpage=response.data[0].curpage
		            _this.totalpage=response.data[0].totalpage
				})
			},
			prev:function(){
				this.curpage=this.curpage>1?this.curpage-1:this.curpage;
				this.send()
			},
			next:function(){
				this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
				this.send()
			}
		}
	})
</script> -->
</body>
</html>