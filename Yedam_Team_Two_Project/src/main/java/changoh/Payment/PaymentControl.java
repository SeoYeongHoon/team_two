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
				
		PaymentService svc = new PaymentServiceImpl();

		//찾고자 하는 멤버 및 상품 정보
		Member inputMemberInfo = new Member();
		inputMemberInfo.setMemberId(req.getParameter("memberId"));
		
		Goods inputGoodsInfo = new Goods();
		inputGoodsInfo.setGoodsId(Integer.parseInt(req.getParameter("goodsId")));
		
		Member foundMemberInfo = svc.getMember(inputMemberInfo);
		Goods foundGoodsInfo = svc.getGoods(inputGoodsInfo);
		
		System.out.println(foundMemberInfo.toString());
		System.out.println(foundGoodsInfo.toString());
		
		//해당 회원 정보와 상품 정보가 있다면 결제 페이지로 이동
		String path = "";
		if (foundMemberInfo != null && foundGoodsInfo != null) {
			req.setAttribute("member", foundMemberInfo);
			req.setAttribute("goods", foundGoodsInfo);
			path = "jsp/payment.tiles";
		} else { //해당하는 정보가 없다면 오류 페이지로 이동
			req.setAttribute("errorMessage", "알 수 없는 오류가 발생하였습니다.");
			path = "jsp/error.tiles";
		}
		
		//이동 할 경로
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp); //페이지 재지정		
	}
}
