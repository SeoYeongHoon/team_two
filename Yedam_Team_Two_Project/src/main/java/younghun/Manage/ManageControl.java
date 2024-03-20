package younghun.Manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class ManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		resp.setContentType("text/json;charset=utf-8");
//		
//		GoodsListService svc = new GoodsListServiceImpl();
//		List<Goods> list = svc.goodsList();
//		
//		Gson gson = new GsonBuilder().create();
//		
//		String json = gson.toJson(list);
//		
//		resp.getWriter().print(json);
//		System.out.println(json);
		
//		String goodsId = req.getParameter("goodsId");
//		String title = req.getParameter("title_info");
//		String content = req.getParameter("content_info");
//		String type = req.getParameter("type_info");
//		String image = req.getParameter("chooseFile");
//		
//		Goods goods = new Goods();
//		
//		goods.setName(title);
//		goods.setDescription(content);
//		goods.setImage(image);
//		
//		GoodsListService svc = new GoodsListServiceImpl();
//		HttpSession session = req.getSession();
//		
//		// session.setAttribute("goodsId", session);
//		session.setAttribute("name", title);
//		session.setAttribute("description", content);
//		String path = "jsp/management.tiles";
//		req.getRequestDispatcher(path).forward(req, resp);
		
		GoodsListService svc = new GoodsListServiceImpl();
		List<Goods> list = svc.goodsList();
		
		req.setAttribute("list", list);
		String path = "jsp/management.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
