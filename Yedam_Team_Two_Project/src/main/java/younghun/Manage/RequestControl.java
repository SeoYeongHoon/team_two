package younghun.Manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Control;
import common.Goods;
import common.GoodsState;
import common.RequestType;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class RequestControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String savePath = req.getServletContext().getRealPath("static/img/bg-img/");
		int maxSize = 1024 * 1024 * 15;
		String enc = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title_info");
		String content = multi.getParameter("content_info");
		String image = multi.getFilesystemName("image");
		String price = multi.getParameter("price");
		String id = multi.getParameter("memberId");

		Goods goods = new Goods();
		goods.setName(title);
		goods.setDescription(content);
		goods.setPrice(Integer.parseInt(price));
		goods.setReqType(RequestType.ADD);
		goods.setGoodsState(GoodsState.valueOf("SOLDOUT"));
		goods.setImage(image);
		goods.setMemberId(id);
		System.out.println("SELLER 멤버 ID: " + id);
		
		GoodsListService svc = new GoodsListServiceImpl();
		
		if (svc.addGoods(goods)) {
			resp.sendRedirect("management.do");
			System.out.println(goods);
		} else {
			req.setAttribute("message", "수정 중 에러가 발생했습니다.");
			String path = "jsp/mainPage.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
