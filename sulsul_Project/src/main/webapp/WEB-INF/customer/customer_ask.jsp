<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#side {
    position: sticky;
    top: 100px;
    right: 300px;
}
</style>
</head>
<body>
<div style="height: 20px"></div>
<div class="untree_co-section"> 
  <div class="container">
   <div class="row">
   <!-- 사이드 메뉴 시작 -->
    <div id="aside"class="col-lg-3">   
      <table id="side" class="table ">
      <tr>
        <th><h5>고객센터</h5></th>
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
    <div class="container" background-color: black"> <!-- controller div태그 줄지 고민중 -->
      <div class="" style="background-color: white">
       <b style="font-size: 23px">1:1 문의하기</b>
      </div>
      
      
      <span style="font-size:13px ">고객센터에서는 현재 2023-03-10 10:54에 등록된 문의글을(각 센터 게시판으로 이관된 건을 제외) 처리하고 있습니다.<br><br>
      <b>></b>&nbsp;1:1문의 답변처리는 ‘한국통합고객센터’와 각 센터의 CS팀 영업시간인 (평일 09:30 ~ 18:30) 중 진행되고 있으므로, 업무시간 외에 등록하신 문의는 업무시간부터 순차적으로 처리되는 점 참고바랍니다.<br><br>
      <b>></b>&nbsp;1:1게시판에 등록된 모든 문의는 ‘한국통합고객센터’를 통해 실제 답변을 할 수 있는 담당자들의 게시판으로 이관되어 처리되며, 즉시 답변 가능한 일반문의는 타 게시판 이관 없이 답변 완료 됩니다.<br><br>
	  <b>></b>&nbsp;게시물 처리 상태가 ‘(CA/NJ/일본/중국/독일/영국/스페인/호주/홍콩) 처리 중’ 등으로 표기되는 문의글은 상기 이유로 각각의 센터게시판으로 이관되어 처리되는 건들로 각 센터 업무시간에 처리되는 만큼, 국가별 시차가 달라 대기시간이 다소 길어질 수 있습니다.<br></span>
     
     
      <div style="height: 15px;"></div>
      
      <div class="row-lg-3" style="background-color: white">
      1:1 문의하기 내역 추가할지 말지 고민중
      </div>
     
      
         <div class="text-center" style="height: 100px;width: 200px;float:left;margin-left:100px;margin-top:20px;" >
            <a href="#" class="btn btn-sm text-center"  style="height: 100px;width: 200px;background-color:#D0F1FB ">
              <span style="font-size: 15px">1:1문의하기</span>
            </a>
         </div>
         <div style="height: 100px;width: 200px;display:inline-block;float:right;margin-right:100px;margin-top:20px;">
            <a href="#" class="btn btn-sm" style="height: 100px;width: 200px;background-color:#D0F1FB "">
             <span style="font-size: 15px">실시간 문의</span>
            </a> 
         </div>
      
    </div>
  </div><!-- content 끝 -->
 </div><!-- row 끝 -->
</div><!-- container 끝 -->
</div><!-- untree_co-section 끝 -->
</body>
</html>