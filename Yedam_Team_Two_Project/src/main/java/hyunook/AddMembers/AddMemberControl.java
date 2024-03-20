package hyunook.AddMembers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Control;
import common.Member;
import hyunook.Login.MemberService;
import hyunook.Login.MemberServiceImpl;

public class AddMemberControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		
    	String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String tel = req.getParameter("tel");
        String memberType = req.getParameter("auth");
        
	

        // 회원 객체 생성 시 생성자를 이용하여 회원 유형을 설정
        System.out.println(id);
        System.out.println(pw);
        System.out.println(name);
        System.out.println(email);
        System.out.println(tel);
        System.out.println(memberType);
        
        Member member = new Member();
        member.setMemberId(id);
        member.setPassword(pw);
        member.setName(name);
        member.setEmail(email);
        member.setTel(tel);
        member.setMemberType(Member.MemberType.valueOf(memberType));
        MemberService svc = new MemberServiceImpl();
        if (svc.addMember(member)) {
        	HttpSession session = req.getSession();
        	session.setAttribute("addId", id);
        	session.setAttribute("addName", name);
        	session.setAttribute("addPw", pw);
        	session.setAttribute("addEmail", email);
        	session.setAttribute("addTel", tel);
            String path1 = "WEB-INF/jsp/addClear.jsp";
            req.getRequestDispatcher(path1).forward(req, resp);
        } else {
        	 req.setAttribute("message", "수정중 에러가 발생함");
  		     String path = "WEB-INF/view/error.jsp";
  		     req.getRequestDispatcher(path).forward(req, resp);
        }
    }
}