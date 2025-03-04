package youhwan.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CartList;
import common.Control;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String goodsId = req.getParameter("goodsId");
		String id = req.getParameter("memberId");
		
		System.out.println(goodsId + " 멤버아이디: " + id);
		
		CartList list = new CartList();
		list.setGoodsId(goodsId);
		list.setMemberId(id);
		
		ProductService svc = new ProductServiceImpl();
		
		if (svc.insertCartList(list)) {
			req.setAttribute("success", "장바구니 넣기 성공");
		} else {
			req.setAttribute("message", "에러가 발생했습니다.");
			String path = "jsp/mainPage.tiles";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
