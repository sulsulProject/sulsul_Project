<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="site-nav mb-5">
		<div class="sticky-nav js-sticky-header">

			<div class="container position-relative">
				<div class="site-navigation text-center dark">
					<a href="../main/main.do" class="logo menu-absolute m-0">UntreeStore<span class="text-primary">.</span></a>

					<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
						<li class="active"><a href="../main/main.do">홈</a></li>
						<!-- 
						<li class="has-children">
							<a href="shop.html">주류</a>
							<ul class="dropdown">
								<li><a href="#">와인</a></li>
								<li><a href="#">위스키</a></li>
								<li><a href="#">브랜디/꼬냑</a></li>
							</ul>
						</li>
						 -->

						<li><a href="../wine/list.do">와인</a></li>
						<li><a href="shop.html">위스키</a></li>
						<li><a href="shop.html">브랜디/꼬냑</a></li>
						<li class="has-children">
							<a href="#">커뮤니티</a>
							<ul class="dropdown">
								<li><a href="../trade/list.do">개인거래</a></li>
								
								<li class="has-children"><a href="about.html">모임</a>
									<ul class="dropdown">
										<li><a href="../regular/regular.do">정기모임</a></li>
										<li><a href="#">번개모임</a></li>
										<li><a href="#">채팅</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="../customer/faq.do">고객센터</a></li>
						<li><a href="../notice/list.do">공지사항</a></li>

						
					</ul>




					<div class="menu-icons">

						<a href="#" class="btn-custom-search" id="btn-search">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
							</svg>
						</a>

						<a href="#" class="user-profile">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							</svg>
						</a>

						<a href="#" class="cart">
							<span class="item-in-cart">2</span>
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
							</svg>
						</a>
						
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