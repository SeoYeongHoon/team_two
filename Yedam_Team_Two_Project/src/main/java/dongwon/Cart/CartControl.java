package dongwon.Cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class CartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CartService svc = new CartServiceImpl();
		
		String path = "jsp/cart.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}

}
