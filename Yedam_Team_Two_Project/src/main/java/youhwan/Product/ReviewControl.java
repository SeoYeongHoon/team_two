package youhwan.Product;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;

public class ReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String gid = "1"; // req.getParameter("bno");
		
		//Review rvw = new Review();
		
		// 리뷰데이터 가져오기
		resp.setContentType("text/json;charset=utf-8");
		ProductService svc = new ProductServiceImpl();
		List<Review> list = svc.ProductReview(Integer.parseInt(gid));
		
		
		Gson gson = new GsonBuilder().create();
		
		
		String json = gson.toJson(list);
		
		resp.getWriter().print(json);
	}

}
