<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /* .untree_co-section{
	border : 1px solid black;
}
.container{
    border : 1px solid red;
}  */
#side {
    position: sticky;
    top: 100px;
    right: 300px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div style="height: 20px"></div>
<div class="untree_co-section rows"> 
  <div class="container">
   <div class="row">
   <!-- 사이드 메뉴 시작 -->
    <div id="aside"class="col-lg-3">   
      <table id="side" class="table ">
      <tr>
        <th><h5><b>고객센터</b></h5></th>
       </tr>
       <tr>
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
  <!-- 사이드 메뉴 끝 -->
  
  <!-- content 시작 -->
  <div id ="content" class="col-lg-9" >
    <div>
      <div style="background-color: white">
       <b style="font-size: 23px">1:1 문의하기</b>
      </div>
      
      
      <span style="font-size:13px ">고객센터에서는 현재 2023-03-10 10:54에 등록된 문의글을(각 센터 게시판으로 이관된 건을 제외) 처리하고 있습니다.<br><br>
      <b>></b>&nbsp;1:1문의 답변처리는 ‘한국통합고객센터’와 각 센터의 CS팀 영업시간인 (평일 09:30 ~ 18:30) 중 진행되고 있으므로, 업무시간 외에 등록하신 문의는 업무시간부터 순차적으로 처리되는 점 참고바랍니다.<br><br>
      <b>></b>&nbsp;1:1게시판에 등록된 모든 문의는 ‘한국통합고객센터’를 통해 실제 답변을 할 수 있는 담당자들의 게시판으로 이관되어 처리되며, 즉시 답변 가능한 일반문의는 타 게시판 이관 없이 답변 완료 됩니다.<br><br>
	  <b>></b>&nbsp;게시물 처리 상태가 ‘(CA/NJ/일본/중국/독일/영국/스페인/호주/홍콩) 처리 중’ 등으로 표기되는 문의글은 상기 이유로 각각의 센터게시판으로 이관되어 처리되는 건들로 각 센터 업무시간에 처리되는 만큼, 국가별 시차가 달라 대기시간이 다소 길어질 수 있습니다.<br></span>
     
     
      <div style="height: 30px;"></div>
      
      <div class="row-lg-3" style="">
      
      <c:if test="${sessionScope.id!=null }">
      <c:if test="${sessionScope.id==id }">
      <div style="height: 5px;"></div>
       
        
       <c:if test="${count==0 }">
         <table class="table table-hover">
           <tr>
             <td style="padding-top: 20px;">
               <b style="font-size: 20px;">&nbsp;▶&nbsp;1:1문의 내역</b>
             </td>
             <td  class="text-right">
              <a href="../customer/ask_insert.do" class="btn btn-sm"  style="background-color:#D0F1FB ">
                <span style="font-size: 13px"><b>1:1문의하기</b></span>
              </a>
            </td>
           </tr>
           <tr>
            <td class="text-center" colspan="2">
              <h3>등록된 문의내역이 없습니다</h3>
            </td>            
           </tr>
         </table>
       </c:if>
        
  	 <c:if test="${count!=0 }">
	    <table class="table table-hover"  >
	     <thead>
	      <tr>
             <td style="padding-top: 20px;" colspan="2">
               <b style="font-size: 20px;">&nbsp;▶&nbsp;1:1문의 내역</b>
             </td>
             <td colspan="2" class="text-right">
              <a href="../customer/ask_insert.do" class="btn btn-sm"  style="background-color:#D0F1FB ">
                <span style="font-size: 15px">1:1문의하기</span>
              </a>
            </td>
           </tr>
	      <tr>
	        <th width="10%" class="text-center">번호</th>
	        <th width="45%" class="text-center">제목</th>
	         <th width="15%" class="text-center">이름</th> 
	        <th width="20%" class="text-center">작성일</th>
	      </tr>
	     </thead>
	     <tbody>
	       <tr v-for="vo in ask_list">
	        <td width="10%" class="text-center">{{vo.ano}}</td>
	        <td width="45%"><a :href="'../customer/ask_detail.do?ano='+vo.ano+'&cate_no=2'" style="color: black">{{vo.subject}}</a></td>
	        <td width="15%" class="text-center">{{vo.id}}</td> 
	        <td width="20%" class="text-center">{{vo.dbday}}</td>
	      </tr>
	     </tbody>
	    </table>
	    </c:if>
	    </c:if>
        </c:if>
        
        <c:if test="${sessionScope.id==null }">
         <div class="text-center">
           <p style="font-size: 30px;color:red">로그인을 해주세요!</p>
         </div>
        </c:if>
        </div>
        </div>
  	 </div><!-- content 끝 -->
    <div class="col-lg-3"> 
   </div>
 </div><!-- row 끝 -->
</div><!-- container 끝 -->
</div><!-- untree_co-section 끝 -->
<script>
  new Vue({
     el:'.rows',
     data:{
        ask_list:[]
     },
     mounted:function(){
    	 let _this=this
         axios.get("http://localhost/web/customer/ask_list_vue.do").then(function(response){
            console.log(response.data)
            _this.ask_list=response.data
         })
     }
     
  })
</script>
</body>
</html>