<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
<style>
	.login-wrap{
		width: 400px;
		height: 500px;
		margin: 0 auto;
	}
	#login-form{
		width: 400px;
		height: 300px;
		margin: 50px auto 0 auto;
	}
	h2{
		text-align: center;
		margin-top: 100px;
	}
	li>input{
		outline: none;
		padding-left: 20px;
	}
	li>input, input[type="button"] {
		width: 100%;
		height: 50px;
		margin-top: 10px;
	}
	.find-btns>a {
		color: silver;
		margin-left : 10px;
		
	}
	.links{
		overflow: hidden;
		margin-top: 10px;
	}
	.auto-loginChkBox{
		float:left;
	}
	.find-btns{
		float: right;
	}
	
	
</style>

<script>
	$(function(){
		fn_login();
		$('#signUpBtn').click(function(){
			location.href='/ShoppingMall/m_customerSignUpPage.customer';
		});
	});
	
	function fn_login() {
		$('#loginBtn').click(function(){
			if($('#m_customer_id').val() == null || $('#m_customer_id').val() == '' ){
				$('#error-message').text('아이디를 입력해주세요').css('color', 'red');
				$('#m_customer_id').focus();
				return;
			}
			if($('#m_customer_pw').val()==null ||$('#m_customer_pw').val()=='') {
				$('#error-message').text('비밀번호를 입력해주세요').css('color','red');
				$('#m_customer_pw').focus();
				return;
			}
			$.ajax({
				url: '/ShoppingMall/LoginPwCheck',
				type: 'post',
				data: $('#login-form').serialize(),
				dataType: 'json',
				success: function(responseObj){
					if(!responseObj.result){
						$('#error-message').text('없는 회원이거나 회원 정보가 일치하지 않습니다.').css('color', 'red');
						$('#m_customer_id').focus();
					} else {
						location.href='/ShoppingMall/index.jsp';
					}
				},
				error: function(){
				    // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
					alert('실패');
				}
				
			});
		});
	}
	
</script>

<div class="login-wrap">
	<h2>로그인</h2>
	<form id="login-form" method="post">
		<ul>
			<li><input type="text" id="m_customer_id" name="m_customer_id" placeholder="아이디 입력" /></li>
			<li><input type="password" id="m_customer_pw" name="m_customer_pw" placeholder="비밀번호 입력" /></li>
			<li><span id="error-message" ></span></li>
		</ul>
		<div class="links">
			<div class="auto-loginChkBox">
				<input type="checkbox" id="auto-login" name="auto-login" />
				<label for="auto-login">자동로그인</label>
			</div>
			<div class="find-btns">
				<a href="location.href=''" >아이디 찾기</a>
				<a href="location.href=''" >비밀번호 찾기</a><br/>
			</div>
		</div >
			<input type="button" value="로그인" id="loginBtn"/>
			<br />
			<input type="button" value="회원가입" id="signUpBtn" />
		<br />
	</form>
</div>

<%@ include file="../template/footer.jsp" %>