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
		
		//가져온 위 3가지 값을 담아줄 qna 객체를 생성함
		QnA qna = new QnA();
		
		//qna 클래스의 setter 메소드를 사용하여, 객체에 값을 담음 (롬복 사용)
		qna.setMemberId(memberId);
		qna.setTitle(title);
		qna.setContent(content);
		//이 QnA 패키지에서 구현하고자 하는 기능(메소드)을 담은 Service 객체를 생성함.*객체를 생성해야 해당 메소드를 쓰니까
		QnAService svc = new QnAServiceImpl();
		qna = svc.infoQnA(qna);
		//qna 객체에, 기능(메소드)를 적용시킴, 단 여기서는 기능상 딱히 필요가 없을 듯.
		
		//완성된 객체를, 요청 객체에 담아서 (+ title과 content까지 담아서.)
		req.setAttribute("qna", qna);
		req.setAttribute("qnaTitle", title);
		req.setAttribute("qnaContent", content);

		//이 경로에 보내겠다. * 이 경로는 관리자의 요청 처리 페이지가 되어야 한다.
		//추후 논의하고 수정이 필요하다는 소리다.
		//근데 이렇게 되면.. 그냥 QnAControl에서 Service에서 할것까지 다 한거 아닌가?
		String path = "jsp/qna.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
		//테스트 해보려 했는데, 일단 로그인 쪽이 완료가 덜 된 모양임. 나중에 모여서 테스트할때 해볼 것
	}

}
