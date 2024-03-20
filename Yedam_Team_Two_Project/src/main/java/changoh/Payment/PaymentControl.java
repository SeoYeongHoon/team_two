package changoh.Payment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import common.Member;

public class PaymentControl implements Control{
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		String goodsId = req.getParameter("goodsId");
		
		req.setAttribute("memberId", memberId);
		req.setAttribute("goodsId", goodsId);
		
		String path = "jsp/payment.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}	
}
