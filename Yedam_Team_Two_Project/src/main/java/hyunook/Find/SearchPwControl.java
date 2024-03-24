package hyunook.Find;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Member;
import hyunook.Login.MemberService;
import hyunook.Login.MemberServiceImpl;

public class SearchPwControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 req.setCharacterEncoding("utf-8");
		   resp.setContentType("text/json;charset=utf-8");
	       String id = req.getParameter("id");
	       String email = req.getParameter("email");
	       
	       Member member = new Member();
	       
	       member.setMemberId(id);
	       member.setEmail(email);
	       
	       MemberService svc = new MemberServiceImpl();
	       List<Member> list = svc.searchPw(member);
	       Gson gson = new GsonBuilder().create();
	       
	       String json =gson.toJson(list);
	       System.out.println("jsonm"+json);
	       
	       resp.getWriter().print(json);
	}

}
