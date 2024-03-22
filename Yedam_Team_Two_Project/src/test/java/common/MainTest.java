package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import changoh.Magazine.Magazine;
import changoh.Magazine.MagazineMapper;
import changoh.Payment.PaymentMapper;
import changoh.Payment.PurchaseDetail;
import changoh.Payment.PurchaseHistory;

public class MainTest {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		PurchaseHistory newPh = new PurchaseHistory();
		newPh.setPrice(1000);
		newPh.setpId("1");
		newPh.setMemberId("userId1");
		
		PurchaseDetail pd = new PurchaseDetail();
		pd.setPId("1");
		pd.setGoodsId(1);
		
		if (mapper.createPurchaseHistoryData(newPh)  > 0 &&
				mapper.createPurchaseDetailData(pd) > 0) {
			System.out.println("추가 성공");
		}
	}
}
