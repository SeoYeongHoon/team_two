package younghun.Manage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Control;

public class ManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String title = req.getParameter("title_info");
//		String image = req.getParameter("img_info");
//		String content = req.getParameter("content_info");
//		String templateOption = req.getParameter("template_option");
//
//		resp.setContentType("text/html;charset=UTF-8");
//		resp.getWriter().println(title);
//		resp.getWriter().println(image);
//		resp.getWriter().println(content);
//		resp.getWriter().println(templateOption);
		
		
//		String savePath = "static/img";
//		int sizeLimit = 1024*1024*15;
//		
//		MultipartRequest multi = new MultipartRequest(
//        			req, 
//            		savePath, 
//                	sizeLimit, 	
//                	"utf-8", 
//                	new DefaultFileRenamePolicy());
//		
//		String image = multi.getFilesystemName("chooseFile");
//		resp.getWriter().println(image);

		String path = "jsp/management.tiles";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}

}
