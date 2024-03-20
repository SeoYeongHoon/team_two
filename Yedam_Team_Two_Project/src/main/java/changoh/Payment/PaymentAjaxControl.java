package changoh.Payment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Goods;
import common.Member;

public class PaymentAjaxControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		PaymentService svc = new PaymentServiceImpl();

		//찾고자 하는 멤버 및 상품 정보
		Member inputMemberInfo = new Member();
		inputMemberInfo.setMemberId(req.getParameter("memberId"));
		Member foundMemberInfo = svc.getMember(inputMemberInfo);
		
		Goods inputGoodsInfo = new Goods();
		Goods foundGoodsInfo = null;
		if (req.getParameter("goodsId") != null) {
			inputGoodsInfo.setGoodsId(Integer.parseInt(req.getParameter("goodsId")));			
			foundGoodsInfo = svc.getGoods(inputGoodsInfo);
		}		
				
		//넘어온 정보가 즉시 구매인지 장바구니 내역 구매인지 유무 파악(goodsId가 null이라면
		if (foundMemberInfo != null) {
			List<Goods> list = new ArrayList<Goods>();
			
			if (foundGoodsInfo != null) { //단일 구매 처리
				list.add(foundGoodsInfo);
			} else { //장바구니 구매 처리
				list = svc.getCartList(foundMemberInfo);
			}
			
			req.setAttribute("list", list);
			
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(list);
			resp.getWriter().print(json);
		} else {
			//해당하는 정보가 없다면 오류 페이지로 이동
			req.setAttribute("errorMessage", "알 수 없는 오류가 발생하였습니다.");
			String path = "jsp/error.tiles";
			
			RequestDispatcher dispatch = req.getRequestDispatcher(path);
			dispatch.forward(req, resp); //페이지 재지정
		}
	}

}
