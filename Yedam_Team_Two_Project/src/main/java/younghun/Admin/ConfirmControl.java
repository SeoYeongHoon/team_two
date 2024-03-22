package younghun.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;
import common.Goods;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class ConfirmControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String goodsId = req.getParameter("goodsId");
		System.out.println(goodsId);

		GoodsListService svc = new GoodsListServiceImpl();

		Goods goods = svc.getGoods(Integer.parseInt(goodsId));
		System.out.println(goods.toString());

		req.setAttribute("goods", goods);
		
		goods.setIsConfirm(0);
		
		if (svc.updateConfirm(goods)) {
			resp.sendRedirect("admin.do");
		} else {
			// resp.getWriter().print("{\"retCode\": \"NG\"}");
			req.setAttribute("message", "수정 중 에러가 발생했습니다.");
			String path = "jsp/mainPage.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
