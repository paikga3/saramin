package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


import beans.AdviceBean;
import beans.AdviceReBean;
import beans.MemberBean;

public class AdminDAO {
	DataSource ds;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	ArrayList<AdviceBean> list = new ArrayList<AdviceBean>();
	ArrayList<AdviceReBean> adviceReBeanList = new ArrayList<AdviceReBean>();
	AdviceBean AB = null;
	AdviceReBean ARB = null;
	
	public AdminDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/mariadb");
			System.out.println("DB 연결 Ok");

		} catch (Exception e) {
			System.out.println("DB 연결 실패 : " + e);
			return;
		}
	}
	
	
	public void viewList(HttpServletRequest request, HttpServletResponse response) {
		// 페이지당 글 수
		int countPerPage = 5;
		// 요청 페이지 번호
		int pushPage = 0;
		// 요청 페이지 없는 경우, 단순 조회
		if (request.getParameter("pushPage") == null) {
			pushPage = 1;
		} else {
			pushPage = Integer.parseInt(request.getParameter("pushPage"));
		}

		int startPage = ((pushPage - 1) * countPerPage) + 1;
		int endPage = pushPage * countPerPage;
		
		// 총 페이지 수
		int page_no = 0;
		
		// 총 게시글 수 조회 쿼리
		String countSql = "SELECT COUNT(advice_no) FROM ADVICE adv";
		
		// 조인하여 정렬해서 가져오는 쿼리, 최근 날짜 순
		// 글번호, 상담종류, 신청인이름, 상담신청날짜, 조회수, 답글수
		String set = "SET @ROWNUM := 0";
		String sql = 
				"SELECT "
				+ "ro, " //1
				+ "member_no, " //2
				+ "advice_no, " //3
				+ "advice_type, " //4
				+ "advice_content, " //5
				+ "DATE_FORMAT(advice_date, '%y-%m-%d %H:%i') advice_date_s, " //6
				+ "DATE_FORMAT(advice_redate, '%y-%m-%d %H:%i') advice_redate_s, " //7
				+ "advice_count, " //8
				+ "advice_re_count, " //9
				+ "member_email, " //10
				+ "member_pw, " //11
				+ "member_name " //12
				+ "FROM "
						+ "(SELECT "
						+ "(@ROWNUM := @ROWNUM + 1) AS ro, "
						+ "advlist.* "
						+ "FROM "
								+ "(SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no)) AS advlist "
								+ "ORDER BY advlist.advice_no DESC) AS advlistordered "
				+ "WHERE ro BETWEEN ? AND ?";
		
		try {
			con = ds.getConnection();
			
			// 게시글 수 조회
			ps = con.prepareStatement(countSql);
			rs = ps.executeQuery();
			while(rs.next()){
				
				// 총 페이지 수
				int tempCountAdvice = (rs.getInt(1));
				
				if ((tempCountAdvice % countPerPage) == 0) {
					page_no = (tempCountAdvice / countPerPage);
				} else {
					page_no = ((tempCountAdvice / countPerPage) + 1);
				}
				System.out.println("총 페이지 수 : " + page_no);

				// view 페이지로 전달
				request.setAttribute("page_no", page_no); 
			}
			
			// SET 쿼리 실행
			ps = con.prepareStatement(set);
			ps.executeUpdate();
			
			// 게시글 목록 조회 실행
			ps = con.prepareStatement(sql);
			ps.setInt(1, startPage);
			ps.setInt(2, endPage);
			rs = ps.executeQuery();
			
			while(rs.next()){
				AB = new AdviceBean();
						
				AB.setMember_no(rs.getInt(2));
				AB.setAdvice_no(rs.getInt(3));
				AB.setAdvice_type(rs.getString(4));
				AB.setAdvice_content(rs.getString(5));
				AB.setAdvice_date(rs.getString(6));
				AB.setAdvice_redate(rs.getString(7));
				AB.setAdvice_count(rs.getInt(8));
				AB.setAdvice_re_count(rs.getInt(9));
				AB.setMember_email(rs.getString(10));
				AB.setMember_name(rs.getString(12));
				
				list.add(AB);
			}
			
			request.setAttribute("adviceArrayist", list);

		} catch (SQLException e) {
			e.printStackTrace();
	
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		// 페이징처리, 5페이지씩
		int pagingStrat = 0;
		int pagingEnd = 0;
		
		// 요청 페이지 번호에 따른 페이징 처리
		if (pushPage > 0 && pushPage <= 3) {
			pagingStrat = 1;
			pagingEnd = 5;			
		} else if(pushPage > 3 && pushPage <= (page_no - 2) ) {
			pagingStrat = pushPage - 2;
			pagingEnd = pushPage + 2;
		} else if (pushPage > (page_no - 2)){
			pagingStrat = page_no - 4;
			pagingEnd = page_no;
		}

		request.setAttribute("pagingStrat", pagingStrat);
		request.setAttribute("pagingEnd", pagingEnd);
		
		
	}


	// 상담 신청 세부 내용 보기
	public void viewRe(HttpServletRequest request, HttpServletResponse response) {
		
		// 클릭한 상담글 번호
		int advice_no = Integer.parseInt(request.getParameter("advice_no"));
		
		String sql = "SELECT "
							+ "advice_re_no, " //1
							+ "member_no, " //2
							+ "member_name, " //3
							+ "advice_content, " //4
							+ "member_email, " //5
							+ "DATE_FORMAT(advice_re_date, '%y-%m-%d %H:%i') date "//6
					+ "FROM ADVICE_RE ar INNER JOIN MEMBER mbr USING (member_no)  "
					+ "WHERE advice_no = ? "
					+ "ORDER BY advice_re_no";

		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, advice_no);
			rs = ps.executeQuery();
			
			while(rs.next()){
				ARB = new AdviceReBean();
				
				ARB.setAdvice_re_no(rs.getInt(1));
				ARB.setMember_no(rs.getInt(2));
				ARB.setMember_name(rs.getString(3));
				ARB.setAdvice_content(rs.getString(4));
				ARB.setMember_email(rs.getString(5));
				ARB.setAdvice_re_date(rs.getString(6));

				adviceReBeanList.add(ARB);
			}
			
			request.setAttribute("adviceDetails", adviceReBeanList);

		} catch (SQLException e) {
			e.printStackTrace();
	
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
	}


	public void insert(HttpServletRequest request, HttpServletResponse response) {
		/* 로그인한 회원 번호 get */
		int member_no = 0;
		MemberBean MB = (MemberBean) request.getSession().getAttribute("loginMemberInfo");
		try {
			member_no = MB.getMember_no();
					
		} catch (Exception e) {
			System.out.println("비회원 요청");
		}

		// member_no를 insert 시 회원정보로 사용
		if (member_no == 0) {
			System.out.println("비회원");
		} else {
			
			try {
				con = ds.getConnection();
				
				String sql = "INSERT INTO ADVICE VALUES((SELECT MAX(advice_no)+1 FROM ADVICE ad), ?, ?, ?, SYSDATE(), NULL, 0, 0)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, member_no);
				ps.setString(2, request.getParameter("advice_type"));
				ps.setString(3, request.getParameter("title"));				
				ps.executeUpdate();
				
				int advice_no = 0;
				sql = "SELECT MAX(advice_no) FROM ADVICE;";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					advice_no = rs.getInt(1);
				}
				
				sql = "INSERT INTO ADVICE_RE VALUES((SELECT MAX(advice_re_no)+1 FROM ADVICE_RE ar), ?, ?, ?, SYSDATE())";
				ps = con.prepareStatement(sql);
				ps.setInt(1, advice_no);
				ps.setInt(2, member_no);
				ps.setString(3, request.getParameter("advice_content"));		
				ps.executeUpdate();
				
				System.out.println("상담 신청 완료");

			} catch (SQLException e) {
				e.printStackTrace();
		
			}finally {
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(ps!=null) try{ps.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}	
			
		}
	}


	public void plusCount(HttpServletRequest request, HttpServletResponse response) {	
		int maxPlusOne = 0;
		
		try {
			con = ds.getConnection();
			
			String sql = "SELECT MAX(advice_count)+1 FROM ADVICE adv WHERE advice_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(request.getParameter("advice_no")));
			rs = ps.executeQuery();
			while(rs.next()){
				maxPlusOne = rs.getInt(1);
			}
			
			sql="UPDATE ADVICE SET advice_count = ? WHERE advice_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, maxPlusOne);			
			ps.setInt(2, Integer.parseInt(request.getParameter("advice_no")));
			rs = ps.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
	
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
	}


	public void insertReply(HttpServletRequest request, HttpServletResponse response) {
		
		MemberBean MB = (MemberBean)request.getSession().getAttribute("loginMemberInfo");
		
		String sql = "INSERT INTO ADVICE_RE "
						+ "VALUES("
								+ "(SELECT MAX(advice_re_no)+1 FROM ADVICE_RE ar), "
								+ "?, " // advice_no
								+ "?, " // member_no
								+ "?, " // advice_content
								+ "SYSDATE());";
		
		String update = "UPDATE ADVICE SET advice_redate = SYSDATE(), advice_re_count = ? WHERE advice_no = ?";
		
		String reCount = "SELECT MAX(advice_re_count)+1 FROM ADVICE WHERE advice_no = ?";
		
		try {	
			con = ds.getConnection();
			
			int count = 0;
			// 댓글 수 증가
			ps = con.prepareStatement(reCount);
			ps.setInt(1, Integer.parseInt(request.getParameter("advice_no")));
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}

			ps = con.prepareStatement(update);
			ps.setInt(1, count);
			ps.setInt(2, Integer.parseInt(request.getParameter("advice_no")));
			ps.executeUpdate();
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(request.getParameter("advice_no")));
			ps.setInt(2, MB.getMember_no());
			ps.setString(3, request.getParameter("reply"));
			ps.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
	
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
	}


	public void deleteAdvice(HttpServletRequest request, HttpServletResponse response) {
		
		int advice_no = Integer.parseInt(request.getParameter("advice_no"));
		
		String deleteAdvice = "DELETE FROM ADVICE WHERE advice_no = ?";
		String deleteAdviceRe = "DELETE FROM ADVICE_RE WHERE advice_no = ?";
		
		try {	
			con = ds.getConnection();
			
			ps = con.prepareStatement(deleteAdvice);
			ps.setInt(1, advice_no);
			ps.executeUpdate();
			
			ps = con.prepareStatement(deleteAdviceRe);
			ps.setInt(1, advice_no);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
	
		}finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(ps!=null) try{ps.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
	}

}























