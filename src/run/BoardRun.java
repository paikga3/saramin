package run;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.FreeBoardWriteBean;
import controller.Action;
import structure.Board;
import db.FreeBoardDAO;

import java.util.*;
import java.text.*;

public class BoardRun{

	
	public Action add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		FreeBoardDAO bDAO = new FreeBoardDAO();
		FreeBoardWriteBean write = (FreeBoardWriteBean)request.getAttribute("객체이름");
		
		//date는 DAO에서 sysdate로, 글번호는 rownum으로 자동지정합시다.
		
		bDAO.add(write);
		
		//bDAO.글등록메소드(bBean);
		
		Action action = new Action();
		action.setSimpleMove(true);
		action.setPath("/url");
		return action; //이해가 잘 안되는 부분으로 설명 부탁드립니다
		
		// Parameter들의 writer, title, content들의 밸류들로 boardBean 셋팅을 했습니다. 
		// 최종적으로 boardBean.add를 했습니다.
		
		/*
		
		우선 위에서부터 살펴보니깐 게시글에 대한 내용을 jsp에서 request파라미터에 실어서 서블릿에서 처리하려고 하시는데
		그거 보다는 jsp에서 빈객체를 생성하시고 거기에 게시글에 대한 내용을 담아서 빈객체 하나만 request의 영역에 담아(setAttribute메서드 사용)
		서블릿에서는 request로부터 빈객체를 얻어와 바로 활용하는 것이 좋을 거 같습니다.
		 
		Action클래스는 페이지 이동과 관련이 있습니다.
		페이지이동은 포워딩방식과 리다이렉트 방식이 있습니다.
		두 방식의 차이점은 포워딩방식은 요청내용이 계속 이어져서 다음페이지로 전달됩니다. (response되어지지 않은상태입니다.)
		리다이렉트 방식은 response되어지고 처음 리다이렉트할 때 지정했었던 페이지로 재요청합니다.
		
		이것을 용도에 따라 포워딩을 해야할 때  setSimpleMove(false) 가 있고 
		리다이렉트를 해야할 때 setSimpleMove(true)
		가 있습니다.
		
		단순히 무언가를 보여줄 때(게시판의 리스트를 단순히 보여줄 때)는 리다이렉트방식을 사용합니다.
		그러나 서블릿에서 어떠한 처리를 하고(게시판의 리스트를 계산하여 얻어오고) 그 결과를 통해 view에 뿌리고자 할 때
		그 때 그 결과를 request에 실어서 보낼 때  바로 그 때 포워딩 방식을 사용합니다.
		 //이형주 : 설명 감사합니다
	     */
	
	}

	
	public Action delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*request.setCharacterEncoding("UTF-8");
		
		FreeBoardDAO bbsDB = new FreeBoardDAO();
		FreeBoardWriteBean bbsBean = new bbsBean();
		
		HttpSession httpsession = request.getSession();
		int memberno = (int) httpsession.getAttribute("member_no");
		int bbsNo = request.getAttribute("FreeBoard_no");
		String writer = request.getAttribute("FreeBoard_Alias")
		bbsBean.setFreeBoardno(bbsNO);
		
		if(memberno != null && bbsDB.getName(bbsBean).equals(writer)){
		bbsDB.delete(bbsBean);
		}else{
			
		}*/
		
		// 메서드의 매개변수를 통일시키기 위해 매개변수로 빈객체 하나만을 사용하도록 DAO클래스를 설계하였습니다.
		// 만약 위에서처럼 글번호를 받아왔다면(member_no는 무언가 회원의 의미가 있는데 글번호와 어울리는 naming은 아니라고 봅니다. 차라리 board_no 이런것이 낫지 않을까요?)
		// 새로운 bean객체에 글번호만 setter메서드로 담아서 전달하면 될 것입니다.
		
	return null;	
		// TODO Auto-generated method stu
	}

	
	public Action modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*request.setCharacterEncoding("UTF-8");
		
		FreeBoardDAO bbsDB = new FreeBoardDAO();
		FreeBoardWriteBean bbsBean = new bbsBean();
		
		HttpSession httpsession = request.getSession();
		int memberno = (int) httpsession.getAttribute("member_no");
		int bbsNo = request.getAttribute("FreeBoard_no");
		String writer = request.getAttribute("FreeBoard_Alias");
		
		
		bbsBean.setFreeBoardno(bbsNO);
		
		if(memberno != null && bbsDB.getName(bbsBean).equals(writer)){
		bbsDB.modify(bbsBean);
		}else{
			
		}*/
		
		
		return null;
		// TODO Auto-generated method stub

	}

	
	public Action reply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return null;
		// TODO Auto-generated method stub

	}
	
	public Action read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return null;
		// TODO Auto-generated method stub

	}
	
	public Action recommend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return null;
		// TODO Auto-generated method stub

	}
	
	public Action getTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");	
		
		// 시간을 파싱하는 부분에 대해서는 따로 메서드를 구성하시는 것이 좋습니다.
		// 기능을 분리하여 코드간의 의존성을 줄이는 것이 유지보수에 용이하기 때문입니다.
		// list 메서드는 단순히 DAO클래스에서 글 리스트를 얻어와 request영역에 실어주기만 하는 것으로 족할 것입니다.
		
		//->이형주:그럼 boardContoller에서도 메서드 실행문 따로 하겠습니다.
		
		// FreeBoardWriteBean객체의 getFreeboard_regDate()메소드는 1985-03-22 12:03:22 이러한 형태의 문자열을 반환합니다.
		
		// ->이형주: BoardDAO에서 리스트 select to_char(regDate, 'yy:mm:dd:hh24:mm:ss') as rdate from boardlist 로 따로 하나 불러와주는거 가능할까여?
		// yyyy:mm:dd:hh24:mm:ss 형식으로 반환되도록 수정하였습니다 다음주 수요일에 발표이기때문에 월요일까진 자유게시판 완성이 되어야합니다...주말에 중간결과를 보겠습니다.
		
		// 년,월,일,시,분,초로 각각을 파싱하여 두고 이들을 현재시간과 비교하는 식으로 로직을 짜면 될 거같습니다.
		// 가령 현재의 연도와 파싱되어진 연도와 같다면 월끼리 비교를 하고 이도 같다면 일끼리 비교하여 다른 값이 나오면 그 다른 값의 단위로
		// 차이값을 반환하면 될 것입니다.
		
		
		/*
		Date now= new Date();
		Calendar rdates = Calendar.getInstance(Locale.KOREA);
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss");

		FreeBoardDAO bbsDB = new FreeBoardDAO();
		FreeBoardWriteBean bbsBean = new bbsBean();
		
		ArrayList<bbsBean> list = bbsDB.getList(int pageNum, String type);
	
		long currentTime = System.currentTimeMillis();
		
		long rtime = 0;
		
		long difference = 0;
		
		String dates ="";
		
		for(int i = 0 ; i < list.size() ; i++){
			
			dates = list.get(i).getRegDate();
			
			rdates.set(Integer.parseInt(dates.substring(0, 4)), Integer.parseInt(dates.substring(4, 6))-1, Integer.parseInt(dates.substring(6, 8)), Integer.parseInt(dates.substring(8, 10)), Integer.parseInt(dates.substring(10, 12)), Integer.parseInt(dates.substring(12, 14)));
			
			rtime=rdates.getTimeInMillis();
			
			difference = (currentTime - rtime)/1000;
			
			if(difference < 60){
				request.setAttribute("time["+i+"]", String.valueOf(difference)+" 초 전 글입니다");
			}else if(difference >= 60 && difference < 3600){
				request.setAttribute("time["+i+"]", String.valueOf(Math.Round(difference/60))+" 분 전 글입니다");
			}else if(difference >= 3600 && difference < (3600*24)){
				request.setAttribute("time["+i+"]", String.valueOf(Math.Round(difference/3600))+" 시간 전 글입니다");
			}else if(difference >= (3600*24) && difference < (3600*24*30)){
				request.setAttribute("time["+i+"]", String.valueOf(Math.Round(difference/(3600*24)))+" 일 전 글입니다");
			}else if(difference >= (3600*24*30) && difference < (3600*24*365)){
				request.setAttribute("time["+i+"]", String.valueOf(Math.Round(difference/(3600*24*30)))+" 달 전 글입니다");				
			}else if(difference >=(3600*24*365)){
				request.setAttribute("time["+i+"]", String.valueOf(Math.Round(difference/(3600*24*30)))+" 년 전 글입니다");
			}
			
			//JSP페이지에서는 i 변수 반복문으로 request.getAttribute("time[i]") 하면 될듯 합니다
		}*/
		return null;
			
	}

	
	public Action list(HttpServletRequest request, HttpServletResponse response, String arrangeType, int page)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	
	public Action detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
