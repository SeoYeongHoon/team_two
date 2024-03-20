package changoh.Magazine;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.PageDTO;

public class MagazineListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//JDBC작업을 통해 불러 온 Magazine 정보를 List에 담아 magazineList.jsp로 송출
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		MagazineService svc = new MagazineServiceImpl();
		int boardCountInPage = Integer.parseInt(page);
		List<Magazine> list = svc.getMagazineList(boardCountInPage);
		
		for(int i = 0; i < list.size(); ++i) {
			System.out.println(list.get(i).toString());
		}
		
		PageDTO pageDTO = new PageDTO(boardCountInPage, svc.getTotalCount(), 5);
		
		req.setAttribute("list", list);
		req.setAttribute("page", pageDTO);
		
		String path = "jsp/magazineList.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
