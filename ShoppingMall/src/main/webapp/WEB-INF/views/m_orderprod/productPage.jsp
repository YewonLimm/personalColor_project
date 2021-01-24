<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="상품 페이지" name="title"/>
</jsp:include>

<style>
	#body {
		height: 500px;
	}
</style>


<div id="body">
	<h1>상품 목록 페이지</h1><br/>

	<form action="goProductDetailPage.do">
		<span id="~~">아이쉐도1</span><br/>
		<input type="hidden" name="m_product_code" value="ES010101" />
		<button>아이쉐도1</button>
		<br/><br/>
	</form>
	<form action="goProductDetailPage.do">
		<span id="~~">립1</span><br/>
		<input type="hidden" name="m_product_code" value="LIP010101" />
		<button>립클로즈1</button>
		<br/><br/><br/>
	</form>
</div>


<%@ include file="../template/footer.jsp" %>