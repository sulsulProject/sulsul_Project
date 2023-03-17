<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<!-- Add this after vue.js -->
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.modal-content {
    position: relative;
    display: flex;
    flex-direction: column;
    width: 800px;
    color: var(--bs-modal-color);
    pointer-events: auto;
    background-color: var(--bs-modal-bg);
    background-clip: padding-box;
    border: var(--bs-modal-border-width) solid var(--bs-modal-border-color);
    border-radius: var(--bs-modal-border-radius);
    outline: 0;
}
</style>
</head>
<body>
   <div class="untree_co-section details">
   
      <div class="container">
          <div class="row">
         <div class="text-right">
              <a href="../regular/regular.do" class="btn btn-smtext-right btn-warning"  >
              <span style="font-size: 15px">목록</span>
              </a>   
             </div>
         <div class="text-center">
            <b style="font-size: 40px; text-align: center">${vo.name}</b>
         </div>
         
          <div style="height: 30px"></div>
          <div class="col-lg-2" >
              <table class="table" >
                 <tr>
                    <td colspan="2"  style="border:none"><img src="${vo.poster }" style="width: 230px; height: 230px;"></td>
                 </tr>
                 <tr>
                    <td width="40%"><b>모임이름</b> </td>
                    <td width="60%" >${vo.name }</td>
                 </tr>
                 <tr>
                     <td width="40%"><b>회원수</b> </td>
                    <td width="60%">${vo.head }명 </td>
                 </tr>
                 <tr>
                     <td width="40%"><b>개설일</b></td>
                    <td width="60%">${vo.dbday } </td>
                 </tr>
                 <tr>
                 <tr>
                    <td  width="40%"><b>모임 소개</b></td>
                    <td width="60%" >${vo.content } </td>
                 </tr>
                 <tr>
                    <td colspan="2" style="border:none;" ><button type="button" class="btn btn-mb btn-warning" ><b>가입하기</b></button></td>
                 </tr>
              </table>
              
          </div>
       <div class="col-lg-1"></div>   
       <div class="col-lg-9" style="background-color: white">
       <div style="height: 20px"></div>
         <div style="height: 20px"></div>
          <!--======= 글쓰기 =========-->
          
            <div>
            <c:if test="${sessionScope.id!=null }">
             <b-button block variant="outline-secondary" style="background-color: white; height: 100px " id="show-btn" v-on:click="showModal()">새로운 소식을 남겨보세요</b-button>
            </c:if>
            <c:if test="${sessionScope.id==null }">
             <b-button block variant="outline-secondary" style="background-color: white; height: 100px " id="show-btn" v-on:click="showModalLogin()"><p style="font-size: 25px;  padding-top: 13px;">로그인을 한 후 이용해주세요</p></b-button>
            </c:if>
            <b-modal ref="my-modal" hide-footer title="글쓰기">
                 <table class="table app">
                  <tr>
                    <th width=15% class=text-right>내용</th>
                    <td width=85%>
                       <textarea rows="10" cols="80" v-model="content"></textarea>
                       <input type=hidden  v-model="rno" value=${vo.no } >
                       <input type=hidden  v-model="id" value={{id}} >
                    </td>
                 </tr>
                 <tr>
                    <th width=15% class=text-right>첨부파일</th>
                    <td width=85%>
                       <table class="table">
                          <tr>
                            <td class="text-right">
                               <input type=button value="추가" class="btn btn-xs btn-info" id="addBtn" v-on:click="addFile()">
                               <input type=button value="취소" class="btn btn-xs btn-warning" id="removeBtn" v-on:click="removeFile()">
                            </td>
                          </tr>
                       </table>
                         <table id="user-table">
                       <tr v-for="(file, index) in fileList" :key="index">
                         <td width="20%">File {{ index + 1 }}</td>
                         <td width="80%"><input type="file" v-model="fileList[index]" name="files[]"></td>
                       </tr>
                     </table>
                       <tr>
                       <td colspan="2" class="text-center">
                          <input type="submit" value = "전송" class="btn btn-sm btn-danger" v-on:click="insert()">
                          <input type="button" value = "취소" class="btn btn-sm btn-warning" v-on:click="hideModal()">
                       </td>
                    </tr>
                 </table>
           </div>
         <!-- 글쓰기 폼 -->
         <!-- ------------------------------------------------------------------------------------------------------------------- -->
         <!-- 글 디테일 -->
         <b-modal ref="my-detailmodal" hide-footer title="상세보기">
            <div class="rows">
                <table class="table">
                    <tr>
                       <th width=20% class="text-center">번호</th>
                       <td width=30% class="text-center">{{rb.rb_no}}</td>
                       <th width=20% class="text-center">작성일</th>
                       <td width=30% class="text-center">{{rb.dbday}}</td>
                    </tr>
                    <tr>
                       <th width=20% class="text-center">아이디</th>
                       <td width=30% class="text-center">{{rb.id}}</td>
                       <th width=20% class="text-center">조회수</th>
                       <td width=30% class="text-center">{{rb.hit}}</td>
                    </tr>
                    <tr>
                      <td colspan="4" class="text-left"   valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;boarder:none">{{rb.content}}</pre></td>
                    </tr>
                    <tr>
                      
                      <td colspan="4" class="text-center">
                        <button class="btn btn-xs btn-danger" v-on:click="showModalUpdate()" v-if="rb.id==rb.sid">수정</button>
                        <button class="btn btn-xs btn-success" v-on:click="showModalDelete(rb.rb_no, rb.id)" v-if="rb.id==rb.sid">삭제</button>
                        <button class="btn btn-xs btn-info" v-on:click="hideModal()">목록</button>
                      </td>
                    </tr>
                 </table>
           </div>
         </b-modal> <!-- 글 디테일 끝 -->
         <div style="height: 50px"></div>
         <!-- ------------------------------------------------------------------------------------------------------------------- -->
         <div class="row"><!-- 글 리스트 -->
             <input type="button" value = "글 보기" class="btn btn-sm btn-warning" v-on:click="send()">
            <table class="table">
                   <tr v-if=" nullchk == 0 ">
                      <td class="text-center">아직 작성된 글이 없습니다.</td>
                   </tr>
                <table v-if=" nullchk == 1 " style="height: 50px;">
                <tr style="border-bottom:0.5px solid lightgray" height="50px">
                     <th width="10%" class="text-center">아이디</th>
                  <th width="60%" >내용</th>
                  <th width="15%" class="text-center">작성일</th>
                  <th width="15%" class="text-center">조회수</th>
               </tr>
                 <tr v-for="rvo in regularBoard_list" style="border-bottom:0.5px solid lightgray"  height="40px">
                   <td width="10%" class="text-center">{{rvo.id}}</td>
                  <td width="60%" v-on:click="showDetail(rvo.rb_no)">{{rvo.content}}</td>
                  <td width="15%" class="text-center">{{rvo.dbday}}</td>
                  <td width="15%" class="text-center">{{rvo.hit}}</td>
                 </tr>
                 <tr >
                 <td colspan=4" class="text-center" style="padding-top: 10px">
                      <input type="button" value="이전"class="btn btn-xs btn-warning" v-on:click=prev()>
                        {{curpage}} page / {{totalpage}} pages
                      <input type="button" value="다음"class="btn btn-xs btn-warning" v-on:click=next()>
                    </td>
                 </tr>
            </table>
         </table>
          </div><!-- row -->
          
          <!-- 게시판 글 수정 -->
                <b-modal ref="my-modalUpdate" hide-footer title="수정하기">
            <div class="rows">
                <table class="table">
                    <tr>
                       <th width=20% class="text-center">번호</th>
                       <td width=30% class="text-center">{{rb.rb_no}}</td>
                       <th width=20% class="text-center">작성일</th>
                       <td width=30% class="text-center">{{rb.dbday}}</td>
                    </tr>
                    <tr>
                       <th width=20% class="text-center">아이디</th>
                       <td width=30% class="text-center">{{rb.id}}</td>
                       <th width=20% class="text-center">조회수</th>
                       <td width=30% class="text-center">{{rb.hit}}</td>
                    </tr>
                     <tr>
                       <th style="text-align: center;">내용</th>
                       <td colspan="3"><textarea rows="5" cols="70" v-model="content" style="  resize: none;">{{rb.content}}</textarea></td>
                     </tr> 
                    <tr>
                       <td colspan="4" class="text-center">
                          <input type="submit" value = "수정" class="btn btn-sm btn-danger" v-on:click="update(rb.rb_no, rb.id)">
                          <input type="button" value = "취소" class="btn btn-sm btn-warning" v-on:click="hideModal()">
                       </td>
                    </tr>
                 </table>
           </div>
         </b-modal>
       </div>
       </div>
     </div>
   </div>
   <script>
   console.log("detaillll")
    new Vue({
      el:'.details',
      data:{
           fileList: [],
           curpage:1,
          totalpage:0,
          regularBoard_list:[],
          content:'',
          rno:${vo.no},
          nullchk:99,
          rb:{}
      },
      
      methods:{
         showModal:function(){
            this.$refs['my-modal'].show()
         },
         showModalLogin:function(){
            location.href="../member/login.do"
         },
         hideModal:function(){
            /* this.fileList.splice(0), */
            this.$refs['my-modal'].hide()
            this.$refs['my-detailmodal'].hide()
            this.$refs['my-modalUpdate'].hide()
            console.log("몰곡으로 돌아가")
         },
         
         addFile:function() {
               this.fileList.push(null);
          },
          removeFile:function() {
            if (this.fileList.length > 0) {
              this.fileList.pop();
            }
          },
          send:function(){
            let _this = this
            console.log("cur:"+this.curpage)
            console.log("rno:"+this.rno)
            axios.get("http://localhost/web/regular/boardList_vue.do",{
               params:{
                  rno:this.rno,
                  page:this.curpage
               }
            }).then(function(response){
               console.log(response.data)
               _this.regularBoard_list = response.data;
               _this.nullchk = _this.regularBoard_list[0].curpage
               _this.curpage=response.data[0].curpage;
                  _this.totalpage=response.data[0].totalpage;
                  console.log("send rno:"+_this.rno)
                  console.log("send curpage:"+_this.curpage)
            })
         },
          prev:function(){
                 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
                 this.send()
           },
           next:function(){
              this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
              this.send()
           },
           insert:function(){
              let _this = this;
              axios.get('http://localhost/web/regular/board_insert_vue.do',{
                 params:{
                    content:this.content,
                    rno:this.rno
                 }
              }).then(function(response){
                 alert(response.data);
                 location.href= '../regular/detail.do?no=${vo.no}';
              })
           },
           showDetail:function(rb_no){
              
              let _this = this;
              console.log("rb_no:"+rb_no)
              axios.get('http://localhost/web/regular/boardDetail_vue.do',{
                 params:{
                    rb_no:rb_no
                 }
              }).then(function(response){
                 console.log(response.data);
                 _this.rb=response.data
              })
              this.$refs['my-detailmodal'].show()
           },
           showModalUpdate:function(rb_no){
              this.$refs['my-modalUpdate'].show()
           },
           update:function(rb_no, id){
              axios.get('http://localhost/web/regular/board_update_vue.do',{
                 params:{
                    content:this.content,
                    rb_no:rb_no,
                    id:id
                 }
              }).then(function(response){
                 alert(response.data);
                 location.href= '../regular/detail.do?no=${vo.no}';
              })
              
           },
           showModalDelete:function(rb_no, id){
              console.log("delete_rb_no:"+rb_no)
              axios.get('http://localhost/web/regular/board_delete_vue.do',{
                 params:{
                    rb_no:rb_no,
                    id:id
                 }
              }).then(function(response){
                 alert(response.data);
                 location.href= '../regular/detail.do?no=${vo.no}';
              })
              
           }
           
      }
   });
   
   
   
   </script>
</body>
</html>