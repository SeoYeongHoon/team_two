package dongwon.WishList;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Control;

public class WishListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인한 회원의 위시리스트를 가져와야 하므로 세션이 필요함
		HttpSession session = req.getSession();

		//세션에서 memberId값을 얻어 옴
		String memberId = (String) session.getAttribute("memberId");
		
		//해당 memberId가 보유한 위시리스트를 가져와야 함. sql이 필요함, service를 써야 함.
		WishListService svc = new WishListServiceImpl();
		
		//원하는 바는, memberId로 WHERE 조건을 단 후 SELECT를 실행하여, 해당되는 위시리스트들을 가지고 오는 것
		List<WishGoods> wishGoodsList = svc.getWishList(memberId);
		
		//결과를 요청 객체에 담는다.
		
		//보내기 전에, 조건문을 건다. 등록한 관심상품이 없으면 메세지를 주고 마이페이지 이동
		String path = "";
		
		if (wishGoodsList != null) {
			req.setAttribute("wishGoodsList", wishGoodsList);
			path = "jsp/wishList.tiles";
		} else {
			req.setAttribute("errorMessage", "관심상품이 없습니다.");
			path = "jsp/mypage.tiles";
		}
		
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}

}
