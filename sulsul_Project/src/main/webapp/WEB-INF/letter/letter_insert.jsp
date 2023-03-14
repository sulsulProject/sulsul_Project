<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
.form-group {
	margin-bottom: 15px;
}
</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>쪽지 보내기</h1>
          <p class="mb-4"><a href="index.html">Sul</a> / <strong>Letter</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows">
    <div class="container">
      <form method="post" action="../letter/letter_insert_ok.do">
        <div class="form-group">
            <label for="exampleFormControlInput1"><b>제목</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요." >
            <input type="hidden" class="form-control" id="exampleFormControlInput1" name="page" value="1"  >
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2"><b>보내는사람</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput2" name="send_id" placeholder="이름을 적어주세요." value="${send_id }">
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2"><b>받는사람</b></label>
            <input type="text" class="form-control" id="exampleFormControlInput2" name="recv_id" placeholder="이름을 적어주세요." value="${recv_id }">
        </div>
        
        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>내용</b></label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="10"></textarea>
        </div>
        <div class="text-center">
        <input type="submit" class="btn btn-info" value="쪽지보내기">
        <input type="button" class="btn btn-secondary" onclick="javascript:history.back()" value="취소">
    	</div>
   	  </form>
  </div>
</div>

</body>
</html>