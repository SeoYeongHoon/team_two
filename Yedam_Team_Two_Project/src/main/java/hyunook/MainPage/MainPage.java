package hyunook.MainPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import common.Goods;

public class MainPage implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		
		MainPageService svc= new MainPageServiceImpl();
		List<Goods> list = svc.mainPageList();
		System.out.println("list: "+list);
		req.setAttribute("list", list);
		String path = "jsp/mainPage.tiles"; //web-inf/view/loginForm.jsp
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
