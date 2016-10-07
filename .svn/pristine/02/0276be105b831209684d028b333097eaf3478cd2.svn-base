package beans;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class FreeBoardRepliedBean {
	
	/*
	 * 답글은 따로 제목이 없음, 댓글형식으로 달리는 글이라 그러함. 
	 */
	
	private int freeboard_re_no; // 답글 번호
	private int freeboard_no; // 부모글의 글번호, 부모글의 글번호로 부모글이 있는 테이블과 조인할 것임
	private int freeboard_recommand; // 답글의 추천수	
	private String freeboard_alias; // 답글 작성자(별칭) (한글기준 20자제한)	
	private String freeboard_contents; // 답글 내용(한글기준 3000자 제한)	
	private String freeboard_regDate; // 답글이 등록된 시점
	
	public int getFreeboard_re_no() {
		return freeboard_re_no;
	}
	public void setFreeboard_re_no(int freeboard_re_no) {
		this.freeboard_re_no = freeboard_re_no;
	}
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public int getFreeboard_recommand() {
		return freeboard_recommand;
	}
	public void setFreeboard_recommand(int freeboard_recommand) {
		this.freeboard_recommand = freeboard_recommand;
	}
	public String getFreeboard_alias() {
		return freeboard_alias;
	}
	public void setFreeboard_alias(String freeboard_alias) {
		this.freeboard_alias = freeboard_alias;
	}
	public String getFreeboard_contents() {
		return freeboard_contents;
	}
	public void setFreeboard_contents(String freeboard_contents) {
		this.freeboard_contents = freeboard_contents;
	}
	public String getFreeboard_regDate() {
		return freeboard_regDate;
	}
	public void setFreeboard_regDate(String freeboard_regDate) {
		this.freeboard_regDate = freeboard_regDate;
	}
	
	public String getPassTime() {
		// yyyy:mm:dd:hh24:mm:ss
		String time = getFreeboard_regDate();
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
