package structure;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;

public interface Board {
	
	public Action add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	public Action detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action recommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action replyAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action replyDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action replyModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action replyRecommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public Action list
		(HttpServletRequest request, HttpServletResponse response, String arrangeType, int page) throws ServletException, IOException;

}
	