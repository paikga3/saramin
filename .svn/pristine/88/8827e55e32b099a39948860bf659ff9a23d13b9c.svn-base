package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import run.AdminRun;
import structure.Admin;

public class AdminController extends HttpServlet {

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
		Admin admin = null;

		// 상담신청 버튼 클릭, 전체 목록 출력
		if (call.equals("/adviceRequset.admin")) {
			admin = new AdminRun();
			action = admin.exe(request, response);

			// 상담 세부 내용 클릭
		} else if (call.equals("/adviceDetails.admin")) {
			admin = new AdminRun();
			action = admin.reView(request, response);

			// 조회수 증가
			admin.plusCount(request, response);

			// 상담 신청
		} else if (call.equals("/adviceApplication.admin")) {
			admin = new AdminRun();
			action = admin.insert(request, response);
		}
		
			// 상담 신청 삭제
		else if (call.equals("/adviceDelete.admin")) {
			admin = new AdminRun();
			action = admin.delete(request, response);
		}
			// 상담 신청 수정
		else if (call.equals("/adviceModify.admin")) {
			admin = new AdminRun();
			action = admin.insert(request, response);
		}

			// 답변하기
		else if (call.equals("/adviceRe.admin")) {
			admin = new AdminRun();
			action = admin.insertRe(request, response);
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
