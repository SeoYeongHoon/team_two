package changoh.Download;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Goods;
import common.Member;

public class DownloadAjaxControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현재 Session의 Member정보를 토대로, 구입한 물품 내역을 Goods 타입 리스트로 내보내는 구문
		resp.setContentType("text/json;charset=utf-8");
		
		DownloadService svc = new DownloadServiceImpl();
		HttpSession session = req.getSession();
		String memberId = (String)session.getAttribute("logid");
		
		Member currentSessionMember = new Member();
		currentSessionMember.setMemberId(memberId);
		
		List<Goods> purchasedGoodsList = svc.getPurchasedGoodsList(currentSessionMember);
				
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(purchasedGoodsList);
		resp.getWriter().print(json);
	}

}
