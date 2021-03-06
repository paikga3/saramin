<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><tiles:getAsString name="title"/></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1;" />
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0"/>    
    <tiles:insertAttribute name="style" />
    <script src="<%=request.getContextPath() %>/js/jquery-2.2.2.js"></script>
    <script src="<%=request.getContextPath() %>/js/in_header.js"></script>

</head>
<body>
<div id="in_wrapper">
	<div id="in_nav">
		<div id="in_main_link"><a href="<%=request.getContextPath() %>/index.jsp">사람</a></div>
		<div id="in_nav_main_function">
			<ul>
				<li class="in_nav_main_function_menu in_nav_menu_hover"><a href="<%=request.getContextPath() %>/pages/cal/in_cal.jsp">연봉계산기</a></li>
				<li class="in_nav_main_function_menu">|</li>
                <li class="in_nav_main_function_menu in_nav_menu_hover"><a href="<%=request.getContextPath() %>/pages/aptitudeView/aptitude01.jsp">적성검사</a></li>
                <li class="in_nav_main_function_menu">|</li>
                <li class="in_nav_main_function_menu in_nav_menu_hover"><a href="${pageContext.request.contextPath}/adviceRequset.admin">상담신청</a></li>
                <li class="in_nav_main_function_menu">|</li>
                <li class="in_nav_main_function_menu in_nav_menu_hover"><a href="<%=request.getContextPath() %>/init.board">자유게시판</a></li>
                <li class="in_nav_main_function_menu">|</li>
                <li class="in_nav_main_function_menu in_nav_menu_hover"><a href="<%=request.getContextPath() %>/main.search">검색서비스</a></li>
			</ul>
		</div>
        <div id="in_nav_side_function">
			<ul>
				<c:choose>
					<c:when test="${sessionScope.loginMemberInfo.member_no > 999}">
						<li class="in_nav_side_function_menu in_nav_menu_hover"><a href="#"><strong>${sessionScope.loginMemberInfo.member_name}</strong>님 환영합니다</a></li>
						<li class="in_nav_side_function_menu">/</li>
						<li class="in_nav_side_function_menu in_nav_menu_hover"><a href="#">회원정보 수정</a></li>
						<li class="in_nav_side_function_menu">/</li>
						<li class="in_nav_side_function_menu in_nav_menu_hover"><a href="${pageContext.request.contextPath}/logout.member">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="in_nav_side_function_menu in_nav_menu_hover"><a href="${pageContext.request.contextPath}/joinMenu.member">회원가입</a></li>
						<li class="in_nav_side_function_menu">/</li>
						<li class="in_nav_side_function_menu in_nav_menu_hover"><a href="${pageContext.request.contextPath}/loginMenu.member">로그인</a></li>
						<!-- <li class="in_nav_side_function_menu in_nav_menu_hover"><a href="#">관리자</a></li> -->
					</c:otherwise>
				</c:choose>
			</ul>
       </div>
	</div>
</div>