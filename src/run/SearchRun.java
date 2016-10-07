package run;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import structure.Search;

public class SearchRun implements Search {
	
	Action action = null;
	
	@Override
	public Action ajax(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = new Action();
		action.setPath("/pages/searchView/search_ajaxview.jsp");
		action.setSimpleMove(false);

		String ajaxURL = request.getParameter("u");
		String requestURL = "http://www.saramin.co.kr/zf_user/upjikjong-recruit/upjikjong-list/?" + ajaxURL;
		
		URL url = new URL(requestURL);
		URLConnection connection = url.openConnection();
		//모바일로 인식되는 것을 막아줌, 강제로 헤더세팅
		connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36");
		connection.setRequestProperty("Content-Type", "text/html;charset=EUC-KR");
		BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "EUC-KR"));
		StringBuffer htmlContents = new StringBuffer();
		while(true) {
			int read = reader.read();
			if(read == -1) {
				break;
			}
			htmlContents.append((char)read);
		}
		request.setAttribute("html", htmlContents.toString());
		
		return action;
	}

}
