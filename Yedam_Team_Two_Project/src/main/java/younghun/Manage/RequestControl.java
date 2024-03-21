package younghun.Manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class RequestControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// String title = req.getParameter("title_info");
		// String content = req.getParameter("content_info");
		// String type = req.getParameter("type_info");
		// String image = req.getParameter("chooseFile");
		

		String savePath = req.getServletContext().getRealPath("static/img/user");
		int maxSize = 1024 * 1024 * 15;
		String enc = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title_info");
		String content = multi.getParameter("content_info");
		String image = multi.getFilesystemName("image");
		
		System.out.println(image);

		Goods goods = new Goods();
		goods.setName(title);
		goods.setDescription(content);
		goods.setImage(image);
		
		GoodsListService svc = new GoodsListServiceImpl();
		
		if (svc.addGoods(goods)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
			resp.sendRedirect("management.do");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
