package changoh.Payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class PaymentControl implements Control{
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String)session.getAttribute("logid");
		String goodsId = req.getParameter("goodsId");
		
		req.setAttribute("memberId", memberId);
		req.setAttribute("goodsId", goodsId);
		
		String path = "jsp/payment.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}	
}
