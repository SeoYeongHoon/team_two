package youhwan.Product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class ReviewTotalCount implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String gid = "1"; //req.getParameter("gid");
		
		ProductService svc = new ProductServiceImpl();
		int cnt = svc.totalCount(Integer.parseInt(gid));
		
		resp.getWriter().print("{\"totalCount\":" + cnt + "}");
		

	}

}
