package changoh.MyCart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Member;

public class CartListAjaxControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		MyCartService svc = new MyCartServiceImpl();
		
		Member inputMemberInfo = new Member();
		inputMemberInfo.setMemberId(req.getParameter("memberId"));
		
		List<MyCart> list = svc.getCartList(inputMemberInfo);
				
		req.setAttribute("list", list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		resp.getWriter().print(json);
	}

}
