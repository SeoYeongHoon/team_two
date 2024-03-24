package hyunook.ProductList;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;


public class ProductPageDTO implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		 String category = req.getParameter("category");
		 String price1 = req.getParameter("price1");
		 String price2 = req.getParameter("price2");
		 String sl = req.getParameter("sl");
		
		GoodsSearch search = new GoodsSearch();
		search.setCategory(category);
		search.setPrice1(Integer.parseInt(price1));
		search.setPrice2(Integer.parseInt(price2));
		search.setSl(sl);
		 GoodsListService svc = new GoodsListServiceImpl();
		 int cnt = svc.privateCnt(search);
		 System.out.println("count: "+cnt);
	    
		 resp.getWriter().print("{\"totalCount\":"+cnt+"}");
		
	}
}