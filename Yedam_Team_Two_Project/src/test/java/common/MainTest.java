package common;

import org.apache.ibatis.session.SqlSession;

import changoh.Payment.PaymentMapper;

public class MainTest {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		Member mem = new Member();
		mem.setMemberId("userId01");
		Member foundMem = mapper.getMember(mem);
		
		System.out.println(foundMem.toString());
		
		Goods goods = new Goods();
		goods.setGoodsId(1);
		
	}
}
