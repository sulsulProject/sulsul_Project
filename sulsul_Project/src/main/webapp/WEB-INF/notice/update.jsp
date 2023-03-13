<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
th,h1{font-family: "Playfair Display", serif;}

</style>
</head>
<body>
<div class="untree_co-section rows">
    <div class="container">
     <div style="height: 30px"></div>
       <h1 style="margin-bottom: 20px">Notice</h1>
        <table class="table">
      <tr>
        <th width="20%">제목</th>
        <td width="80%"><input type="text" size="60" class="input-sm" v-model="subject"></td>
      </tr>
      <tr>
        <th width="20%">내용</th>
        <td width="90%"><textarea rows="20" cols="80" v-model="content"></textarea></td>
      </tr>
      <tr>
        <th width="20%">비밀번호</th>
        <td width="80%"><input type="password" size="10" class="input-sm" v-model="pwd"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="수정하기" class="btn btn-xs btn-dark" v-on:click="update()">
          <input type="button" value="취소" class="btn btn-xs btn-dark" onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
       </div>
     </div>
     <script>
new Vue({
    el:'.rows',
    data:{
       subject:'',
       content:'',
       pwd:'',
       no:${no}
    },
    mounted:function(){
          let _this=this;
          axios.get('http://localhost/web/notice/update_vue.do',{
             params:{
               no:this.no
             }
          }).then(function(response){
             _this.subject=response.data.subject
             _this.content=response.data.content
          })
    },
    methods:{
       update:function(){
          let _this=this;
          axios.get('http://localhost/web/notice/update_ok_vue.do',{
             params:{
               no:this.no,
               subject:this.subject,
               content:this.content,
               pwd:this.pwd
             }
          }).then(function(response){
            let res=response.data
            if(res==='yes')
            {
               location.href="../notice/detail.do?no="+_this.no
            }
            else
            {
               alert('비밀번호가 틀립니다')
               _this.pwd=''
               _this.$refs.pwd.focus() 
            }
          })
       }
    }
 })


</script>
</body>
</html>