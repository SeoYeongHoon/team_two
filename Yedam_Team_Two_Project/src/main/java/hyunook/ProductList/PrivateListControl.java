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
		 String category = req.getParameter("category");
		 String order = req.getParameter("order");
		 String price1 = req.getParameter("price1");
		 String price2 = req.getParameter("price2");
		 String page = req.getParameter("page");
		 System.out.println("category: "+category);
		 System.out.println("order: "+order);
		 System.out.println("price1: "+price1);
		 System.out.println("price2: "+price2);
		 System.out.println("page: "+page);
		 GoodsSearch search = new GoodsSearch();
		 search.setCategory(category);
		 search.setOrder(order);
		 search.setPrice1(Integer.parseInt(price1));
		 search.setPrice2(Integer.parseInt(price2));
		 search.setPage(Integer.parseInt(page));
		 System.out.println("page: "+page);
	     GoodsListService svc = new GoodsListServiceImpl();
	     List<Goods> list = svc.privateProductList(search);
	     System.out.println(search);
         Gson gson = new GsonBuilder().create();
	     String json = gson.toJson(list); //자동으로 ajax 
	     System.out.println("json"+json);
	    
	     resp.getWriter().print(json);
	}
}
