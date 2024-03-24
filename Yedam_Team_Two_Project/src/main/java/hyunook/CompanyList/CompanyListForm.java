package hyunook.CompanyList;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class CompanyListForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = "jsp/company.tiles"; //web-inf/view/loginForm.jsp
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
