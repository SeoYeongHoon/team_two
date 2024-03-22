package changoh.Payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import common.Control;
import common.Goods;
import common.Member;

public class PaymentResultControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PaymentService svc = new PaymentServiceImpl();
		
		//getParameter
		String price = req.getParameter("price");
		String pId = req.getParameter("pId");
		String jsonMember = req.getParameter("member");		
		String jsonGoods = req.getParameter("purchasedGoodsList");
		
		//주문번호 따옴표 제거
		String newPid = "";
		try {
			newPid = StringUtils.remove(pId, '"');			
		} catch (Exception e) {
			newPid = pId;
		}
		
		//Json타입은 Object타입으로 파싱
		ObjectMapper mapper = new ObjectMapper();
		Member member = mapper.readValue(jsonMember, Member.class);
		Goods[] goodsAry = mapper.readValue(jsonGoods, Goods[].class);
		
		//SQL실제 작업해주기(주문 정보 생성, 주문 상세 정보 생성)
		PurchaseHistory newPH = new PurchaseHistory();
		newPH.setPrice(Integer.parseInt(price));
		newPH.setpId(newPid);
		newPH.setMemberId(member.getMemberId());
		
		//하나의 주문 정보 속, goodsAry 에 담긴 상품 정보들을 추가시킨 상세 주문 정보 리스트들을 생성해야한다.
		boolean isCreatedPurchaseHistoryData = false;
		boolean isCreatedPurchaseDetailData = true;
		
		if (svc.createPurchaseHistoryData(newPH) > 0) {
			isCreatedPurchaseHistoryData = true;
		}
		
		for(Goods goods : goodsAry) {
			PurchaseDetail pd = new PurchaseDetail();
			pd.setpId(newPid);
			pd.setGoodsId(goods.getGoodsId());
			
			System.out.println(pd);
			if (!(svc.createPurchaseDetailData(pd) > 0)) {
				isCreatedPurchaseDetailData = false;
				break;
			}
		}
		
		//SQL에 주문 정보와 상세주문 정보 모두 올바르게 넣었다면 주문 정보 ID 를 SetAttribute하고 다음 페이지 이동
		if (isCreatedPurchaseHistoryData && isCreatedPurchaseDetailData) {
			
			String path = "jsp/downLoadMyGoods.tiles";
			req.getRequestDispatcher(path).forward(req, resp);
		}
	}
}
