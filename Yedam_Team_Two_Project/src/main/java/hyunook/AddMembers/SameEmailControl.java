package hyunook.AddMembers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Member;
import hyunook.Login.MemberService;
import hyunook.Login.MemberServiceImpl;

public class SameEmailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
        Member member = new Member();
        member.setEmail(email);
        resp.setContentType("text/json;charset=utf-8");

        
        MemberService svc = new MemberServiceImpl();
        int result = svc.sameEmail(email);
        System.out.println(result);
	    
        Gson gson = new GsonBuilder().create();
        
        String json = gson.toJson(result);
        System.out.println(json);
        resp.getWriter().print(json);

	}

}
