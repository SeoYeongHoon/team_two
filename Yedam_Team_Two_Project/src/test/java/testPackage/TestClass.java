package testPackage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import changoh.Payment.PaymentMapper;
import common.DataSource;

public class TestClass {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
	}
}
