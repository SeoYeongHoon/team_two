package dongwon.QnA;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class QnAControl implements Control {
	
	//Control을 재정의하여, 요청을 받고 응답을 보내는데, 보내면서 뭘 하는지를 정의함
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인 중인 세션의 아이디를 받아와야 하므로, 세션 객체 생성
		HttpSession session = req.getSession();
		//QnAControl의 역할 : 로그인 체크 -- > JSP파일에서 구현하는게 더 바람직함.
		//Control에서 구현하려면 DB와 대조하는 SQL문도 작성하는 등 소요되는 시간이 길다.
		//그러므로, QnA컨트롤은 그냥 내버려 두자.
		String memberId = (String) session.getAttribute("memberId");
		
		//센드리다이렉트 코드 추가
		
		//이 경로에 보내겠다. * 이 경로는 관리자의 요청 처리 페이지가 되어야 한다.
		String path = "jsp/qna.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}

}
