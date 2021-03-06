package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import run.MemberRun;
import structure.Member;

public class MemberController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processing(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processing(request, response);
	}

	protected void processing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String path = request.getContextPath();
		String uri = request.getRequestURI();
		// uri - path = call
		// 컨트롤러로 들어오는 세부 요청 분리
		String call = uri.substring(path.length());
		Date today = new Date();
		System.out.println("(" + today + ") 요청: " + call);

		Action action = null;
		Member member = null;

		// 로그인 뷰로 이동
		if (call.equals("/loginMenu.member")) {
			action = new Action();
			action.setSimpleMove(true);
			action.setPath("./pages/memberView/loginMenu.jsp");

			// 로그인 요청 처리
		} else if (call.equals("/pages/memberView/login.member")) {
			member = new MemberRun();
			// 가입 여부 확인
			member.memberCheck(request, response);
			// 로그인 처리
			action = member.login(request, response);
			// 로그 기록
			member.log(request, response);
			System.out.println("loginResult : " + (Integer) request.getAttribute("loginResult"));
			System.out.println("member_no : " + (Integer) request.getSession().getAttribute("member_no"));
			//System.out.println(request.getSession().getLastAccessedTime());

			// 회원가입 뷰로 이동
		} else if (call.equals("/joinMenu.member")) {
			action = new Action();
			action.setSimpleMove(true);
			action.setPath("./pages/memberView/joinMenu.jsp");

			// 실시간 Email 중복 확인
		} else if (call.equals("/pages/memberView/realtimeEmailCheck.member")) {
			MemberRun memberRun = new MemberRun();
			memberRun.realtimeEmailCheck(request, response);
				
			// 실시간 Name 중복 확인
		} else if (call.equals("/pages/memberView/realtimeNamelCheck.member")) {
			MemberRun memberRun = new MemberRun();
			memberRun.realtimeNameCheck(request, response);

			// 회원가입 요청 처리
		} else if (call.equals("/pages/memberView/join.member")) {
			member = new MemberRun();
			// 가입 처리
			action = member.join(request, response);

			// 로그아웃 처리
		} else if (call.equals("/logout.member")) {
			
			// 세션 삭제
			request.getSession().invalidate();
			
			action = new Action();
			action.setSimpleMove(false);
			action.setPath("/");
			
			// 상담 신청시 회원 여부 확인
		} else if (call.equals("/adviceCheck.member")) {
			MemberRun memberRun = new MemberRun();
			memberRun.adviceCheck(request, response);
			
		}		
		

		if (action != null) {
			if (action.getSimpleMove()) {
				response.sendRedirect(action.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(action.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}
