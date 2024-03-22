package younghun.Manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class RemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String goodsId = req.getParameter("goodsId");
		
		GoodsListService svc = new GoodsListServiceImpl();
		
		if (svc.removeGoods(Integer.parseInt(goodsId))) {
			req.setAttribute("success", "삭제성공");
			resp.sendRedirect("management.do");
		} else {
			req.setAttribute("message", "삭제 중 에러가 발생했습니다.");
			String path = "jsp/mainPage.tiles";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
