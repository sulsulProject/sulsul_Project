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

#side { //사이드바 같이 이동 시키려고
    position: sticky;
    top: 100px;
    right: 300px;
}

.button1{
	height: 40px;
	width: 400px;
	border :1px solid #D0F1FB;
	background:  #D0F1FB;
}
input{
	font-size:16px;
	width:347px;
	height:100%;
	border:0px; 
	outline:none;
	floate:left;
}
button{
	width:50px;
	height:100%;
	border:0px;
	background: #D0F1FB;
	outline:none;
	float:right;
	color:black;
}
/*/////////////////////////////////////////////*/

/* Style the tab */
.tab {
  overflow: auto;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width:800px; /* 가로 길이 추가*/
}

/* Style the buttons that are used to open the tab content
.tab button
 */
.tablinks{
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;  

}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
  width:800px; /* 가로 길이 추가*/
}
</style>
<script >
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
</head>
<body>
<div style="height: 20px"></div>
<div class="untree_co-section" style=" max-height: 1500px">
 <div class="container">
   <div class="row">
     <!-- 사이드 메뉴 시작 -->
       <div id="aside"class="col-lg-3">   
         <table id="side" class="table">
           <tr class ="menu" >
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

  <!-- content 시작 (우측 내용)-->
  <div id ="content" class="col-lg-9 container" >
     <div class="" background-color: black"> <!-- controller div태그 줄지 고민중 -->
        <div class="row-lg-1">
         <b style="font-size: 23px">고객센터FAQ</b>
        </div>
      </div>
      <div style="height:10px"></div>
       
       <!-- 나라별 고객 센터 소개 시작 -->
       <div class="container">
			<div class="row">
	        <div class="owl-4-slider owl-carousel">
			 <c:forEach var="vo" items="${nList }" begin="0" end="21">
				<div class="item" >
					<div class="product-item" style="background-color: #D0F1FB;border-radius: 1em;"">
							<sub style="color: gray">${vo.nation }</sub><br>
							<b>${vo.title }</b>
							<div style="padding-left:70px;">
							<img src="${vo.image }" style="height:60px;width: 60px;">
					     </div>
					     
					     <!--  TO_DO : 나라별 현재 시간 추가 / 업무 상태 추가 -->
						<div><b>시간추가</b></div>
						<div><b>업무중 추가</b></div>
						
					</div>
				</div> <!-- /.item -->
				</c:forEach>
			</div>
		</div> <!-- /.container --> 
     </div>
     <!-- 나라별 고객센터 소개 끝 -->
     
     <div class="col-lg-3">
       <!-- 크기 맞추려고 -->
     </div>
     
	 <div class="col-lg-9">
	   <!-- 나라별 고객센터 소개 dot 때문에 높이 조정 -->
       <div style="height: 50px"></div>
       <!-- 검색창  start -->
         <!-- 검색 창 수정할지 말지 고민중 -->
       <div class="button1 "  ><!-- style="position: absolute;left: 200px;" -->
         <input type="text" placeholder="검색어를 입력하세요">
         <button>검색</button>
       </div>
      
       <!-- Faq (탭스 사용) 시작 -->
       <div style="height: 50px"></div>
        
		<div class="tab">
		   <c:forEach var="fList" items="${fList }" > 
		  <button class="tablinks" style=""onclick="openCity(event, 'i')">${fList.cate}</button> 
		<!--   <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
		  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>  -->
		 </c:forEach> 
		</div>
		
		<!-- Tab content -->
		<div id="i" class="tabcontent">
		  <h3>London</h3>
		  <p>London is the capital city of England.</p>
		</div>
		
		<div id="Paris" class="tabcontent">
		  <h3>Paris</h3>
		  <p>Paris is the capital of France.</p>
		</div>
		
		<div id="Tokyo" class="tabcontent">
		  <h3>Tokyo</h3>
		  <p>Tokyo is the capital of Japan.</p>
		</div>
      <!-- Faq (탭스 사용) 끝 -->
  <c:forEach var="faqList" items="${faqList }"> -
       <div class="custom-block" data-aos="fade-up">
            <sub>${faqList.type }</sub>
            <h2 class="section-title">Accordion</h2>
            <div class="custom-accordion" id="accordion_1">
              <div class="accordion-item">
                <h2 class="mb-0">
                  <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">How to download and register?</button>
                </h2>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion_1">
                  <div class="accordion-body">
                    Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.
                  </div>
                </div>
              </div> <!-- .accordion-item -->
			</div>
          </div> <!-- END .custom-block -->
    </c:forEach>
   

    </div><!-- .col-lg-9 끝 -->
   </div> <!-- #content 끝 -->
  </div>
  </div>
</div>
</body>
</html>