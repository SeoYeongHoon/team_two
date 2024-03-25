package younghun.Manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;
import common.Goods;
import common.PageDTO;
import hyunook.ProductList.GoodsListService;
import hyunook.ProductList.GoodsListServiceImpl;
import hyunook.ProductList.GoodsSearch;

public class ManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		HttpSession session = req.getSession();
		String page = req.getParameter("page");
		String memberId = (String) session.getAttribute("logid");
		page = page == null ? "1" : page;
		int boardCountInPage = Integer.parseInt(page);
		
		GoodsSearch search = new GoodsSearch();
		search.setMemberId(memberId);
		GoodsListService svc = new GoodsListServiceImpl();
		List<Goods> list = svc.goodsList(search);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.boardTotalCnt(), 5);
		
		req.setAttribute("list", list);
		req.setAttribute("page", pageDTO);
		
		String path = "jsp/management.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
