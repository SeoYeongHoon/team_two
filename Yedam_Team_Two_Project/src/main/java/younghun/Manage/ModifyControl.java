package younghun.Manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class ModifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String goodsId = req.getParameter("goodsId");
//		String name = req.getParameter("name");
//		String desc = req.getParameter("description");
//
//		Goods goods = new Goods();
//		goods.setGoodsId(Integer.parseInt(goodsId));
//		goods.setName(name);
//		goods.setDescription(desc);
//
//		GoodsListService svc = new GoodsListServiceImpl();
//
//		if (svc.modifyGoods(goods)) {
//			resp.sendRedirect("requestForm.do");
//		} else {
//			req.setAttribute("message", "수정 중 에러가 발생했습니다.");
//			String path = "management.do";
//			req.getRequestDispatcher(path).forward(req, resp);
//		}

		String goodsId = req.getParameter("goodsId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		Goods goods = new Goods();

		goods.setGoodsId(Integer.parseInt(goodsId));
		goods.setName(title);
		goods.setDescription(content);

		GoodsListService svc = new GoodsListServiceImpl();

		if (svc.modifyGoods(goods)) {
			// resp.getWriter().print("{\"retCode\": \"OK\"}");
			resp.sendRedirect("management.do");
		} else {
			// resp.getWriter().print("{\"retCode\": \"NG\"}");
			req.setAttribute("message", "수정 중 에러가 발생했습니다.");
			String path = "jsp/mainPage.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
