<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.FreeBoardDAO, beans.FreeBoardWriteBean,java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
	FreeBoardDAO dao = new FreeBoardDAO();
	ArrayList<FreeBoardWriteBean> latestList = dao.getTopFiveList();
%>
	<tiles:insertDefinition name="in.header" />
    <div id="in_wrapper_section">
        <section id="in_notice_outer">
            <article id="in_notice_article_csList">
                <div id="in_notice_article_csList_title">
                    <p>오늘 상담신청하신 분들</p>
                </div>
                <div style="padding:10px;">
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                    <p>paikga5(홍길동)</p>
                </div>
            </article>
            <article id="in_notice_article_top5ask">
                <div id="in_notice_article_top5ask_title">
                    <p>조회수 Top5 게시물</p>
                </div>
                <c:set var="list" value="<%=latestList %>" scope="request"></c:set>
                <div style="padding:10px;text-align: left;">
                	<c:forEach var="item" items="${list }">
                		<p>${item.freeboard_title } (조회수 : ${item.freeboard_readCount })</p>
                	</c:forEach>
                </div>
            </article>
            <article id="in_notice_article_top5keyword">
                <div id="in_notice_article_top5keyword_title">
                    <p>Top5 검색키워드</p>
                </div>
                <div style="padding:10px;">
                    <p>자바1.8</p>
                    <p>스프링4.0</p>
                    <p>마이바티스</p>
                    <p>커스텀태그</p>
                    <p>안드로이드</p>
                </div>
            </article>
        </section>
    </div>  
</body>
</html>
