<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li a:hover {
	font-color:#c71585!important;
	font-weight: bold;
	text-decoration: underline;
}
</style>
</head>
<body>
<nav class="site-nav mb-5">
		<div class="sticky-nav js-sticky-header">

			<div class="container position-relative">
				<div class="site-navigation text-center dark">
					<a href="../main/main.do" class="logo menu-absolute m-0"><span style="font-size: 22px">Sul</span><span class="text-primary" style="font-size: 22px">.</span></a>

					<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu" style="font-size: 14px">
						<li class=""><a href="../main/main.do" style="font-size: 14px">홈</a></li>

						<li><a href="../wine/list.do" style="font-size: 14px">와인</a></li>
						<li><a href="../wine/whiskey_list.do" style="font-size: 14px">위스키</a></li>
						<li><a href="../wine/cognac_list.do" style="font-size: 14px">브랜디/꼬냑</a></li>
						<li class="has-children">
							<a href="#" style="font-size: 14px">커뮤니티</a>
							<ul class="dropdown">
								<li class="has-children"><a href="#" style="font-size: 14px">마켓</a>
									<ul class="dropdown">
										<li><a href="../trade/trade_list.do">중고거래</a></li>
										<li><a href="../board/freeboard_list.do">자유게시판</a></li>
										<li><a href="../board/eventboard_list.do">이벤트게시판</a></li>
									</ul>
								</li>
								<li class="has-children"><a href="../regular/regular.do">모임</a>
									<ul class="dropdown">
										<li><a href="../regular/regular.do">정기모임</a></li>
										<li><a href="../regular/regular.do">번개모임</a></li>
										<!-- <li><a href="#">채팅</a></li> -->
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="../customer/faq.do" style="font-size: 14px">고객센터</a></li>
						<li><a href="../notice/list.do" style="font-size: 14px">공지사항</a></li>

						
					</ul>




					<div class="menu-icons">
						<a href="#" class="btn-custom-search" id="btn-search">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
							</svg>
						</a>
						 <c:if test="${sessionScope.id != null }">
		                  <c:if test="${sessionScope.admin =='n'}">
		                   <a href="../mypage/mypage_main.do" class="user-profile">
		                     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                        <path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		                     </svg>
		                  </a>
		                 </c:if>
		                  <c:if test="${sessionScope.admin =='y'}">
		                   <a href="../adminpage/admin_main.do" class="user-profile">
		                     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		                        <path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		                     </svg>
		                  </a>
		                 </c:if>
		                </c:if>
						<c:if test="${sessionScope.id!=null}">
						<a href="../wine/cart_list.do" class="cart" style="margin-right: 20px;">
							<!-- <span class="item-in-cart">2</span> -->
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
							</svg>
						</a>
						</c:if>
						<a href="../wine/recent.do" class="cart" style="margin-right: 20px;">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-stickies" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M3.5 2A1.5 1.5 0 0 0 2 3.5v11A1.5 1.5 0 0 0 3.5 16h6.086a1.5 1.5 0 0 0 1.06-.44l4.915-4.914A1.5 1.5 0 0 0 16 9.586V3.5A1.5 1.5 0 0 0 14.5 2h-11zM3 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 .5.5V9h-4.5A1.5 1.5 0 0 0 9 10.5V15H3.5a.5.5 0 0 1-.5-.5v-11zm7 11.293V10.5a.5.5 0 0 1 .5-.5h4.293L10 14.793z"/>
							</svg>
						</a>
						<c:if test="${sessionScope.id!=null}">
							<a href="../letter/recv_letter_list.do" class="cart" style="margin-right: 20px;">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi Envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
								</svg>
							</a>
						</c:if>


						
						
						<c:if test="${sessionScope.id==null}">
						  <a href="../member/login.do" id="btn-login">로그인</a>
						  <a href="../member/signup.do" class="btn-signup">회원가입</a>
						</c:if>
						<c:if test="${sessionScope.id!=null}">
						  <a href="../member/logout.do" id="btn-logout">로그아웃</a>
						</c:if>
					</div>

					<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>
</body>
</html>