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
		
		//위시리스트 페이지는 마이페이지에서 넘어옴
		//즉 이미 로그인 되어있다는 뜻. 세션에서 id값 받아올 수 있음
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		//세션에서 id가져온 것으로 sql 실행
		WishListService svc = new WishListServiceImpl();
		List<WishGoods> wishGoodsList = svc.getWishList(memberId);
		
		//wishGoodsList가 null이면, 관심상품이 없다는 소리이므로 마이페이지로 이동시킴
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
