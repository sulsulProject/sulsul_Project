<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.recent_cnt {
    width: 100%;
    padding: 50px 0px 50px 0px;
    overflow: hidden;
}
.recent_cnt h5 {
    width: 100%;
    height: 50px;
    line-height: 50px;
    font-size: 34px;
    font-family: 'NotoSansKR-Bold';
    font-weight: bold;
    position: relative;
    padding-bottom: 40px;
}
.recent_cnt .item_box {
    width: 100%;
    box-sizing: border-box;
    padding: 5px 15px 15px 15px;
    min-height: 500px;
}
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.recent_cnt .item_box dl {
    width: 105%;
    padding-left: 15px;
    padding-top: 40px;
    padding-bottom: 40px;
    box-sizing: border-box;
    border-left: 2px solid #eee;
    position: relative;
    height: 1000px;
}
.recent_cnt .item_box dl dt {
    width: 100%;
    height: 40px;
    font-size: 12px;
    color: #888;
    position: absolute;
    top: -10px;
    left: 10px;
}
.recent_cnt .item_box dl dt span {
    width: 10px;
    height: 10px;
    border-radius: 100%;
    background-color: #d7253d;
    position: absolute;
    top: 3px;
    left: -16px;
}
.recent_cnt .item_box dl dt i {
    width: 120px;
    height: 38px;
    line-height: 36px;
    display: inline-block;
    border: 1px solid #eaeaea;
    background-color: #f5f5f5;
    border-radius: 38px;
    text-align: center;
    color: #878787;
    font-style: normal;
    position: absolute;
    top: -10px;
    left: 6px;
    font-family: 'NotoSansKR-Bold';
    font-weight: bold;
    font-size: 14px;
}
.recent_cnt .item_box dl dd {
    width: 200px;
    height: 230px;
    border: 1px solid #ccc;
    background-color: #fff;
    margin: 0px 14px 14px 0px;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    float: left;
}
.recent_cnt .item_box dl dd > a {
    width: 100%;
    height: 100%;
    display: inline-block;
}
img {
    width: 100%;
    vertical-align: middle;
    border-style: none;
    height: 100%;
    padding: 30px;
}
.recent_cnt h5 span {
    display: inline-block;
    line-height: 51px;
    font-size: 14px;
    color: #888;
    font-weight: normal;
    position: absolute;
    top: 0px;
    left: 190px;
}
</style>
</head>
<body>
	<div class="page-heading bg-light" style="height: 250px; margin-top: 70px">
    <div class="container">
      <div class="row align-items-center text-center">
        <div class="col-lg-7 mx-auto" style="padding-bottom: 100px;">
          <h1>Cookie</h1>
          <p class="mb-4"><a href="../main/main.do"><span style="color: #c71585">Sul</span></a> / <strong>상품</strong></p>        
        </div>
      </div>
    </div>
  </div>

<div class="untree_co-section">
  <div class="container">
   <div class="row rows">
   
   <div class="recent_cnt">
            <h5>최근 본 상품 <span>&nbsp;&nbsp;최근 본 상품이 최대 50개까지 저장됩니다.</span>

            <div class="item_box">
            <dl>
                    <dt><span></span><i>오늘 본 상품</i></dt>
                 <dd class="content_dd " v-for="vo in cookie_list">
                            <!--$tmp_arr['url']--><a :href="'../wine/detail.do?ino='+vo.ino" title="이동">
                            <figure style="height: 100%;width: 100%"><img :src="vo.poster">
                   <figcaption>{{vo.name}}</figcaption>
                            <div class="close" data-id="3" data-date="230312">×</div>
                            </figure></a>
               </dd>
            </dl>

           </div>
        </div>
   
   </div>
  </div>
</div>
<script>
  new Vue({
     el:'.recent_cnt',
     data:{
        cookie_list:[]
     },
     mounted:function(){
        let _this=this
        axios.get("http://localhost/web/wine/cookie_data_vue.do").then(function(response){
           _this.cookie_list=response.data
        })
     }
  })
</script>
</body>
</html>