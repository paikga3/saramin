package run;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AdviceBean;
import controller.Action;
import db.AdminDAO;
import structure.Admin;

public class AdminRun implements Admin {

	Action action = null;

	AdminDAO AD = new AdminDAO();

	// 상담 신청 목록 출력
	@Override
	public Action exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// DB에서 글 목록 가져오기
		AD.viewList(request, response);

		action = new Action();
		action.setSimpleMove(false);
		action.setPath("./pages/adminView/adviceRequestList.jsp");

		return action;

	}

	public Action reView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 게시글 세부내용 보기
		AD.viewRe(request, response);

		action = new Action();
		action.setSimpleMove(false);
		action.setPath("./pages/adminView/adviceDetails.jsp");

		return action;

	}

	@Override
	public Action insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 게시글 세부내용 보기
		AD.insert(request, response);

		action = new Action();
		action.setSimpleMove(false);
		action.setPath("/adviceRequset.admin");

		return action;
	}

	@Override
	public void plusCount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AD.plusCount(request, response);
		
	}

	@Override
	public Action insertRe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AD.insertReply(request, response);
		
		action = new Action();
		action.setSimpleMove(false);
		action.setPath("/adviceDetails.admin" + "?advice_no=" + request.getParameter("advice_no"));
		
		return action;
	}

	@Override
	public Action delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 상담 신청 삭제
		AD.deleteAdvice(request, response);
		
		action = new Action();
		action.setSimpleMove(false);
		action.setPath("/adviceRequset.admin");
		
		return action;
	}

}














