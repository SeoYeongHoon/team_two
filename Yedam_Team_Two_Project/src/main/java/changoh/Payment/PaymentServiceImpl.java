package changoh.Payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import common.Goods;
import common.Member;

public class PaymentServiceImpl implements PaymentService{
	
	SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
	PaymentMapper mapper = session.getMapper(PaymentMapper.class);
	
	@Override
	public Member getMember(Member member) {
		return mapper.getMember(member);
	}
	@Override
	public Goods getGoods(Goods goods) {
		return mapper.getGoods(goods);
	}
	@Override
	public List<Goods> getCartList(Member member) {
		return mapper.getCartList(member);
	}
	@Override
	public int getNewPurchaseHistoryNum(Member member) {
		return mapper.getNewPurchaseHistoryNum(member);
	}
	@Override
	public int createPurchaseHistoryData(PurchaseHistory purchaseHistory) {
		return mapper.createPurchaseHistoryData(purchaseHistory);
	}
}
