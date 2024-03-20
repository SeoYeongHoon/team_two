package testPackage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import changoh.Payment.PaymentMapper;
import common.DataSource;
import common.Goods;
import common.Member;

public class TestClass {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		Member member = new Member();
		member.setMemberId("userId1");
		
		System.out.println(member.toString());
		List<Goods> list = mapper.getCartList(member);
		
		System.out.println(list);
	}
}
