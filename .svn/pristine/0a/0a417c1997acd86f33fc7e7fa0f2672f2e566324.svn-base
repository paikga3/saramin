package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import javax.websocket.Session;

import beans.MemberBean;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/mariadb");
			System.out.println("DB 연결 Ok");

		} catch (Exception e) {
			System.out.println("DB 연결 실패 : " + e);
			return;
		}
	}
	
	public int memberCheck(HttpServletRequest request, MemberBean MB){
		int member = 0;
		String sql = "SELECT member_no, member_name, member_email, member_pw "
						+ "FROM MEMBER "
						+ "WHERE member_email = ?";		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("email"));
			
			rs = ps.executeQuery();

			// false = 이메일 없음 
			if(rs.next()){
				MB.setMember_no(rs.getInt("member_no"));
				MB.setMember_name(rs.getString("member_name"));
				MB.setMember_email(rs.getString("member_email"));
				MB.setMember_pw(rs.getString("member_pw"));
				
				if(request.getParameter("pw").equals(MB.getMember_pw())){
					System.out.println("비밀번호 일치");
					member = 1;
				} else {
					System.out.println("비밀번호 불일치");
					member = -1;
				}
				
			} else {
				System.out.println("존재하지 않는 Email");
				member = 0;
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return member;
	}
	
	public void insertMemberInfo(HttpServletRequest request, MemberBean MB){
		String sql = "INSERT INTO MEMBER VALUES((SELECT MAX(member_no)+1 FROM MEMBER mb), ?, ?, ?, SYSDATE())";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, MB.getMember_email());
			ps.setString(2, MB.getMember_pw());
			ps.setString(3, MB.getMember_name());
			
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
	}

	public void loginWrite(HttpServletRequest request) {
		// 로그인 회원 번호, ip, 시간 기록
		String sql = "INSERT INTO LOG VALUES ((SELECT MAX(log_no)+1 FROM LOG log), ?, ?, SYSDATE(), null)";

		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);

			if (request.getSession().getAttribute("member_no") != null) {
				ps.setInt(1, (Integer) request.getSession().getAttribute("member_no"));
			} else {
				// 비회원 로그인 시도 or 틀린 비밀번호로 로그인 시도 -> 회원번호에 -9 기록
				ps.setInt(1, -9);
			}
			ps.setString(2, request.getRemoteAddr());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
	}
	

	public int realtimeEmailCheck(HttpServletRequest request, MemberBean MB) {
		int member = 0;
		String sql = "SELECT member_no FROM MEMBER WHERE member_email = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("email"));
			
			rs = ps.executeQuery();

			// false 이메일 없음 
			if(rs.next()){
				// 동일 Email 존재, 가입 불가능
				member = 1;
			}else{
				// 가입 가능
				member = 0;
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return member;
	}

	public int realtimeNameCheck(HttpServletRequest request, MemberBean mB) {
		int member = 0;
		String sql = "SELECT member_no FROM MEMBER WHERE member_name = ?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("name"));
			
			rs = ps.executeQuery();

			// false 이름 없음 
			if(rs.next()){
				// 동일 이름 존재, 가입 불가능
				member = 1;
			}else{
				// 가입 가능
				member = 0;
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return member;
	}
}




























