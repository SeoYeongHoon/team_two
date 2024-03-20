package younghun.Manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class RemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String goodsId = req.getParameter("goodsId");
		GoodsListService svc = new GoodsListServiceImpl();

		if (svc.removeGoods(goodsId)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
