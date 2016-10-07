<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties, beans.MemberBean" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="freeboard_detail" />
<%
	Properties prop = new Properties();
	prop.load(new MemberBean().getClass().getResourceAsStream("../properties/request.prop"));
	String url = prop.getProperty(request.getParameter("type"));
	request.setAttribute("url", url);
%>
	<div id="in_wrapper_section">
		<div id="free_wrapper">
			<div style="float:left;margin-top:10px;">
				<a id="goList" href="#" style="color:#4335EF;font-weight: bold;">리스트로 가기</a>
				<form action="${url }" method="post">
					<input type="hidden" name="page" value="${requestScope.page }"/>	
				</form>
			</div>
			<c:if test="${sessionScope.loginMemberInfo.member_name == requestScope.bean.freeboard_alias }">
				<div id="free_update" class="free_upper_button">
					<a href="#" id="free_update_button" style="color:white;">수정하기</a>
				</div>
				<div id="free_delete" class="free_upper_button" style="margin-right:20px;">
					<a href="#" id="free_delete_button" style="color:white;">삭제하기</a>
					<form action="free_delete.board" method="post">
						<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
						<input type="hidden" name="page" value="${requestScope.page }"/>
						<input type="hidden" name="type" value="${param.type }">
					</form>
				</div>
			</c:if>
			
			
			<div id="free_content">
				<div id="free_content_upper">
					<div id="free_intro">
						<div style="margin-left:10px;"><span>${requestScope.bean.freeboard_alias }</span></div>
						<div style="margin-left:10px; margin-top:5px;"><span>${requestScope.bean.passTime }</span></div>
					</div>
				
					<div id="free_content_center">
						<div>
							<span>답글수 ${requestScope.bean.freeboard_replyCount }</span>
							<span style="margin-left:20px;">조회수 ${requestScope.bean.freeboard_readCount }</span>
						</div>
					</div>
				</div>
			
				<div style="clear:both;">
					<div style="float:left;width:810px;">
						<div id="free_title">
							<div class="free_title_inner"><span># ${requestScope.bean.freeboard_no }</span></div>
							<div class="free_title_inner"><span>${requestScope.bean.freeboard_title }</span></div>
						</div>
						<div id="content" style="min-height: 200px;">
							<span>
								${requestScope.bean.freeboard_contents }
							</span>
							<div id="free_update_form" style="display:none;">
								<form action="free_update.board">
									<textarea style="width:780px;height:150px;" name="content">${requestScope.bean.freeboard_contents }</textarea>
									<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
									<input type="hidden" name="page" value="${requestScope.page }"/>
									<input type="hidden" name="type" value="${param.type }">
								</form>						
								<button id="free_update_bt">수정</button>
								<button id="free_update_cancel">취소</button>
							</div>
						</div>
					</div>
					<div id="free_right">
						<p id="free_recommand">추천하기</p>
						<form action="free_recommand.board" method="post">
							<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
							<input type="hidden" name="page" value="${requestScope.page }"/>
							<input type="hidden" name="type" value="${param.type }">
						</form>
						<p style="margin-top:10px;clear:both;">${requestScope.bean.freeboard_recommand }</p>
					</div>
				</div>
			</div>
		</div>
		
		<div id="reply">
			<div id="reply_count">
				<span>답변 ${requestScope.bean.freeboard_replyCount }개</span>
			</div>
			
			<c:forEach var="item" items="${requestScope.replyList }">
				<div class="reply_wrapper">
					<div class="reply_upper">
						<div class="reply_upper_left">
							<div class="reply_alias"><span>${item.freeboard_alias }</span></div>
							<div class="reply_passtime"><span>${item.passTime }</span></div>
						</div>

						<div class="reply_upper_right">
							<p class="reply_upper_recommand">추천하기</p>
							<form action="reply_recommand.board">
								<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
								<input type="hidden" name="page" value="${requestScope.page }"/>
								<input type="hidden" name="type" value="${param.type }">
								<input type="hidden" name="free_re_no" value="${item.freeboard_re_no }">
							</form>
							<div class="reply_upper_count"><span>${item.freeboard_recommand }</span></div>
						</div>
						
						<c:if test="${item.freeboard_alias == sessionScope.loginMemberInfo.member_name }">
							<div class="reply_upper_right">
								<div class="reply_upper_update">
									<a class="reply_modify_link" href="#" style="color:white;">수정하기</a>
								</div>
								<div class="reply_upper_update">
									<a class="reply_delete_link" href="#" style="color:white;">삭제하기</a>
									<form class="reply_delete" action="replyDelete.board" method="post">
										<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
										<input type="hidden" name="page" value="${requestScope.page }"/>
										<input type="hidden" name="type" value="${param.type }">
										<input type="hidden" name="target" value="${item.freeboard_re_no }"/>
									</form>
								</div>
							</div>
						</c:if>
					</div>
					<div class="reply_content">
						<span>${item.freeboard_contents }</span>
						<div class="reply_update_form" style="display:none;">
							<form action="reply_update.board">
								<textarea style="width:850px;height:100px;" name="content">${item.freeboard_contents }</textarea>
								<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
								<input type="hidden" name="page" value="${requestScope.page }"/>
								<input type="hidden" name="type" value="${param.type }">
								<input type="hidden" name="target" value="${item.freeboard_re_no }"/>
							</form>						
							<button class="reply_update">수정</button>
							<button class="reply_update_cancel">취소</button>
						</div>
						
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="reply_write_wrapper">
			<%
				if(session.getAttribute("loginMemberInfo") != null) {
			
			%>
			<form id="reply_write_form" action="replyAdd.board" method="post">
				<input type="hidden" name="free_no" value="${requestScope.bean.freeboard_no }"/>
				<input type="hidden" name="writer" value="${sessionScope.loginMemberInfo.member_name }" />
				<input type="hidden" name="page" value="${requestScope.page }"/>
				<input type="hidden" name="type" value="${param.type }"/>
				<textarea rows="10" style="width:800px;" name="content"></textarea>
				<button id="reply_write">댓글 쓰기</button>
			</form>
			<%
				} else {
			%>
			<p style="margin-bottom:50px;">로그인을 하시면 댓글을 입력하실 수 있습니다.</p>
			<%} %>
		</div>
		
		<script type="text/javascript">
			(function() {
				$('#free_right').css('height', $('#free_title').height() + $('#content').height() + 21 + 'px');
				$('#reply').css('margin-top', $('#free_right').height() + 150 + 'px');
				
				$('#goList').click(function() {
					$(this).next('form').trigger('submit');
					return false;
				}).hover(function() {
					$(this).css('text-decoration', 'underline');
				}, function() {
					$(this).css('text-decoration', 'none');
				});
				
				$('.free_upper_button').hover(function() {
					$(this).css({
						backgroundColor: '#F95948',
						cursor: 'pointer'
					});
				}, function() {
					$(this).css({
						backgroundColor: '#30CE4E',
						cursor: 'default'
					});
				});
				
				$('#free_recommand, .reply_upper_recommand, .reply_upper_update').hover(function() {
					$(this).css({
						backgroundColor: '#F95948',
						cursor: 'pointer'
					});
				}, function() {
					$(this).css({
						backgroundColor: '#30CE4E',
						cursor: 'default'
					});
				});
				
				$('#reply_write').click(function() {
					$('#reply_write_form').trigger('submit');
					return false;
				});
				
				$('.reply_delete_link').click(function() {
					$(this).next('.reply_delete').trigger('submit');
					return false;
				});
				
				$('#free_recommand').click(function() {
					$(this).next('form').trigger('submit');
					return false;
				});
				
				$('.reply_upper_recommand').click(function() {
					$(this).next('form').trigger('submit');
					return false;
				});
				
				$('.reply_modify_link').click(function() {
					
				});
				
				$('.reply_modify_link').click(function() {
					$(this).parent(".reply_upper_update").parent('.reply_upper_right')
					.parent('.reply_upper').next('.reply_content').find('span').hide()
					.end().find('.reply_update_form').show();
					return false;
				});
				
				$('.reply_update_cancel').click(function() {
					$(this).parent('.reply_update_form').hide().siblings('span').show();
					return false;
				});
				
				$('.reply_update').click(function() {
					$(this).siblings('form').trigger('submit');
					return false;
				});
				
				$('#free_update_button').click(function() {
					$('#content').find("span").hide();
					$('#free_update_form').show();
					return false;
				});
				$('#free_update_cancel').click(function() {
					$('#content').find("span").show();
					$('#free_update_form').hide();
					return false;
				});
				$('#free_update_bt').click(function() {
					$(this).siblings('form').trigger('submit');
					return false;
				});
				
				$('#free_delete_button').click(function() {
					$(this).siblings('form').trigger('submit');
					return false;
				});
			})($);
		</script>
	</div>	
</body>
</html>