<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
div.pic_detail_reply {
    width: 100%;
    padding-top: 15px;
}
input[type=button] {
	width: 70px;
	height: 40px;
	color: #27375C;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
	transition: 0.3s;
	border:none;
	border: 1px solid #27375C;
}
input[type=button]:hover {
	color: white;
	background-color: #27375C;
}
</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>글 상세</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>FreeBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
<div class="untree_co-section rows">
    <div class="container">
		<div class="wrapper row3 rows">
		  <main class="container clear">
		    <table class="table" id="freeaboard_detail">
		      <tr>
		        <th width=20% class="text-center">번호</th>
		        <td width=30%>${vo.fbno }</td>
		        <th width=20% class="text-center">작성일</th>
		        <td width=30%>${vo.dbday }</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center">이름</th>
		        <td width=30%>${vo.name }</td>
		        <th width=20% class="text-center">조회수</th>
		        <td width=30%>${vo.hit }</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center">제목</th>
		        <td colspan="3">${vo.subject }</td>
		      </tr>
		      <tr>
		        <th width=20% class="text-center" style="padding-top: 20px;">내용</th>
		        <td colspan="3" valign="top" height="200" style="padding-top: 20px;">
		        <pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="4" class="text-right">
		          <a href="../board/freeboard_update.do?fbno=${vo.fbno}" class="btn btn-xs btn-danger">수정</a>
		          <a href="../board/freeboard_delete.do?fbno=${vo.fbno}" class="btn btn-xs btn-success">삭제</a>
		          <a href="../board/freeboard_list.do" class="btn btn-xs btn-info">목록</a>
		        </td>
		      </tr>
		    </table>
		    <div style="height: 20px"></div>
        	
        <table class="table">
          <tr>
           <td>
            <c:forEach var="rvo" items="${rList }">
              <table class="table">
                <tr>
                 <td class="text-left">◑${rvo.name }(${rvo.dbday })</td>
                 <td class="text-right">
                   <c:if test="${sessionScope.id == rvo.id }">
                     <span class="btn btn-xs btn-info ups" data-no="${rvo.no }">수정</span>
                     <a href="../reply/freeboard_delete.do?no=${rvo.no }&rno=${vo.fbno}&cate_no=1" class="btn btn-xs btn-danger">삭제</a>
                   </c:if>
                 </td>
                </tr>
                <tr>
                  <td colspan="2" class="text-left" valign="top"><pre style="white-space: pre-wrap;background-color: white;border: none">${rvo.msg }</pre></td>
                </tr>
                
                <!-- 수정 -->
                <tr style="display: none" id="u${rvo.no }" class="updates">
	             <td colspan="2">
	              <form method="post" action="../reply/freeboard_update.do">
	                <input type="hidden" name=no value="${rvo.no }">
	                <input type=hidden name=rno value="${vo.fbno }">
	                <input type=hidden name=cate_no value="1">
	                <textarea rows="3" cols="115" name="msg" style="float: left">${rvo.msg }</textarea>
	                <input type=submit value="댓글수정" style="float: left;height: 82px; margin-left: 10px; background-color: lightgary" class="btn btn-sm">
	              </form>
	             </td>
	            </tr>
	            
              </table>
            </c:forEach>
           </td>
          </tr>
        </table>
        <c:if test="${sessionScope.id!=null }">
          <table class="table">
            <tr>
             <td>
              <form method="post" action="../reply/freeboard_insert.do">
                <input type=hidden name=rno value="${vo.fbno }">
                <input type=hidden name=cate_no value="1">
                <textarea rows="3" cols="115" name="msg" style="float: left"></textarea>
                <input type=submit value="댓글쓰기" style="float: left;height: 82px; margin-left: 10px" class="btn btn-sm btn-primary">
              </form>
             </td>
            </tr>
          </table>
        </c:if>
		    	
		  </main>
		</div>
	</div>
</div>

<script>
</script>
 
</body>
</html>