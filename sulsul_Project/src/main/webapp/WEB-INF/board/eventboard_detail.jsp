<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.kindBtn {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border-radius: 5px;
  border-color: #b84592;
  color: #b84592;
  background-color: white;
  border: 1px solid #b84592;
  padding: 3px 8px;
  font-size: 0.8rem;
}
.listBtn {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border-radius: 5px;
  border-color: #b84592;
  color: #b84592;
  background-color: white;
  border: 1px solid #b84592;
  padding: 3px 8px;
  font-size: 1.2rem;
  font-weight: bold;
}
.listBtn:hover {
  background-color: #b84592;
  color: white;
}

.origin {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>이벤트 상세</h1>
          <p class="mb-4"><a href="index.html"><span style="color: #c71585">Sul</span></a> / <strong>EventBoard</strong></p>        
        </div>
      </div>
    </div>
  </div>
  
  <div class="untree_co-section rows" style="padding: 20px 0px;">
    <div class="container text-center" style="width: 720px;">
      <hr>
   		<img src="https://wine21.speedgabia.com/BANNER_MST/W0000537.jpg" style="width:690px; margin-bottom: 20px">
   		<div class="text-left" style="margin: 10px 0 15px;">
   		  <span class="kindBtn"><b>{{event_detail.kind}}</b></span><br>
   		  <div style="height: 5px"></div>
   		  <span style="font-size: 18px; font-weight: bold;">{{event_detail.title}}</span><br>
   		  <div style="height: 5px"></div>
   		  <img src="../images/board/calendar.png" style="width: 15px; height: 15px">&nbsp;<span style="font-size: 12px; font-weight: bold;">{{event_detail.rdate}}</span>
   		</div>
   		
   	  <table class=table style="table-layout: fixed;">
   	      <tr>
   	        <th width="20%" style="background-color: #f4f4f4; color: #404040" >장소</th>
   	        <td style="text-align: left"><span style="color:#808080; font-size: 14px; padding:15px"><b>{{event_detail.loc}}</b></span>&nbsp;&nbsp;</td>
   	      </tr>
   	      <tr>
   	        <th width="20%" style="background-color: #f4f4f4; color: #404040" >주최</th>
   	        <td style="text-align: left"><span style="color:#808080; font-size: 14px; padding:15px"><b>{{event_detail.host}}</b></span>&nbsp;&nbsp;</td>
   	      </tr>
   	      <tr class="text-center" v-for="img in event_detail.images.split('^')">
   	      	<td colspan="2" style="padding: 40px 0px 0px]">
   	          <img :src="img" style="width: 690px">
   	      	</td>
   	      </tr>
   	      <tr>
   	        <td colspan="2">
   	          <pre>{{event_detail.content}}</pre>
   	        </td>
   	      </tr>
   	      <tr>
   	        <td class="text-left" colspan="2" style="font-size: 12px;">
   	          {{event_detail.hash}}
   	        </td>
   	      </tr>
   	      <tr>
   	        <td colspan="2">
 	          <a href="../board/eventboard_list.do"><input type="button" class="listBtn" value="목록"></a>
   	        </td>
   	      </tr>
   	  </table>
    </div>
  </div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  ebno:${ebno},
		  event_detail:{}
	  },
	  mounted:function() {
		  let _this = this;
		  axios.get("http://localhost/web/board/eventboard_detail_vue.do",{
			  params:{
				  ebno:this.ebno
			  }
		  }).then(function(response){
			  console.log(response.data)
			  _this.event_detail = response.data
		  }) 
	  }
  })
</script>
</body>
</html>