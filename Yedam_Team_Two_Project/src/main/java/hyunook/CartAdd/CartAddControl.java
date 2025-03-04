package hyunook.CartAdd;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;

public class CartAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   req.setCharacterEncoding("utf-8");
	   resp.setContentType("text/json;charset=utf-8");
		
	   String pno = req.getParameter("pno");
	   String id = req.getParameter("id");
	   System.out.println(pno);
	   System.out.println("id값값 :"+id);
	   AddCart cart = new AddCart();
	   cart.setGoodsId(Integer.parseInt(pno));
	   cart.setMemberId(id);
	   
	   CartAddService svc = new CartAddServiceImpl();
	   Map<String,Object> map = new HashMap<>();
	   
	   System.out.println(svc.cartCheck(cart));
	   System.out.println(svc.purchaseCheck(cart));
	   if(svc.cartCheck(cart)> 0) {
		   map.put("retCode", "SAME");
	   }
	   else if (svc.purchaseCheck(cart) > 0) {
		   map.put("retCode", "PURCHASED");
	   }
	   else if(id!="") {
		   if(svc.cartAdd(cart)){
		   map.put("retCode", "OK");
		   map.put("retVal",cart);
		   }
	   }else {
		   map.put("retCode", "NG");
	   }
	   
	   Gson gson = new GsonBuilder().create();
	   resp.getWriter().print(gson.toJson(map));
		
	}

}
