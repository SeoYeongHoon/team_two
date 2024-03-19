package hyunook.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;
import common.Member;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String id = req.getParameter("id");
       String pw = req.getParameter("pw");
       System.out.println(id);
       System.out.println(pw);
       Member member = new Member();
       member.setMemberId(id);
       member.setPassword(pw);
       MemberService svc = new MemberServiceImpl();
       member = svc.loginCheck(member);
       if(member != null) {
    	   HttpSession session = req.getSession();
    	   session.setAttribute("logid", id);
    	   session.setAttribute("logName", member.getName());
    	   session.setAttribute("logMemberType", member.getMemberType());
    	   resp.sendRedirect("main.do");
       }else {
    	   req.setAttribute("message", "아이디와 비밀번호가 일치하지않습니다.");
    	   String path = "jsp/loginForm.tiles";
    	   req.getRequestDispatcher(path).forward(req, resp);
       }
	}

}
