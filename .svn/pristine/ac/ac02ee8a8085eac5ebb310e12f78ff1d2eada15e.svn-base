package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import run.FreeBoardRun;
import structure.Board;

public class BoardController extends HttpServlet {

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
		Board board = new FreeBoardRun();
		int page = 1;

		if (call.equals("/listByReg.board")) { 
			page = Integer.parseInt(request.getParameter("page"));
			action = board.list(request, response, "reg", page);
			
		} else if (call.equals("/listByReplyCount.board")) {
			page = Integer.parseInt(request.getParameter("page"));
			action = board.list(request, response, "reply", page);
			
		} else if (call.equals("/listByReadCount.board")) {
			page = Integer.parseInt(request.getParameter("page"));
			action = board.list(request, response, "read", page);
			
		} else if (call.equals("/listByRecommand.board")) {
			page = Integer.parseInt(request.getParameter("page"));
			action = board.list(request, response, "recommand", page);
			
		} else if (call.equals("/init.board")) {
			action = board.list(request, response, "reg", 1);
		} else if (call.equals("/detail.board")) {
			action = board.detail(request, response);
		} else if (call.equals("/replyAdd.board")) {
			action = board.replyAdd(request, response);
		} else if (call.equals("/replyDelete.board")) {
			action = board.replyDelete(request, response);
		} else if (call.equals("/free_recommand.board")) {
			action = board.recommand(request, response);
		} else if (call.equals("/reply_recommand.board")) {
			action = board.replyRecommand(request, response);
		} else if (call.equals("/reply_update.board")) {
			action = board.replyModify(request, response);
		} else if (call.equals("/free_update.board")) {
			action = board.modify(request, response);
		} else if (call.equals("/free_delete.board")) {
			action = board.delete(request, response);
		} else if (call.equals("/free_add.board")) {
			action = board.add(request, response);
		} else if (call.equals("/free_search.board")) {
			page = Integer.parseInt(request.getParameter("page"));
			action = board.list(request, response, "keyword", page);
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
