package changoh.Magazine;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class MagazineControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		MagazineService svc = new MagazineServiceImpl();
		
		String magazineId = req.getParameter("magazineId");
		
		Magazine magazine = svc.getMagazine(Integer.parseInt(magazineId));
		
		String path = "";
		if (magazine != null) {
			req.setAttribute("magazine", magazine);
			path = "jsp/magazine.tiles";
		} else { //해당하는 정보가 없다면 오류 페이지로 이동
			req.setAttribute("errorMessage", "알 수 없는 오류가 발생하였습니다.");
			path = "jsp/error.tiles";
		}
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
