package hyunook.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class LogoutControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate(); // 세션값을 초기화.
		
		String path = "/jsp/mainPage.tiles"; //web-inf/view/loginForm.jsp
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
