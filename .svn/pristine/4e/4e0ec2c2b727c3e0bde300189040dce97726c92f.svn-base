package run;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.FreeBoardRepliedBean;
import beans.FreeBoardWriteBean;
import controller.Action;
import db.FreeBoardDAO;
import db.FreeBoardListType;
import db.FreeBoardRepliedDAO;
import structure.Board;

public class FreeBoardRun implements Board {
	
	private Action action;
	private FreeBoardDAO dao;
	private FreeBoardRepliedDAO replydao;
	
	public FreeBoardRun() {
		action = new Action();
		dao = new FreeBoardDAO();
		replydao = new FreeBoardRepliedDAO();
	}
	
	@Override
	public Action add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String freeboard_alias = request.getParameter("name");
		String freeboard_title = request.getParameter("title");
		String freeboard_contents = request.getParameter("content");
		int page = Integer.parseInt(request.getParameter("page"));
		String arrangeType = request.getParameter("type");
		FreeBoardWriteBean bean = new FreeBoardWriteBean();
		bean.setFreeboard_alias(freeboard_alias);
		bean.setFreeboard_title(freeboard_title);
		bean.setFreeboard_contents(freeboard_contents);
		dao.add(bean);
		return list(request, response, arrangeType, page);
	}

	@Override
	public Action delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int freeboard_no = Integer.parseInt(request.getParameter("free_no"));
		FreeBoardWriteBean bean = new FreeBoardWriteBean();
		bean.setFreeboard_no(freeboard_no);
		dao.delete(bean);
		int page = Integer.parseInt(request.getParameter("page"));
		String arrangeType = request.getParameter("type");
		return list(request, response, arrangeType, page);
	}

	@Override
	public Action modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int freeboard_no = Integer.parseInt(request.getParameter("free_no"));
		String freeboard_contents = request.getParameter("content");
		FreeBoardWriteBean bean = new FreeBoardWriteBean();
		bean.setFreeboard_no(freeboard_no);
		bean.setFreeboard_contents(freeboard_contents);
		dao.update(bean);
		return detail(request, response);
	}

	@Override
	public Action list(HttpServletRequest request, HttpServletResponse response, String arrangeType, int page) 
			throws ServletException, IOException {
		ArrayList<FreeBoardWriteBean> list = null;
		Integer totalPage = null;
		String url = "";
		if (arrangeType.equals("reg")) {
			list = dao.getList(page, FreeBoardListType.FREEBOARD_REGDATE);
			totalPage = Integer.valueOf(dao.getTotalPageNum());
			url = request.getContextPath() + "/listByReg.board";
			
			request.setAttribute("page", page);
			request.setAttribute("type", "reg");
			request.setAttribute("url", url);
		} else if (arrangeType.equals("reply")) {
			list = dao.getList(page, FreeBoardListType.FREEBOARD_REPLYCOUNT);
			totalPage = Integer.valueOf(dao.getTotalPageNum());
			url = request.getContextPath() + "/listByReplyCount.board";
			request.setAttribute("type", "reply");
			request.setAttribute("searchPage", 1);
			request.setAttribute("page", page);
			request.setAttribute("url", url);
		} else if (arrangeType.equals("read")) {
			list = dao.getList(page, FreeBoardListType.FREEBOARD_READCOUNT);
			totalPage = Integer.valueOf(dao.getTotalPageNum());
			url = request.getContextPath() + "/listByReadCount.board";
			
			request.setAttribute("page", page);
			request.setAttribute("type", "read");
			request.setAttribute("url", url);
		} else if (arrangeType.equals("recommand")){
			list = dao.getList(page, FreeBoardListType.FREEBOARD_RECOMMAND);
			totalPage = Integer.valueOf(dao.getTotalPageNum());
			url = request.getContextPath() + "/listByRecommand.board";
			request.setAttribute("type", "recommand");
			request.setAttribute("page", page);
			request.setAttribute("url", url);
		} else if (arrangeType.equals("keyword")) {
			String keyword = request.getParameter("keyword");
			

			int totalRecords = Integer.valueOf(dao.getTotalSearchNum(keyword));
			url = request.getContextPath() + "/free_search.board";
			totalPage = totalRecords % 20 == 0 ? totalRecords/20 : totalRecords/20 + 1;
			list = dao.getSearchList(keyword, page);
			request.setAttribute("page", page);
			request.setAttribute("type", request.getParameter("type"));
			request.setAttribute("url", url);
			request.setAttribute("keyword", keyword);
			
		} else {
			list = dao.getList(1, FreeBoardListType.FREEBOARD_REGDATE);
			totalPage = Integer.valueOf(dao.getTotalPageNum());
			url = request.getContextPath() + "/listByReg.board";
			request.setAttribute("page", page);
			request.setAttribute("type", "reg");
			request.setAttribute("url", url);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalPage);
		action.setPath("/pages/freeboardView/freeboardList.jsp");
		action.setSimpleMove(false);
		return action;
	}

	@Override
	public Action detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int freeboard_no = Integer.parseInt(request.getParameter("free_no"));
		int page = Integer.parseInt(request.getParameter("page"));
		FreeBoardWriteBean bean = dao.detail(freeboard_no);
		ArrayList<FreeBoardRepliedBean> replyList = replydao.getRepliesList(freeboard_no);
		request.setAttribute("bean", bean);
		request.setAttribute("page", page);
		request.setAttribute("replyList", replyList);
		action.setPath("/pages/freeboardView/freeboardDetail.jsp");
		action.setSimpleMove(false);
		return action;
	}

	@Override
	public Action replyAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int freeboard_no = Integer.parseInt(request.getParameter("free_no"));
		String writer = request.getParameter("writer");
		String freeboard_contents = request.getParameter("content");
		
		FreeBoardRepliedBean bean = new FreeBoardRepliedBean();
		bean.setFreeboard_no(freeboard_no);
		bean.setFreeboard_alias(writer);
		bean.setFreeboard_contents(freeboard_contents);
		replydao.add(bean);
		
		return detail(request, response);
	}

	@Override
	public Action replyDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int freeboard_re_no = Integer.parseInt(request.getParameter("target"));
		int freeboard_no = Integer.parseInt(request.getParameter("free_no"));
		FreeBoardRepliedBean bean = new FreeBoardRepliedBean();
		bean.setFreeboard_re_no(freeboard_re_no);
		bean.setFreeboard_no(freeboard_no);
		replydao.delete(bean);
		
		return detail(request, response);
	}

	@Override
	public Action replyModify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int freeboard_re_no = Integer.parseInt(request.getParameter("target"));
		String freeboard_contents = request.getParameter("content");
		FreeBoardRepliedBean bean = new FreeBoardRepliedBean();
		bean.setFreeboard_re_no(freeboard_re_no);
		bean.setFreeboard_contents(freeboard_contents);
		replydao.update(bean);
		return detail(request, response);
	}

	@Override
	public Action recommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int freeboard_no = Integer.parseInt(request.getParameter("free_no"));
			dao.increaseRecommand(freeboard_no);
		} catch(NumberFormatException ex) {
			System.out.println("FreeBoardRun recommand: parseInt에서 예외발생");
		}
		
		return detail(request, response);
	}

	@Override
	public Action replyRecommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int freeboard_re_no = Integer.parseInt(request.getParameter("free_re_no"));
			replydao.addRecommand(freeboard_re_no);
		} catch(NumberFormatException ex) {
			System.out.println("FreeBoardRun replyRecommand: parseInt에서 예외발생");
		}
		
		return detail(request, response);
	}

}
