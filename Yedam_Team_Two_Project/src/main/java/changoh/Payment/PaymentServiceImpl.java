package changoh.Payment;

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
}
