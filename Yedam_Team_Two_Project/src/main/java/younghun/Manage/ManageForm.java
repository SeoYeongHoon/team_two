package younghun.Manage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class ManageForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		// POST로 전송된 데이터를 받습니다.
		String name = req.getParameter("name_info");
		String title = req.getParameter("title_info");
		String content = req.getParameter("content_info");
		String templateOption = req.getParameter("template_option");

		// 받은 데이터를 화면에 출력합니다.
		resp.setContentType("text/html;charset=UTF-8");
		resp.getWriter().println(name);
		resp.getWriter().println( title);
		resp.getWriter().println(content);
		resp.getWriter().println(templateOption);
		
		String path = "jsp/management.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}

}
