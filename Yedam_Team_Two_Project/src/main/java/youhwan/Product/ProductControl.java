package youhwan.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;

public class ProductControl implements Control {
	
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		// 상세페이지 데이터 가져오기
		String gid = req.getParameter("pno");
		ProductService svc = new ProductServiceImpl();
		Goods goods = svc.getGoods(Integer.parseInt(gid));
		req.setAttribute("goods", goods);
		

	    String path = "jsp/product.tiles";
	    req.getRequestDispatcher(path).forward(req, resp);
	    
	}

}
