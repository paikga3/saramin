package beans;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegularTest {

	public static void main(String[] args) {
		
		//loginMemberInfo
		RegularTest time = new RegularTest();
		String result = time.getPassTime("2016:4:5:12:46:5");
		System.out.println(result);
	}
	
	public String getPassTime(String time) {
		// yyyy:mm:dd:hh24:mm:ss
		String result = "";
		String[] timesByType = time.split(":");
		int year = Integer.parseInt(timesByType[0]);
		int month = Integer.parseInt(timesByType[1]);
		int dayOfMonth = Integer.parseInt(timesByType[2]);
		int hour = Integer.parseInt(timesByType[3]);
		int minute = Integer.parseInt(timesByType[4]);
		int second = Integer.parseInt(timesByType[5]);
		
		LocalDateTime past = LocalDateTime.of(year, month, dayOfMonth, hour, minute, second);
		LocalDateTime current = LocalDateTime.now();
		
		long diffYear = past.until(current, ChronoUnit.YEARS);
		long diffMonth = past.until(current, ChronoUnit.MONTHS);
		long diffDay = past.until(current, ChronoUnit.DAYS);
		long diffHour = past.until(current, ChronoUnit.HOURS);
		long diffMinute = past.until(current, ChronoUnit.MINUTES);
		long diffSecond = past.until(current, ChronoUnit.SECONDS);
		
		if(diffYear != 0) {
			result = diffYear + "년 전";
		} else if(diffMonth != 0) {
			result = diffMonth + "달 전";
		} else if(diffDay != 0) {
			result = diffDay + "일 전";
		} else if(diffHour != 0) {
			result = diffHour + "시간 전";
		} else if(diffMinute != 0) {
			result = diffMinute + "분 전";
		} else if(diffSecond > 30) {
			result = diffSecond + "초 전";
		} else {
			result = "방금 전";
		}
		
		return result;
	}

}
