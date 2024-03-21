package changoh.Payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Member;

public class PaymentMemberInfoAjaxControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//가장 최신의 주문내역번호를 내보내는 AJAX
		resp.setContentType("text/json;charset=utf-8");
		
		PaymentService svc = new PaymentServiceImpl();
		
		Member inputMemberInfo = new Member();
		inputMemberInfo.setMemberId(req.getParameter("memberId"));
		
		Member foundMemberInfo = svc.getMember(inputMemberInfo);
		
		if (foundMemberInfo != null) {
			req.setAttribute("member", foundMemberInfo);
			
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(foundMemberInfo);
			resp.getWriter().print(json);
		}
	}
}
