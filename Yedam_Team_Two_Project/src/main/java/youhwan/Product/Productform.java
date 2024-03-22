package youhwan.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;
import common.Goods;

public class Productform implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/json;charset=utf-8");
		
		// gid = 페이지 변경값 
		String gid = "1";
		
		ProductService svc = new ProductServiceImpl();
		
		Goods goods = svc.getGoods(Integer.parseInt(gid));
		 
	    req.setAttribute("goods", goods);
		
	    String path = "jsp/product.tiles";
	    req.getRequestDispatcher(path).forward(req, resp);
		

	}

}
