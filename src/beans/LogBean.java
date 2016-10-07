package beans;

public class LogBean {
	private int log_no;
	private int member_no;
	private String login_ip;
	private String login_time;
	private String logout_time;

	public int getLog_no() {
		return log_no;
	}

	public void setLog_no(int log_no) {
		this.log_no = log_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getLogin_ip() {
		return login_ip;
	}

	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}

	public String getLogin_time() {
		return login_time;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public String getLogout_time() {
		return logout_time;
	}

	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}

}
