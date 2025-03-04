package hyunook.Find;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import changoh.MailSend.MailSendManager;
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
	       String randomCode = "";
	       for(int i=0; i<4; ++i) {
	    	   int randValue = (int)(Math.random()*10);
	    	   randomCode += randValue;
	       }
	       System.out.println("randcode: "+randomCode);
	       Member member = new Member();
	       
	       member.setMemberId(id);
	       member.setEmail(email);
	       member.setRandomCode(randomCode);
	       MemberService svc = new MemberServiceImpl();
	       System.out.println(svc.searchPw(member));
	       MailSendManager msr = new MailSendManager();
	       if(svc.searchPw(member)) {
	    	   if(msr.Send(email, randomCode)) {
	    		   resp.getWriter().print("{\"retCode\":\"OK\"}");
	    	   }
	       }
	       else {
	    	   resp.getWriter().print("{\"retCode\":\"NG\"}");
	       }
	       
	       
	}

}
