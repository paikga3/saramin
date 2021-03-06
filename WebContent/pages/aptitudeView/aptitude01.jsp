<%@ page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<tiles:insertDefinition name="in.header.aptitude" />


<c:choose>
	<c:when test="${sessionScope.loginMemberInfo == null}">
		<script>
				alert("회원가입후 이용하실수 있을걸요");
				location.replace('<%=request.getContextPath()%>/index.jsp');
		</script>
		
	</c:when>
	<c:otherwise>
	

<script type="text/javascript">
	var score = 0;
</script>
<form action="aptitude02.jsp">

<table id="screen1"   style="display: inline; margin-left: auto; margin-right: auto;">
	<tr>
		<td>
		    <img src="image/001_image.jpg"/></br>
		</br>
		1.여기는 인천 국제공항, 외국으로 떠나는 것을 아쉬워하며 이별하는 커플이 있다.
           둘 중 떠나는 사람은 어느쪽일까?
        </td>
    </tr>
    <tr>
		<td>
			<input type="button" value="a. 여자" class="a1" data-score="2"/>
			<input type="button" value="b. 남자" class="a1" data-score="1"/> <!-- 0.5점씩 -->
			<input type="button" value="c. 모른다" class="a1" data-score="0"/>
		</td>
	</tr>
</table>

<table id="screen2" style="display: none; margin-left: auto; margin-right: auto;">
	<tr>
		<td>
		    <img src="image/002_image.jpg"/></br>
		</br>
		2.한 여자가 자신이 쓴 책으로 사인회를 하고 있다. 여자가 지은 책은 어떤 분야일까?
		</td>
	</tr>
    <tr>
		<td>
			<input type="button" value="a. 러브 로맨스 소설" class="a2" data-score="2"/>
			<input type="button" value="b. 엽기 공포 소설" class="a2" data-score="1"/><!-- 0.5점씩 -->
			<input type="button" value="c. 모른다" class="a2" data-score="0"/>
		</td>
	</tr>
</table>

<table id="screen3" style="display: none; margin-left: auto; margin-right: auto;">
	<tr>
		<td>
			<img src="image/003_image.jpg"/></br>
		</br>
		3.병원 응급실에서 일하는 간호사를 찾아 온 환자는?
		</td>
	</tr>
    <tr>
		<td>
			<input type="button" value="a. 열이 펄펄 나는 아이" class="a3" data-score="2"/>
			<input type="button" value="b. 교통사고 난 아저씨" class="a3" data-score="1"/><!-- 0.5점씩 -->
			<input type="button" value="c. 모른다" class="a3" data-score="0"/>
		</td>
	</tr>
</table>

<table id="screen4" style="display: none; margin-left: auto; margin-right: auto;">
	<tr>
		<td>
			<img src="image/004_image.jpg"/></br>
		</br>
		4.어느 날 밤 하늘에 펼쳐진 별들을 보고 있는데, 
    	 어디선가 "만약 가고 싶은 별이 있다면 딱 한번만 그 소원을 들어주겠다. 어느 별에 가고 싶은가?"라는
		소리가 들렸다. 당신이라면?
		</td>
	</tr>
    <tr>
		<td>
			<input type="button" value="a. 달" class="a4" data-score="2"/>
			<input type="button" value="b. 화성" class="a4" data-score="1"/><!-- 0.5점씩 -->
			<input type="button" value="c. 모른다" class="a4" data-score="0"/>
		</td>
	</tr>
</table>

<table id="screen5" style="display: none; margin-left: auto; margin-right: auto;">
	<tr>
		<td>
			<img src="image/005_image.jpg"/></br>
		</br>
 		5. 당신이 침대에 누워서 잠을 자려고 합니다. 어떻게 자고 있나요?
 		</td>
 	</tr>
    <tr>
		<td>
			<input type="button" value="a. 몸을 웅크리고 새우잠" class="a5" data-score="2"/>
			<input type="button" value="b. 대(大)자" class="a5" data-score="1"/><!-- 0.5점씩 -->
			<input type="button" value="c. 모른다" class="a5" data-score="0"/>
		</td>
	</tr>
</table>

<table id="screen6" style="display: none; margin-left: auto; margin-right: auto;">
	<tr>
		<td>테스트 결과 확인</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" id="score" name="score"/>
			<input type="submit" value="확인" id="btn5">
		</td>
	</tr>			
</table>
</form>
















<script src="http://code.jquery.com/latest.js"></script>
<script type="text/javascript">


	
	$(".a1").click(function() {
		$("#screen1").hide();
		$("#screen2").show();
		$("#screen3").hide();
		$("#screen4").hide();
		$("#screen5").hide();
		$("#screen6").hide();
		
		var part_score = $(this).attr("data-score") * 1;
		score += part_score;
	});
	
	$(".a2").click(function() {
		$("#screen1").hide();
		$("#screen2").hide();
		$("#screen3").show();
		$("#screen4").hide();
		$("#screen5").hide();
		$("#screen6").hide();
		
		var part_score = $(this).attr("data-score") * 1;
		score += part_score;
	});
	
	$(".a3").click(function() {
		$("#screen1").hide();
		$("#screen2").hide();
		$("#screen3").hide();
		$("#screen4").show();
		$("#screen5").hide();
		$("#screen6").hide();
		
		var part_score = $(this).attr("data-score") * 1;
		score += part_score;
	});
	
	$(".a4").click(function() {
		$("#screen1").hide();
		$("#screen2").hide();
		$("#screen3").hide();
		$("#screen4").hide();
		$("#screen5").show();
		$("#screen6").hide();
		
		var part_score = $(this).attr("data-score") * 1;
		score += part_score;
	});
	
	$(".a5").click(function() {
		$("#screen1").hide();
		$("#screen2").hide();
		$("#screen3").hide();
		$("#screen4").hide();
		$("#screen5").hide();
		$("#screen6").show();
		
		var part_score = $(this).attr("data-score") * 1;
		score += part_score;
		$("#score").val(score);
	});
	
</script>
	
</body>
</html>
	</c:otherwise>
</c:choose>
	