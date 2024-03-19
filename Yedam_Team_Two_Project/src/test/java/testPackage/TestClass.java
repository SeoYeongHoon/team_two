package testPackage;

import org.apache.ibatis.session.SqlSession;

import changoh.Payment.PaymentMapper;
import common.DataSource;
import common.Goods;
import common.Member;

public class TestClass {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		Member inputMem = new Member();
		inputMem.setMemberId("userId1");
		Member foundMem = mapper.getMember(inputMem);
		System.out.println(foundMem);
		
		Goods inputGoods = new Goods();
		inputGoods.setGoodsId(1);
		Goods foundGoods = mapper.getGoods(inputGoods);
		System.out.println(foundGoods);
	}
}
