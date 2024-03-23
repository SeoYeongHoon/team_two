package testPackage;

import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import changoh.MailSend.MailSendManager;
import changoh.Payment.PaymentMapper;
import common.DataSource;

public class TestClass {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true); //자동 커밋
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		//랜덤 인증번호 4자리 생성
		String randomCode = "";
		for(int i = 0; i < 4; ++i) {
			int randValue = (int)(Math.random() * 10);
			randomCode += randValue;
		}
		
		MailSendManager msr = new MailSendManager();
		
		if (msr.Send("b4e109@gmail.com", randomCode)) {
			System.out.println("발송완료");
		}
		
		Scanner scn = new Scanner(System.in);
		
		String inputValue = scn.nextLine();
		
		if (inputValue.equals(randomCode)) {
			System.out.println("인증완료");
		}
	}
}
