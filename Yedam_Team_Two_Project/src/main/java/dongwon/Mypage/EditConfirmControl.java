package dongwon.Mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;
import common.Member;
import hyunook.Login.MemberService;
import hyunook.Login.MemberServiceImpl;

public class EditConfirmControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("memberId");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");

		Member member = new Member();

		member.setMemberId(id);
		member.setName(name);
		member.setPassword(password);
		member.setEmail(email);
		member.setTel(phone);

		MemberService svc = new MemberServiceImpl();
		System.out.println(member.toString());
		
		if (svc.updateUserInfo(member)) {
			HttpSession session = req.getSession();
			session.setAttribute("logid", id);
	    	session.setAttribute("logPw", password);
			session.setAttribute("logName", name);
			session.setAttribute("logEmail", email);
			session.setAttribute("logTel", phone);
			resp.sendRedirect("mypage.do");
		} else {
			req.setAttribute("message", "수정 중 에러가 발생했습니다.");
			String path = "jsp/mainPage.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}

}
