package younghun.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;
import common.PageDTO;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;

public class AdminControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		int boardCountInPage = Integer.parseInt(page);
		
		GoodsListService svc = new GoodsListServiceImpl();
		List<Goods> list = svc.confirmGoodsList(boardCountInPage);
		
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.boardTotalCnt(), 5);
		
		req.setAttribute("list", list);
		req.setAttribute("page", pageDTO);
		
		String path = "jsp/admin.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
