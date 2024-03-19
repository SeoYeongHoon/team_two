package youhwan.Product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Goods;

public class ProductControl implements Control {
	
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String name = "상품1";
	    
		Goods goods = new Goods();
		
	    goods.setName(name);
	    
		resp.setContentType("text/json;charset=utf-8");
		ProductService svc = new ProductServiceImpl();
		
		List<Goods> list = svc.ProductList(goods);
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		System.out.println("json" + json);
		System.out.println(list);
		
		
		
	}

}
