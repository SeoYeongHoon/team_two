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
		// int qnaId; 시퀀스 값은 DB에서 생성함
		// Date qnaDate; SYSDATE 값도 마찬가지
		
		//로그인 중인 세션의 아이디를 받아와야 하므로, 세션 객체 생성
		HttpSession session = req.getSession();
		
		//세션의 아이디를 받아옴
		String memberId = (String) session.getAttribute("memberId");
		
		//요청객체의 파라미터에서 qnaTitle의 값을 가져옴
		String title = req.getParameter("title");
		
		//요청객체의 파라미터에서 qnaContent의 값을 가져옴
		String content = req.getParameter("content");
		// 이 값들을 담은 객체에 저장하

		QnAService svc = new QnAServiceImpl();
		svc.insertQnA(memberId, title, content);
		//이 경로에 보내겠다. * 이 경로는 관리자의 요청 처리 페이지가 되어야 한다.
		String path = "jsp/qna.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
		//테스트 해보려 했는데, 일단 로그인 쪽이 완료가 덜 된 모양임. 나중에 모여서 테스트할때 해볼 것
	}

}
