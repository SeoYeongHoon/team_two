package younghun.Manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class RemoveGoodsForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String goodsId = req.getParameter("goodsId");

		GoodsListService svc = new GoodsListServiceImpl();
		Goods goods = svc.getGoods(Integer.parseInt(goodsId));

		req.setAttribute("goods", goods);

		String path = "jsp/deleteGoods.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
