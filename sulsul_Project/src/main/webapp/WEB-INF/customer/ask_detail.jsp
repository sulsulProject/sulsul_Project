<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i = 0;
$(function(){
	$('.ups').click(function(){
		$('.updates').hide();
		let no = $(this).attr("data-no");
		if(i == 0) {
			$('#u'+no).show("slow");
			$(this).text("취소");
			i = 1;
		} else {
			$('#u'+no).hide("slow");
			$(this).text("수정");
			i = 0;
		}
	})
})
</script>
</head>
<body>
<div class="untree_co-section rows"> 
  <main>
  <div class="container">
   <div class="row">
      <div class="col-lg-1"></div> 
     
     <!-- detail 상세 내용 -->
     <div class="col-lg-10">
     <div style="height: 80px"></div>
      <div class="text-center" style="background-color: #D0F1FB; height:120px;padding-top:30px">
        <b style="font-size: 40px">1:1 문의내용</b>
          <p class="mb-4">
          <a href="../main/main.do">Sul</a> / <strong>고객센터</strong></p>        
      </div> 
        <div style="height: 30px"></div>
	   <table class="table" >
	   <tr>
	      <th width=20% class="text-center">번호</th>
	      <td width=30% class="text-center">${vo.ano}</td>
	      <th width=20% class="text-center">작성일</th>
	      <td width=30% class="text-center">${vo.dbday}</td>
	    </tr>
	    <tr>
	     <th width=20% class="text-center">아이디</th>
	     <td width=30% class="text-center">${vo.id}</td>
	     <th width=20% class="text-center"></th> <!-- 첨부 파일 자리 -->
	     <td width=30% class="text-center"></td>
	    </tr>
	    <tr>
	     <th width=20% class="text-center">제목</th>
	     <td width=30% class="text-center">${vo.subject}</td>
	     <th width=20% class="text-center"></th> <!-- 첨부 파일 자리 -->
	     <td width=30% class="text-center"></td>
	    </tr>
	    <tr>
	     <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content}</pre></td>
	    </tr>
	    <tr>
	     <td colspan="4" class="text-right">
	      <a href="../customer/ask_update.do?ano=${vo.ano} " class="btn btn-sm" style="background-color:#D0F1FB">수정</a>
	      <a href="../customer/ask_delete.do?ano=${vo.ano}" class="btn btn-sm" style="background-color:#DCDCDC">삭제</a>
	      <a href="../customer/ask.do" class="btn btn-sm" style="border-color:#D0F1FB ">목록</a>
	     </td>
	    </tr>
	   </table> 
	   
	   
	   <!-- 댓글 관련 내용 -->
	   <div style="height: 20px"></div>
       <c:if test="${rList.size()!=0 }">
       <table class="table">
          <tr>
           <td>
            <c:forEach var="rvo" items="${rList }">
              <table class="table">
                <tr>
                 <td class="text-left">◑&nbsp;${rvo.name }(${rvo.dbday })</td>
                 <td class="text-right">
                    <c:if test="${sessionScope.id == rvo.id }">
                     <span class="btn btn-xs ups" data-no="${rvo.no }" style="background-color:#D0F1FB">수정</span>
                     <a href="../reply/ask_delete.do?no=${rvo.no }&rno=${vo.ano}&cate_no=2" class="btn btn-xs" style="background-color:#DCDCDC">삭제</a>
                   </c:if>
                 </td>
                </tr>
                <tr>
                  <td colspan="2" class="text-left" valign="top"><pre style="white-space: pre-wrap;background-color: white;border: none">${rvo.msg }</pre></td>
                </tr>
                
                <!-- 수정 -->
                <tr style="display: none" id="u${rvo.no }" class="updates">
	             <td colspan="2" style="padding-left:250px">
	
	              <form method="post" action="../reply/ask_update.do">
	                <input type="hidden" name=no value="${rvo.no }">
	                <input type=hidden name=rno value="${vo.ano }">
	                <input type=hidden name=cate_no value="2">
	                <textarea rows="5" cols="88" name="msg" style="float: left">${rvo.msg }</textarea>
	                <input type=submit value="댓글수정" style="float: left;height: 104px;background-color:#D0F1FB" class="btn btn-sm">
	              </form>
	             </td>
	            </tr>
	          </table>
            </c:forEach>
            
            </td>
            </tr>
            </table>
            </c:if>	
            
            
            <c:if test="${sessionScope.id!=null }">
          <table class="table">
            <tr>
             <td>
            <form method="post" action="../reply/ask_insert.do">
                <input type=hidden name=rno value="${vo.ano }">
                <input type=hidden name=cate_no value="2">
                <textarea rows="3" cols="88" name="msg" style="float: left"></textarea>&nbsp;
                <input type=submit value="댓글쓰기" style="float: left;height: 70px;background:#D0F1FB " class="btn btn-sm">
              </form>
             </td>
            </tr>
          </table>
</c:if>
	   
	   <!-- 댓글 관련 끝 -->
     </div>
     <div class="col-lg-1"></div> 
    </div> <!-- row -->
   </div> <!--container  -->
   </main>
</div><!-- untree_co-section -->

</body>
</html>