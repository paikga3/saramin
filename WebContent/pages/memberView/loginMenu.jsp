<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="in.header.login" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">
	//auto expand textarea
	function adjust_textarea(h) {
		h.style.height = "20px";
		h.style.height = (h.scrollHeight) + "px";
	}

	function noEmail() {
		alert('Email이 존재하지 않습니다.');
	}

	function noPw() {
		alert('비밀번호가 맞지 않습니다.');
	}
	
	function loginOk() {
		alert('환영합니다.');
	}
</script>

<style type="text/css">
.form-style-8 {
	font-family: 'Open Sans Condensed', arial, sans;
	width: 500px;
	padding: 30px;
	background: #FFFFFF;
	margin: 50px auto;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-webkit-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
}

.form-style-8 h2 {
	background: #4D4D4D;
	text-transform: uppercase;
	font-family: 'Open Sans Condensed', sans-serif;
	color: #797979;
	font-size: 18px;
	font-weight: 100;
	padding: 20px;
	margin: -30px -30px 30px -30px;
}

.form-style-8 input[type="text"], .form-style-8 input[type="date"],
	.form-style-8 input[type="datetime"], .form-style-8 input[type="email"],
	.form-style-8 input[type="number"], .form-style-8 input[type="search"],
	.form-style-8 input[type="time"], .form-style-8 input[type="url"],
	.form-style-8 input[type="password"], .form-style-8 textarea,
	.form-style-8 select {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	display: block;
	width: 100%;
	padding: 7px;
	border: none;
	border-bottom: 1px solid #ddd;
	background: transparent;
	margin-bottom: 10px;
	font: 16px Arial, Helvetica, sans-serif;
	height: 45px;
}

.form-style-8 textarea {
	resize: none;
	overflow: hidden;
}

.form-style-8 input[type="button"], .form-style-8 input[type="submit"] {
	-moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
	-webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
	box-shadow: inset 0px 1px 0px 0px #45D6D6;
	background-color: #2CBBBB;
	border: 1px solid #27A0A0;
	display: inline-block;
	cursor: pointer;
	color: #FFFFFF;
	font-family: 'Open Sans Condensed', sans-serif;
	font-size: 14px;
	padding: 8px 18px;
	text-decoration: none;
	text-transform: uppercase;
}

.form-style-8 input[type="button"]:hover, .form-style-8 input[type="submit"]:hover
	{
	background: linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
	background-color: #34CACA;
}
</style>

<section>
	<br /> <br /> <br /> <br /> <br /> <br />
	<h2>관리자: admin@admin / admin</h2>
	<div class="form-style-8">
		<h2>Login to your account</h2>
		<form action="login.member" method="post">
			<input type="email" name="email" placeholder="Email" />
			<input type="password" name="pw" placeholder="Password" />
			<input type="submit" value="Login" />
		</form>
	</div>

	<c:if test="${requestScope.loginResult == 0}">
		<script>
			noEmail();
		</script>
	</c:if>
	<c:if test="${requestScope.loginResult == -1}">
		<script>
			noPw();
		</script>
	</c:if>
	<c:if test="${sessionScope.loginResult == 1}">
		<script>
			loginOk();
		</script>
	</c:if>
<%-- 	<br /> 세션 테스트, 회원 고유 번호(member_no) : ${sessionScope.loginMemberInfo.member_no}
	<br />loginResult : ${requestScope.loginResult}
	<br />${sessionScope.loginMemberInfo.member_name}
	<br />회원 빈즈 key = loginMemberInfo --%>


</section>
</body>
</html>