<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="in.header" />
<section id="in_notice_outer"
	style="width: 80%; height: 400px; margin-left: 10%; margin-top: 50px; font-size: 20px;">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* visited link */
a:visited {
	color: green;
}

/* mouse over link */
a:hover {
	color: red;
}

/* selected link */
a:active {
	color: blue;
}
	
	
td, #di {
	font-family: 'Open Sans Condensed', arial, sans;
	font-size: 15px;
}

table {
	border-collapse: collapse;
	width: 100%;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-webkit-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}

.form-style-8 {
	font-family: 'Open Sans Condensed', arial, sans;
	width: 800px;
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
	.form-style-8 input[type="password"], .form-style-8 select {
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
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	display: block;
	width: 800px;
	padding: 7px;
	border: none;
	border-bottom: 1px solid #ddd;
	background: transparent;
	margin-bottom: 10px;
	font: 16px Arial, Helvetica, sans-serif;
	height: 200px;
}

.form-style-8 textarea {
	resize: none;
}

.form-style-8 input[type="button"], .form-style-8 input[type="submit"],
	input[type="button"] {
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

	<c:forEach var="i" items="${adviceDetails}" varStatus="vs">
		<c:choose>
			<c:when test="${vs.first}">
				<table>
					<tr>
						<th width="100px">상담 종류</th>
						<td width="100px">${ param.advice_type }</td>
						<th width="100px">제목</th>
						<td width="500px" colspan="3">${ param.advice_content }</td>
					</tr>
					<tr>
						<th width="100px">신청 내용</th>
						<td colspan="5" width="600px">${i.advice_content}</td>
					</tr>
					<tr>
						<th width="100px">이름</th>
						<td width="100px">${i.member_name}</td>
						<th width="100px">이메일</th>
						<td width="200px">${i.member_email}</td>
						<th width="100px">신청날짜</th>
						<td width="200px">${ param.advice_date }</td>
					</tr>
				</table>
				<br />
				
					<c:if test="${sessionScope.loginMemberInfo == null}">
						<div align="center" style="font-size: 15px">로그인 하시면 답변하실 수 있습니다.</div>
					</c:if>

					<div align="right">
						<c:if test="${i.member_no == loginMemberInfo.member_no}">
							<a href="${pageContext.request.contextPath}/adviceModify.admin?advice_no=${param.advice_no}">[수정]</a>　
							<a href="${pageContext.request.contextPath}/adviceDelete.admin?advice_no=${param.advice_no}">[삭제]</a>
						</c:if>
					</div>
					
					<div align="left" style="font-size: 15px"><a href="${pageContext.request.contextPath}/adviceRequset.admin">[리스트 보기]</a></div>
				
				<br />
				<br />
			</c:when>
			
			<c:otherwise>
				<table>
					<tr>
						<th width="100px">답변인</th>
						
						<c:choose>
							<c:when test="${i.member_no == 1000}">
								<td width="400px" style="color: red">${i.member_name}</td>	
							</c:when>
							<c:otherwise>
								<td width="400px">${i.member_name}</td>	
							</c:otherwise>
						</c:choose>
				
						<th width="100px">답변날짜</th>
						<td width="200px">${i.advice_re_date}</td>
					</tr>
					<tr>
						<td colspan="4" width="800px">${i.advice_content}</td>
					</tr>
				</table>
				<br />
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${sessionScope.loginMemberInfo.member_no > 999}">
		<div class="form-style-8">
			<form action="adviceRe.admin" method="post">
				<textarea name="reply"></textarea>
				<input type="hidden" name="advice_no" value="${param.advice_no}"/>
				<input type="hidden" name="advice_type" value="${param.advice_type}"/>
				<input type="hidden" name="advice_content" value="${param.advice_content}"/>
				<input type="hidden" name="advice_date" value="${param.advice_date}"/>
				<input type="submit" value="답변하기" />
			</form>
		</div>
	</c:if>


</section>
</body>
</html>