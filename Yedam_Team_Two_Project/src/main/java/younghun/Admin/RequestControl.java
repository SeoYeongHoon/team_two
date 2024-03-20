package younghun.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class RequestControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String path = "jsp/request.tiles";
//		RequestDispatcher dispatch = req.getRequestDispatcher(path);
//		dispatch.forward(req, resp);
		resp.setContentType("text/json;charset=utf-8");
		
		String title = req.getParameter("title_info");
		String content = req.getParameter("content_info");
		String type = req.getParameter("type_info");
		String image = req.getParameter("chooseFile");
		
		Goods goods = new Goods();
		
		goods.setName(title);
		goods.setDescription(content);
		goods.setImage(image);
		
		System.out.println(goods);
		
		GoodsListService svc = new GoodsListServiceImpl();
		
		if (svc.addGoods(goods)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
			resp.sendRedirect("management.do");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
