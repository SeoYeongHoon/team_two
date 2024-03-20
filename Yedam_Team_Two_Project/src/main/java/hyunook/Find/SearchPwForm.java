package hyunook.Find;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class SearchPwForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/jsp/searchPwForm.tiles"; 
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
