package common;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TestService svc = new TestServiceImpl();
		
//		List<String> list = svc.showTestList();
//		
//		System.out.println(list);
//		req.setAttribute("list", list);
		
		String path = "jsp/main.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp); //페이지 재지정
	}
}
