<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="in.header.search" />


<img id="ajax_image" src="<%=request.getContextPath()%>/pages/cal/images/ajax-loader.gif" style="position:absolute;display:none;"/>
<script type="text/javascript">
function standbyAjaxOn() {
	var windowW = $(window).width();
	var windowH = $(window).height();
	
	var x = (windowW - $('#ajax_image').width() ) / 2;
	var y = (windowH - $('#ajax_image').height() ) / 2;
	$('#ajax_image').css({
		left : x + 'px',
		top : y + 'px',
		
	});
	$('#ajax_image').show();
}
</script>
<script src="<%=request.getContextPath()%>/js/in_search.js"></script>
<div id="in_wrapper_section">
	<div style="width:1200px;height:1000px;display:inline-block;text-align:left;">
	<form id="search_frm" name="search_frm" action="http://www.saramin.co.kr/zf_user/upjikjong-recruit/upjikjong-list/" method="post"> 	 
        
        <input type="hidden" name="recruitform_type" value="classified" id="recruitform_type">
        <input type="hidden" name="categoryCode" value="9|4" id="categoryCode">
        <input type="hidden" name="category_level" value="keyword" id="category_level">
        <input type="hidden" name="code" value="404" id="code">
        
        <input type="hidden" name="keyword_cd" value="40403" id="keyword_cd"><!-- 업직종 -->
        
        <input type="hidden" name="list" value="search" id="list">
        
        <input type="hidden" name="area_cd" value="" id="area_cd">
        <input type="hidden" name="areaSub_cd" value="" id="areaSub_cd">

        <input type="hidden" name="educationNone" value="" id="educationNone">
        
        <input type="hidden" name="career" value="" id="career">
        
        <div id="form_div" style="background: #81E281;">
            <div id="title" style="border-bottom:1px solid black;padding-top:15px;padding-bottom:15px;">
                <span class="choice">검색조건</span>
            </div>
            <div class="choice" style="margin-top:10px;">
                <div>
                    <span>직종선택</span>
                </div>
                <div>
                    <span>
                        <input type="radio" id="jsp" class="job1" checked/>
                        <label for="jsp" class="job1">JSP</label><!-- 40403 -->
                    </span>
                    <span style="margin-left:300px;">
                        <input type="radio" id="java" class="job2"/>
                        <label for="java" class="job2">JAVA</label><!-- 40404 -->
                    </span>
                </div>
            </div>

            <div class="choice" style="margin-top:10px;">
                <div>
                    <span>지역(서울)</span>
                </div>
                <div>
                	<span>
                        <input type="checkbox" class="areaSubCode[]" id="areaSubCode_101060" value="101060"/>
                        <label for="areaSubCode_101060">광진구</label>
                    </span>
                    <span style="margin-left:150px;">
                        <input type="checkbox" class="areaSubCode[]" id="areaSubCode_101080" value="101080"/>
                        <label for="areaSubCode_101080">금천구</label>
                    </span>
                    <span style="margin-left:150px;">
                        <input type="checkbox" class="areaSubCode[]" id="areaSubCode_101140" value="101140"/>
                        <label for="areaSubCode_101140">서대문구</label>
                    </span>                
                </div>
            </div>

            <div class="choice" style="margin-top:10px;">
                <div>
                    <span>학력</span>
                </div>
                <div>
                    <select id="firstEdu" name="firstEdu">
                        <option value="">선택</option>
                        <option value="1">고등학교 졸업</option>
                        <option value="2">대학졸업(2,3년)</option>
                        <option value="3">대학졸업(4년)</option>
                        <option value="4">석사 졸업</option>
                        <option value="5">박사 졸업</option>
                    </select>
                    <span>
                        <input id="educationNoneChk" name="educationNone" value="none" type="checkbox"/>
                        <label for="educationNoneChk">학력무관</label>
                    </span>
                </div>
            </div>
            
            <div class="choice" style="margin-top:10px;">
                <div>
                    <span>경력</span>
                </div>
                <div>
                    <span>
                        <input type="checkbox" class="career[]" id="careerNew" value="1"/>
                        <label for="careerNew">신입</label>
                    </span>
                    <span style="margin-left:150px;">
                        <input type="checkbox" class="career[]" id="careerExp" value="2"/>
                        <label for="careerExp">경력</label>
                    </span>
                    <span style="margin-left:150px;">
                        <input type="checkbox" class="career[]" id="careerNone" value="0"/>
                        <label for="careerNone">경력무관</label>
                    </span>
                </div>
            </div>

            <div class="choice" style="margin-top:10px;">
                <div>
                    <span>연봉</span>
                </div>
                <div>
                    <select id="firstSal" name="firstSal">
                        <option value="">선택</option>
                        <option value="5">1800만원이상</option>
                        <option value="6">2000만원이상</option>
                        <option value="7">2200만원이상</option>
                        <option value="8">2400만원이상</option>
                        <option value="9">2600만원이상</option>
                        <option value="10">2800만원이상</option>
                        <option value="11">3000만원이상</option>
                        <option value="16">4000만원이상</option>
                    </select>
                    <span style="margin-left:150px;">
                        <input id="salaryChk" name="salary" value="true" type="checkbox">
                        <label for="salaryChk">면접 후 결정</label>
                    </span>
                    <span style="margin-left:150px;">
                        <input id="salaryRuleChk" name="salaryRule" value="99" type="checkbox">
                        <label for="salaryRuleChk">회사내규에 따름</label>
                    </span>
                </div>
            </div>
            <c:set var="url" value="http://${pageContext.request.serverName}:${pageContext.request.localPort}${pageContext.request.contextPath }"></c:set>

            <div class="choice" style="padding-top:10px;padding-bottom:10px;">
                <input type="button" value="선택한 조건으로 검색하기" style="padding-top:10px;padding-bottom:10px;border-radius:5px;background-color:#EA9357; border-style:none;" 
                onclick="check(search_frm,'${url}');standbyAjaxOn();"/>
            </div>
        </div>
       </form>
        <div id="search_result" style="width:100%;margin-top:10px;">
        	<div id="jobs_list" style="width:100%;text-align:center;border-top:1px solid black;border-bottom:1px solid black;height:34px;">
        		<ul>
        			<li style="width:20%;float:left;padding-top: 10px;padding-bottom: 10px;">회사명</li>
        			<li style="width:40%;float:left;padding-top: 10px;padding-bottom: 10px;">제목</li>
        			<li style="width:10%;float:left;padding-top: 10px;padding-bottom: 10px;">자격요건</li>
        			<li style="width:10%;float:left;padding-top: 10px;padding-bottom: 10px;">수정일</li>
        			<li style="width:10%;float:left;padding-top: 10px;padding-bottom: 10px;">마감일</li>
        			<li style="width:10%;float:left;padding-top: 10px;padding-bottom: 10px;">조회수</li>
        			<li class="clear"></li>
        		</ul>
        		
        		
        	</div>
        	<div class="margin"></div>
        	<div id="number" style="text-align:center;">
        	</div>
        	<div class="margin"></div>
        	
        </div>
    </div>
    <script type="text/javascript">
    $('.job1').click(function(){
		$('#jsp')[0].checked = true;
		$('#java')[0].checked = false;
	});
	
	$('.job2').click(function() {
		$('#java')[0].checked = true;
		$('#jsp')[0].checked = false;
	});
	
	
    </script>
</div>
</body>
</html>