package hyunook.MainPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class MainPage implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "/jsp/mainPage.tiles"; //web-inf/view/loginForm.jsp
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
