package hyunook.ProductList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Goods;

public class PrivateListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 req.setCharacterEncoding("utf-8");
		 resp.setContentType("text/json;charset=utf-8");
		 String goods ="카테고리1";
		 System.out.println(goods);
	     GoodsListService svc = new GoodsListServiceImpl();
	     List<Goods> list = svc.privateProductList(goods);
         Gson gson = new GsonBuilder().create();
	     String json = gson.toJson(list);
	     System.out.println("json"+json);
	    
	     resp.getWriter().print(json);
	}
}
