<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contents{font-family: "Playfair Display", serif;}
.teduri3{
box-shadow: 0px 10px 40px 0px rgb(192 192 192 / 20%);
margin-left:50px;
} 

</style>
</head>
<body>
<div class="col-md-9 teduri3">
<h2>좋아요</h2>
   <table class="table contents">
       <thead>
        <tr>
          <th width=10% class="text-center">No.</th>
          <th width=20% class="text-center"></th>
          <th width=35% class="text-center">상품목록</th>
          <th width=20% class="text-center">판매가</th>
          <th width=15% class="text-center">관리</th>
        </tr>
       </thead>
         <tbody>
          <tr v-for="vo in like_list">
        <td width=10% class="text-center">{{vo.lno}}.</td>
         <td width=20% class="text-center"><a :href="'../wine/before_detail.do?ino='+vo.ino"><img :src="vo.poster" style="width: 70px;"height="70px;"></a></td>
         <td width=35% class="text-center"><a :href="'../wine/before_detail.do?ino='+vo.ino">{{vo.name}}</a></td> 
        <td width=20% class="text-center">{{vo.price}}</td>
        <td width=15% class="text-center">
        <input type="button" value="삭제" class="btn btn-xs btn-dark" v-on:click="del(vo.lno)">
        </td>
      </tr> 
      <tr>
        <td colspan="5" class="text-center">
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
       el:'.teduri3',
       data:{
          like_list:[],
          curpage:1,
          totalpage:1
       },
       mounted:function(){
          this.send()
          
       },
       methods:{
          send:function(){
          let _this=this
          axios.get("http://localhost/web/mypage/mypage_like_list_vue.do",{
             params:{
                page:this.curpage
             }
          }).then(function(response){
             console.log(response.data)
             _this.like_list=response.data
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
          },
        del: function(lno) {
          let _this = this;
          if (confirm("정말 삭제하시겠습니까?")) {
            axios.get('http://localhost/web/mypage/like_list_delete_vue.do', {
              params: {
                lno: lno
              }
            }).then(function(response) {
              alert("삭제되었습니다.");
              location.href = "../mypage/mypage_like_list.do";
            })
          }
       }
       }
  })
</script> 
</body>
</html>