package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import run.SearchRun;
import structure.Search;

public class SearchController extends HttpServlet {
	
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
		Search search = null;
		
		if (call.equals("/main.search")) {
			action = new Action();
			action.setSimpleMove(false);
			action.setPath("./pages/searchView/search.jsp");
		} else if (call.equals("/ajax.search")) {
			search = new SearchRun();
			action = search.ajax(request, response);
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