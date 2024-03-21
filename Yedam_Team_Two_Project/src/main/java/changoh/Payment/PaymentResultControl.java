package changoh.Payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import common.Control;
import common.Member;

public class PaymentResultControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PaymentService svc = new PaymentServiceImpl();
		
		String price = req.getParameter("price");
		String pId = req.getParameter("pId");
		String jsonMember = req.getParameter("member");		
		
		System.out.println(jsonMember);
		
		ObjectMapper mapper = new ObjectMapper();
		Member member = mapper.readValue(jsonMember, Member.class);
		
		System.out.println(member);

		PurchaseHistory newPH = new PurchaseHistory();
		
		
		newPH.setPrice(Integer.parseInt(price));
		newPH.setPId(pId);
		newPH.setMemberId(member.getMemberId());
		
		if (svc.createPurchaseHistoryData(newPH) > 0) {
			req.setAttribute("price", price);
			req.setAttribute("member", member);
			req.setAttribute("pId", pId);
			
			String path = "jsp/paymentResult.tiles";
			req.getRequestDispatcher(path).forward(req, resp);			
		}
	}
}
