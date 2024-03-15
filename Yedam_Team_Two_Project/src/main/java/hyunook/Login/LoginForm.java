package hyunook.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class LoginForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/jsp/loginForm.tiles"; //web-inf/view/loginForm.jsp
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
