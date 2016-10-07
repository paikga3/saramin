package beans;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class FreeBoardWriteBean {
	
	private int freeboard_no; // 글번호
	private int freeboard_replyCount;// 답글수
	private int freeboard_readCount;  // 조회수
	private int freeboard_recommand;  // 추천수
	private String freeboard_alias;  // 글쓴이(별칭으로 등록함) (한글기준 20자제한)
	private String freeboard_title;  // 글제목  (한글기준 30자 제한)
	private String freeboard_contents; // 글내용 (한글기준 3000자 제한)
	
	// 글이 등록된 날짜     - 글을 쓰고 경과된 시간을 계산할 것임(1시간 이내는 몇분 지남, 하루이내는 몇시간 지남, 한달 이내는 몇일 지남, 일년 이내는 몇달지남, 그 이후는 몇년지남) -
	// ex) 2016-03-28 21:26:32의 형식으로 저장됨, 파싱하기 더 편한 형식이 있으면 알려줄 것.
	// 단 숫자는 유지되고 - 나 : 을 없애거나 다른문자를 넣을 수 있음.
	private String freeboard_regDate;
	
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public int getFreeboard_replyCount() {
		return freeboard_replyCount;
	}
	public void setFreeboard_replyCount(int freeboard_replyCount) {
		this.freeboard_replyCount = freeboard_replyCount;
	}
	public int getFreeboard_readCount() {
		return freeboard_readCount;
	}
	public void setFreeboard_readCount(int freeboard_readCount) {
		this.freeboard_readCount = freeboard_readCount;
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
	public String getFreeboard_title() {
		return freeboard_title;
	}
	public void setFreeboard_title(String freeboard_title) {
		this.freeboard_title = freeboard_title;
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