package changoh.MyCart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class CartListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String)session.getAttribute("logid");
		
		req.setAttribute("memberId", memberId);
		
		String path = "jsp/myCart.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
