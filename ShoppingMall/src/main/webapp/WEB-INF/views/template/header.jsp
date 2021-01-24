<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "환영합니다";
	}
	pageContext.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- CSS --%>
<link type="text/css" rel="stylesheet" href="resources/style/style.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<%-- CDN --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" integrity="sha384-9/D4ECZvKMVEJ9Bhr3ZnUAF+Ahlagp1cyPC7h5yDlZdXs4DQ/vRftzfd+2uFUuqS" crossorigin="anonymous"></script>
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<title>${title}</title>

</head>
<body>
	<div class="header">
		<div class="top-wrap" >
			<img id="logo" alt="로고" src="">
			<ul class="top">
				<%-- 로그인 하지 않은 상태 --%>
				<c:if test="${loginDto eq null}">
					<li><a href="/ShoppingMall/m_customerLoginPage.customer" >LOGIN</a></li>
					<li><a href="javascript:void(0)" >장바구니</a></li>
					<li><a href="javascript:void(0)" >마이페이지</a></li>
				</c:if>
				<%-- 로그인 상태 --%>
				<c:if test="${loginDto ne null }">
					<li style="font-size:12px; font-weight:900;" ><a href="javascript:void(0)">${loginDto.m_customer_id}(${loginDto.m_customer_name})</a>님 반갑습니다!</li>
					<li><a href="/ShoppingMall/m_customerLogoutPage.customer" >LOGOUT</a></li>
					<li><a href="javascript:void(0)" >장바구니</a></li>
					<li><a href="javascript:void(0)" >마이페이지</a></li>
				</c:if>
			</ul>
		</div>
		<nav>
			<ul class="menu-bar">
				<li><a href="javascript:void(0)" >ABOUT US</a></li>
				<li>
					<a href="goProductPage.do" >NEW/BEST</a>
					<ul class="depth1">
						<li><a href="javascript:void(0)" >패키지</a></li>
						<li><a href="javascript:void(0)" >NEW</a></li>
						<li><a href="javascript:void(0)" >BEST</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)" >MAKEUP</a>
					<ul class="depth1">
						<li class="depth2"><a href="javascript:void(0)" >EYE</a></li>
						<li><a href="javascript:void(0)" >LIP</a></li>
						<li><a href="javascript:void(0)" >FACE</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)" >BOARD</a>
					<ul class="depth1">
						<li><a href="javascript:void(0)" >REVIEW</a></li>
						<li><a href="javascript:void(0)" >QNA</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)" >EVENT</a>
					<ul class="depth1">
						<li><a href="javascript:void(0)" >종료된 이벤트</a></li>
						<li><a href="javascript:void(0)" >당첨자 확인</a></li>
						<li><a href="javascript:void(0)" >진행중인 이벤트</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)" >멤버쉽/쿠폰</a>
					<ul class="depth1">
						<li><a href="javascript:void(0)" >쿠폰</a></li>
						<li><a href="javascript:void(0)" >나의 등급</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
	<div class="body-wrap">