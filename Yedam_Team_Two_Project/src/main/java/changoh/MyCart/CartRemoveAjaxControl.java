package changoh.MyCart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import dongwon.Cart.CartService;

public class CartRemoveAjaxControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberInfo = req.getParameter("memberId");
		String[] deleteGoodsAry = req.getParameterValues("deleteGoodsAry");
		
		System.out.println("유저 정보: " + memberInfo);
		for(int i = 0; i < deleteGoodsAry.length; ++i) {
			System.out.println("삭제할 목록: " + deleteGoodsAry[i]);			
		}
		
		MyCartService svc = new MyCartServiceImpl();
		boolean deleteProcessError = false;
		for(int i = 0; i < deleteGoodsAry.length; ++i) {
			MyCart cart = new MyCart();
			cart.setMemberId(memberInfo);
			cart.setGoodsId(Integer.parseInt(deleteGoodsAry[i]));
			
			if (svc.removeMyCart(cart) < 1) {
				deleteProcessError = true;
				System.out.println("장바구니 물품 삭제 실패: " + cart.toString());
				break;
			}
		}
		
		//오류 없이 삭제 작업 완료했다면 OK 메세지 보내기
		String msg = "";
		if (deleteProcessError == false) {
			msg = "OK";
		} else {
			msg = "NG";
		}
		resp.getWriter().print(msg);
	}

}
