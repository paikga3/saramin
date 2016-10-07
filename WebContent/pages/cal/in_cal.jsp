<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="db.FreeBoardDAO,beans.FreeBoardWriteBean" %>
<%
	/* FreeBoardDAO dao = new FreeBoardDAO();
	FreeBoardWriteBean bean = new FreeBoardWriteBean();
	bean.setFreeboard_no(1);
	bean.setFreeboard_alias("흑풍간지");
	bean.setFreeboard_title("이것은 마리아db이다!");
	bean.setFreeboard_contents("마리아db가 이런면에 참 좋구 저런면에서는 그냥 mysql하고 비슷한거 같다.");
	bean.setFreeboard_contents("마리아 db꼬졌어");
	dao.update(bean); */
%>
<tiles:insertDefinition name="in.header.cal" />
	<div id="in_cal_wrapper" style="width:80%; height:800px; margin:30px 10% auto;">
		<div id="in_cal_title" style="width:100%; height:15px;text-align:center;padding:10px 0; font-size:15px;">
			<span>연봉 계산기</span>
		</div>
		
		<div class="in_cal_form" style="width:100%; height:250px;text-align: center;">
			
			<table style="display:inline-block; text-align:left; margin-top:10px; width:390px;">
				<tr>
					<td colspan="2" style="height:30px;">
						<span>나의 희망(현재)조건을 입력해주세요.</span>
					</td>
				</tr>				
				<tr>
					<td style="padding-right:20px;"><span>연봉/월급 선택</span></td>
					<td>
						<input type="radio" id="annualSalary" name="salary_type" checked /><label for="annualSalary">연봉</label>
						<input type="radio" id="monthSalary" name="salary_type"/><label for="monthSalary">월급</label>
					</td>
				</tr>
				<tr>
					<td style="padding-right:20px;"><label>퇴직금</label></td>
					<td id="severance_td">
						<span class="severance">
							<input type="radio" name="severance_pay_yn" id="special" checked/><label for="special">별도</label>
						</span>
						<span class="severance">
							<input type="radio" name="severance_pay_yn" id="include"/><label for="include">포함</label>
						</span>
						<span id="severance_text" style="display:none;">연봉인 경우만 선택</span>
					</td>
				</tr>
				<tr>
					<td style="padding-right:20px;"><span>연봉</span></td>
					<td>
						<input type="text" id="pay"/>원
					</td>
				</tr>
				<tr>
					<td style="padding-right:20px;"><span>비과세액</span></td>
					<td>
						<input type="text" disabled id="tax_free" value="100000"/>원
					</td>
				</tr>
				<tr>
					<td style="padding-right:20px;"></td>
					<td>
						<input type="checkbox" id="tax_free_check"/><span>직접입력</span>
					</td>
				</tr>
				<tr>
					<td style="padding-right:20px;"><span>부양가족수</span></td>
					<td>
						<input type="text" id="dependent"/><span>명(본인포함)</span>
					</td>
				</tr>
				<tr>
					<td style="padding-right:20px;"><span>20세이하 자녀수</span></td>
					<td>
						<input type="text" id="under_twenty"/><span>명</span>
					</td>
				</tr>				
				<tr>
					<td style="padding-right:20px;">	
					</td>
					<td>
						<div id="form_submit" style="width:60px;height:12px;margin-top:10px; background-color:white;margin-right:30px;text-align:center;border-radius:5px; float:left;">계산하기</div>
						<div id="form_reset" style="width:60px;height:12px;margin-top:10px;background-color:white;text-align:center;border-radius:5px;float:left;">리셋</div>
					</td>
				</tr>
			</table>
			
		</div>
		<div class="in_cal_form" style="width:100%; height:330px;
		margin-top:20px;text-align: center;">
			<table style="display:inline-block; text-align:left; margin-top:30px;width:390px;">
				<tr>
					<td style="padding-right:20px;">국민연금</td>
					<td><input type="text" disabled id="national_pension"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">건강보험</td>
					<td><input type="text" disabled id="health_insurance"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">장기요양</td>
					<td><input type="text" disabled id="longterm_care_insurance"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">고용보험</td>
					<td><input type="text" disabled id="unemployment_insurance"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">소득세</td>
					<td><input type="text" disabled id="income_tax"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">지방소득세</td>
					<td><input type="text" disabled id="residence_tax"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">공제액 합계</td>
					<td><input type="text" disabled id="total_tax_deduction"/>원</td>
				</tr>
				<tr>
					<td style="padding-right:20px;">예상 실수령액(월)</td>
					<td><input type="text" disabled id="after_tax_income"/>원</td>
				</tr>
			</table>
		</div>
		
	</div>
	<img src="<%=request.getContextPath() %>/pages/cal/images/ajax-loader.gif" id="ajax_img"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.xdomainajax.js"></script>
	<script src="<%=request.getContextPath() %>/js/in_cal.js"></script>
</body>
</html>