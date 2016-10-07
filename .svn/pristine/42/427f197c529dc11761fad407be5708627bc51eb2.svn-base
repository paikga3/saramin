var isAjax = false;
$('#form_submit').click(function(){
	if($("#pay").val().indexOf(',') == -1){
		$("#pay").val(comma_add($("#pay").val()));
	}
	
	if($("#tax_free").val().indexOf(',') == -1) {
		$("#tax_free").val(comma_add($("#tax_free").val()));
	}
	
	if(!isAjax) {
		isAjax = true;
		salaryCalc();
	}
	return false;
});

$("#form_reset").click(function() {
	$("#annualSalary").trigger("click");
	$("#special").trigger("click");
	$("#pay").val("");
	$("#tax_free").val("100000");
	$("#tax_free_check").removeAttr("checked");
	$("#dependent").val("");
	$("#under_twenty").val("");
});

$('#annualSalary').click(function() {
	$('.severance').show();
	$('#severance_text').hide();
});

$('#monthSalary').click(function() {
	$('.severance').hide();
	$('#severance_text').show();
});

$('#tax_free_check').click(function() {
	if($('#tax_free').is(':disabled')) {
		$('#tax_free').attr("disabled", false);
	} else {
		$('#tax_free').attr("disabled", true);
		$('#tax_free').val('100000');
	}
});

$('#pay').keyup(function() {
	numChk($(this).val(), $(this));
});

$('#tax_free').keyup(function() {
	numChk($(this).val(), $(this));
});

$("#dependent").keyup(function() {
	dependentChk($(this).val());
});

//콤마 넣기
function comma_add(val) {
    var i; 
    var inits = "";
    var num_len = val.length;
    for(i=0; i<num_len; i++) {
        var sect = val.substring(i,i+1);
        if (sect != ",") {
            inits += sect;
        }  
    }
    
    inits = parseInt(inits);
    var ing = val.length % 3;
    num_len=(val.length - ing) / 3;   
    var sect = val.substring(0,ing);
    
    for(i=0; i<num_len; i++) {
        if ((ing == 0) && (i == 0)) {
            sect += val.substring(ing+(3*i),ing+3+(3*i));  
        } else {
            sect += ",";
            sect += val.substring(ing+(3*i),ing+3+(3*i));  
        }
    }
    return sect;
}
// 콤마 지우기
function comma_del(val) {
    var i=0;
    var d;
    var outstr="";
    
    for(d = 0; d < val.length ; d++) {
        var subt= val.substring(d,d+1);
        if (subt != ",") {
            outstr += subt;
        }
    }     
    return outstr;
}
// 숫자인지 체크하고 콤마 넣기
function replaceComma(str) { // 콤마 없애기 
    while(str.indexOf(",") > -1) { 
        str = str.replace(",", ""); 
    } 
    while(str.indexOf(" ") > -1) { // 공백 없애기
        str = str.replace(" ", "");
    }
    if(str.length > 10) {
        str = str.substring(0,10);
    }
    return str;
} 
 
function numChk(str, target){
    var rightchar = replaceComma(str);
    var moneychar = "";

    for(index = rightchar.length-1; index>=0; index--) {
        splitchar = rightchar.charAt(index);
        if (isNaN(splitchar)) {
            alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요.");
            target.val("");
            target.focus();
            return;
        }
    }
}

function dependentChk(val){
    var rightchar = replaceComma(val);

    for(index = rightchar.length-1; index>=0; index--) {
        splitchar = rightchar.charAt(index);
        if (isNaN(splitchar)) {
            alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요.");
            val = "";
            $("#dependent").val(val);
            $("#dependent").focus();
            return;
        }      
    }
    
    if($("#dependent").val() * 1 > 11){
    	alert("부양가족수 12명 이상은 11명과 동일하게 계산되므로\r11명까지만 입력이 가능합니다.");
    	$("#dependent").val("10");
    }
    
    if($("#dependent").val() == 0 || $("#dependent").val() == '') {
    	$("#dependent").val("0");
    }
}



function trans_han(sour, targ){ 
   s = replaceComma(document.getElementsByName(sour)[0].value); 
   t = $(targ); 
   
   var rightchar = replaceComma(document.getElementsByName(sour)[0].value);
   var moneychar = "";
   
   b1 = ' 일이삼사오육칠팔구'; 
   b2 = '천백십조천백십억천백십만천백십원'; 
   tmp = ''; 
   cnt = 0; 
   while(s != '') { 
       cnt++; 
       tmp1 = b1.substring(s.substring(s.length-1,s.length), Number(s.substring(s.length-1,s.length))+1); // 숫자 
       tmp2 = b2.substring(b2.length-1,b2.length); // 단위 
       if (tmp1==' ') { // 숫자가 0일때 
           if (cnt%4 == 1) { // 4자리로 끊어 조,억,만,원 단위일때만 붙여줌 
               tmp = tmp2 + tmp; 
           } 
       } else { 
           if (tmp1 == '일' && cnt%4 != 1) { // 단위가 조,억,만,원일때만 숫자가 일을 붙여주고 나머지는 생략 ex) 삼백일십만=> 삼백십만 
               tmp = tmp2 + tmp; 
           } else { 
               tmp = tmp1 + tmp2 + tmp; // 그외에는 단위와 숫자 모두 붙여줌 
           } 
       } 
       b2 = b2.substring(0, b2.length-1); 
       s = s.substring(0, s.length-1); 
   } 
   tmp = tmp.replace('억만','억').replace('조억','조').replace('원',''); // 조,억,만,원 단위는 모두 붙였기 때문에 필요없는 단위 제거 //원 제거
   if(tmp == '') {
       tmp = '- ';
   }
   t.innerHTML = tmp; 
   
   for (index = rightchar.length-1; index>=0; index--) {
        splitchar = rightchar.charAt(index);
        if (isNaN(splitchar)) {
            alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요.");
            $('trans_price').innerHTML = "- ";
            document.getElementsByName(sour)[0].value = "";
            document.getElementsByName(sour)[0].focus();
            return;
        }
        moneychar = splitchar+moneychar;
    }
    oldText = moneychar;
}
 
//#################################################  계산하기 시작 #################################################//
function salaryCalc() {
    
    // =================================== validation ====================================== //
    if($('#pay').val() == "") {
    	if($("#annualSalary").attr("checked") == "checked") {
    		alert("연봉이 입력되지 않았습니다.");
    	} else if($("#monthSalary").attr("checked") == "checked") {
    		alert("월급이 입력되지 않았습니다.");
    	}
    	$("#pay").focus();
    	isAjax = false;
    	return false;
    }
	
    if($("#tax_free").val() == "") {
    	alert("비과세액이 입력되지 않았습니다.");
    	$("#tax_free").focus();
    	isAjax = false;
    	return false;
    }
    
    if(parseInt($("#under_twenty").val()) >= parseInt($("#dependent").val())){
    	alert("20세이하자녀수가 부양가족수보다 크거나 같습니다.");
    	$("#dependent").focus();
    	isAjax = false;
        return false;
    }
    
    if ($("#dependent").val() == ""|| $("#dependent").val() == "0") {
        alert("부양가족수가 입력되지 않았습니다.\n본인도 부양가족수에 해당함으로, 1 이상의 수를 입력하세요.");
        $("#dependent").focus();
        isAjax = false;
        return false;
    }
    // 입력받은 값에서 콤마 지우기
    var pay_val = comma_del($("#pay").val());
    var tax_free_val = comma_del($('#tax_free').val());
    
    // =================================== 변수 설정 ====================================== //
    //사용자 입력값받기
    var input_pay = parseInt(pay_val);  // 급여액
    var tax_free = parseInt(tax_free_val); // 비과세액
    var dependent = parseInt($('#dependent').val()); // 부양가족수
    var under_twenty = parseInt($('#under_twenty').val()); // 20세이하자녀수

    var choose_period = null; // 연봉/월급 선택
    var retirement_include = null; // 퇴직금 선택
    if(document.getElementsByName('salary_type')[0].checked){
    	choose_period = 0;
    	if(document.getElementsByName('severance_pay_yn')[0].checked){
    		retirement_include = 0;
    	} else if(document.getElementsByName('severance_pay_yn')[1].checked){
    		retirement_include = 1;
    	}
    } else if(document.getElementsByName('salary_type')[1].checked) {
    	choose_period = 1;
    }
       
	// ==================================== api 호출 ======================================== //
    
    ajax_standby();
    
    $.ajax({
        url: 'http://www.saramin.co.kr/zf_user/tools/salary-calculator-result',
        type: 'get',
        data: {
            input_pay: input_pay,
            tax_free: tax_free,
            dependent: dependent,
            under_twenty: under_twenty,
            choose_period: choose_period,
            retirement_include: retirement_include
        },
        success: function (result) {
            var s = result.responseText;
            var start = s.indexOf("{");
            var end = s.indexOf("}");
            s = s.substring(start, end + 1);
            var obj = JSON.parse(s);
            $('#national_pension').val(obj.national_pension);
            $('#health_insurance').val(obj.health_insurance);
            $('#longterm_care_insurance').val(obj.longterm_care_insurance);
            $('#unemployment_insurance').val(obj.unemployment_insurance);
            $('#income_tax').val(obj.income_tax);
            $('#residence_tax').val(obj.residence_tax);
            $('#total_tax_deduction').val(obj.total_tax_deduction);
            $('#after_tax_income').val(obj.after_tax_income);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("에러" + textStatus + errorThrown);
            isAjax = false;
        }
    }).done(function() {  	
    	$("#ajax_img").hide();
    	isAjax = false;
    });
}

function ajax_standby() {
	var windowWidth = $(window).width();
    var windowHeight = $(window).height();

    var imgWidth = $("#ajax_img").width();
    var imgHeight = $("#ajax_img").height();

    $("#ajax_img").css({
        position: "absolute",
        left: windowWidth/2 - imgWidth/2 + "px",
        top: windowHeight/2  - imgHeight/2 + "px"
    });
    $("#ajax_img").show();
}


