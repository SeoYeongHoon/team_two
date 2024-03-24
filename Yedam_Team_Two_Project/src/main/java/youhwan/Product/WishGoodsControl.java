package youhwan.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.WishList;

public class WishGoodsControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String goodsId = req.getParameter("goodsId");
		String id = req.getParameter("memberId");
		
		ProductService svc = new ProductServiceImpl();
		System.out.println(goodsId + ", 아이디: " + id);
		
		WishList list = new WishList();
		list.setGoodsId(goodsId);
		list.setMemberId(id);
		
		if (svc.insertWishList(list)) {
			req.setAttribute("success", "찜 성공");
			resp.sendRedirect("product.do");
		} else {
			req.setAttribute("message", "에러가 발생했습니다.");
			String path = "jsp/mainPage.tiles";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
