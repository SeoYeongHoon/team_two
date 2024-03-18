package youhwan.Product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class Productform implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ProductService svc = new ProductServiceImpl();
		
		resp.setContentType("text/json;charset=utf-8");
		String path = "jsp/product.tiles";
		
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
