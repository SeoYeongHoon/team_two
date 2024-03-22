package dongwon.QnA;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class QnAResultControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				//QnAResultControl의 역할 : qna.do에서 input에 작성한 값들과 세션 Id값을
				//DB에 insert할수 있도록 하고, 처리후 다시 qna.do로 이동하게 함.
			
				//로그인 중인 세션의 아이디를 받아와야 하므로, 세션 객체 생성
				HttpSession session = req.getSession();
				//세션의 아이디를 받아옴
				String memberId = (String) session.getAttribute("memberId");
				
				//요청객체의 파라미터에서 qnaTitle의 값을 가져옴
				String title = req.getParameter("title");
				
				//요청객체의 파라미터에서 qnaContent의 값을 가져옴
				String content = req.getParameter("content");

				QnAService svc = new QnAServiceImpl();
				svc.insertQnA(memberId, title, content);
				
				String path = "jsp/qna.tiles";
				RequestDispatcher dispatch = req.getRequestDispatcher(path);
				dispatch.forward(req, resp);
	}

}
