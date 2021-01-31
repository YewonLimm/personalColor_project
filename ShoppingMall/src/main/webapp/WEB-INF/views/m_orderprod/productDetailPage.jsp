<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="상품 디테일 페이지" name="title"/>
</jsp:include>

<!-- 장바구니 버튼 선택 시 cart에 담기게 하기 위한 ajax처리 -->
<script>
	$(document).ready(function(){
		addItemToCart();
	});
	
	function addItemToCart() {
		$('#addItemToCart').click(function() {
			var m_product_code = '${productDto.m_product_code}';
			var m_customer_id = 'user10';
			var m_orderprod_count = $('input[name="m_orderprod_count"]').val();
			// controller로 보낼 데이터 json타입으로 만들기
			var sendObj = {
				"m_product_code":m_product_code,
				"m_customer_id":m_customer_id,
				"m_orderprod_count":m_orderprod_count
			}
			$.ajax({
				url: 'addItemToCart.do',
				type: 'post',
				data: JSON.stringify(sendObj),
				contentType: 'application/json; charset=UTF-8',
				dataType: 'json',
				success: function(responseObj){
					if(responseObj.addCartResult>0) {
						alert('상품을 장바구니에 담았습니다.');
					} else {
						alert('??뭔에 왜안담김?');
					}
				},
				error: function(){alert('실패');}
			});
		});
	}
</script>

<!-- 장바구니 버튼 클릭 시 user10의 장바구니 목록 가져오는  스크립트-->
<script>
	$(document).ready(function(){
		showCart();
	});
	function showCart() {
		$('#showCart').click(function() {
			var m_customer_id = 'user10';
			$.ajax({
				url: 'showCart/'+m_customer_id,
				type: 'get',
				dataType: 'json',
				success: function(responseList){
					$('#cart_content').empty();
					$.each(responseList.list, function(idx, item) {
						$('<div>')
						.append( $('<div>').html('상품코드: ' + item.m_product_code) )
						.append( $('<div>').html('상품개수: ' + item.m_orderprod_count) )
						.append( $('<div>').html('상품가격: ' + item.m_orderprod_price) )
						
						.append( $('<input type="hidden" name="m_orderprod_code" />').val(item.m_orderprod_code) )
						.append( $('<input type="hidden" name="m_customer_id" />').val(item.m_customer_id) )
						
						.append( $('<div>').html('<input type="button" value="삭제" id="deleteItemFromCart" />') )
						.appendTo('#cart_content');
					});
				},
				error: function(){alert('실패');}
			});
		});
	}
	
</script>

<!-- 장바구니(Cart) 버튼 클릭시 슬라이드 구현하는 jQuery -->
<script>
	$(document).ready(function(){
		$('.slideCart').click(function(){
			// $('.slideCart').next('div').toggleClass('cart_content');
			var slideCart = $('.slideCart').next('div');
			if (slideCart.is(':visible')) {
				slideCart.slideUp();
			} else {
				slideCart.slideDown();
			}
		});
	});
</script>

<style>
	form {
		height: 500px;
	}
	#itemDetailPage {
		display: flex;
	}
	#itemDetail {
		width: 70%;
	}
	#sideCart {
		width: 30%;
	}
	.cart_content {
		display: none;
	}
</style>

<input type="button" value="작성완료" id="writeQuestion2"/>
<div id="itemDetailPage">
	<div id="itemDetail">
		<form>
			<br/><br/><br/>
			상품 코드 &nbsp;&nbsp; ${productDto.m_product_code}<br/>
			이름 &nbsp;&nbsp; ${productDto.m_product_name}<br/>
			색상 &nbsp;&nbsp; ${productDto.m_product_color}<br/>
			가격 &nbsp;&nbsp; ${productDto.m_product_price}<br/>
			수량<input type="number" name="m_orderprod_count" />
			<br/><br/>
			
			<input type="button" value="장바구니 담기" id="addItemToCart"/>
			<input type="button" value="바로 주문하기" onclick=""/>
		</form>
	</div>
	<div id="sideCart">
		<button class="slideCart" id="showCart"> My Cart [ 0 ] </button>
		<div class="cart_content" id="cart_content">
			
				
			
		</div>
	</div>
</div>

<%@ include file="../template/footer.jsp" %>