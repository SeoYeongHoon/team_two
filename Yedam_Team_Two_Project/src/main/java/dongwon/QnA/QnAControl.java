package dongwon.QnA;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class QnAControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// int qnaId; 시퀀스 값
		// Date qnaDate; SYSDATE 값
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		String title = req.getParameter("qnaTitle");
		String content = req.getParameter("qnaContent");
		QnA qna = new QnA();
		qna.setMemberId(memberId);
		qna.setTitle(title);
		qna.setContent(content);
		QnAService svc = new QnAServiceImpl();
		qna = svc.infoQnA(qna);
		req.setAttribute("qna", qna);
		
		String path = "jsp/qna.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}

}
