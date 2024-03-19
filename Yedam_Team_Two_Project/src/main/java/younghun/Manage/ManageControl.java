package younghun.Manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class ManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String path = "jsp/management.tiles";
//		RequestDispatcher dispatch = req.getRequestDispatcher(path);
//		dispatch.forward(req, resp);
		
		resp.setContentType("text/json;charset=utf-8");
		
		GoodsListService svc = new GoodsListServiceImpl();
		List<Goods> list = svc.goodsList();
		
		Gson gson = new GsonBuilder().create();
		
		String json = gson.toJson(list);
		
		resp.getWriter().print(json);
		System.out.println(json);
	}

}
