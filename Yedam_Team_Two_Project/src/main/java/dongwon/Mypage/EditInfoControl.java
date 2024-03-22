package dongwon.Mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;
import common.Member;

public class EditInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pw = req.getParameter("pw");
		String myPw = req.getParameter("myPw");
		System.out.println(pw);
		System.out.println(myPw);
		
		if (pw.equals(myPw)) {
			resp.sendRedirect("editForm.do");
		} else {
			req.setAttribute("message", "비밀번호가 일치하지않습니다.");
	    	String path = "jsp/checkPassForm.tiles";
	    	req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
