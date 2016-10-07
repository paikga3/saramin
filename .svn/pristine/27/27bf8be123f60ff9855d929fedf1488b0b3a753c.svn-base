<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
	<tiles:insertDefinition name="in.header.aptitude" />
<script type="text/javascript" src="http://code.jquery.com/latest.js"></script>
<!-- <script>
$(function(){
	
	$("#btn1").click(function() {
		$("#screen1").hide();
		$("#screen2").show();
	});
	
});
</script> -->
<!-- 여기다가 작성 -->
<!-- 	<div id="layout_wrapper" style="width:100%; text-align: center;"> -->
		<form action="aptitude02.jsp">
		<table id="screen1" style="display: inline;">
			<tr>
				<td>너는 누구냐</td>
			</tr>
			<tr>
				<td>
			
				<input type="button" value="사람" name="사람" id="btn1">
				<input type="button" value="곤충" id="btn2">
				<input type="button" value="동물" id="btn3">
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
				
		</table>
		
		<table id="screen2" style="display: none;">
			<tr>
				<td>나는 누굴까</td>
			</tr>
			<tr>
				<td>
				<input type="button" value="파리" id="btn2-1">
				<input type="button" value="거미" id="btn2-2">
				<input type="button" value="지네" id="btn2-3">
				</td>
			</tr>
		</table>
		
			<table id="screen3" style="display: none;">
			<tr>
				<td>너는 누구냐</td>
			</tr>
			<tr>
				<td>
				<input type="button" value="사람" id="btn1">
				<input type="button" value="곤충">
				<input type="button" value="동물">
				</td>
			</tr>			
		</table>
		
			<table id="screen4" style="display: none;">
			<tr>
				<td>너는 누구냐</td>
			</tr>
			<tr>
				<td>
				<input type="button" value="남자" id="btn1-1">
				<input type="button" value="여자" id="btn1-2">
				<input type="button" value="둘다" id="btn1-3">
				</td>
			</tr>
				<tr>
				<td><input type="submit" value="확인"></td>
			</tr>			
		</table>
		
			<table id="screen5" style="display: none;">
			<tr>
				<td>테스트 결과 확인</td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="확인" id="btn5">
				</td>
			</tr>			
		</table>
		</form>
		
		
		
		
	<!-- </div>		 -->
	
<script src="http://code.jquery.com/latest.js"></script>
<script type="text/javascript">
	$("#btn2").click(function() {
		$("#screen1").hide();
		$("#screen2").show();
	});
	
	$("#btn1").click(function() {
		$("#screen1").hide();
		$("#screen2").hide();
		$("#screen4").show();
	});
	
	$("#btn1-1,#btn1-2,#btn1-3").click(function(){
		$("#screen1").hide();
		$("#screen2").hide();
		$("#screen4").hide();
		$("#screen5").show();
	})
	
	
</script>
</body>
</html>