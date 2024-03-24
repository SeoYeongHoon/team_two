package changoh.MailSend;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSendManager {
	public boolean Send(String passenger, String code) { //매개변수로 수신자이메일과 이메일 내용 넣기!
		String user = "발신자아이디@gmail.com"; //발신자 이메일 아이디
		String password = "ppts sycs cgvm zfqd"; //발신자 이메일의 앱비밀번호 입력
		
		//구글 계정 앱 비밀번호 생성법
		//구글 홈페이지 내 계정 접속 후 우측 상단 계정 설정 클릭 > 상단 검색어 입력에 "앱비밀번호" 입력 후 본인인증 거치고, 앱비밀번호 설정
		//앱 비밀번호 정의 : 외부에서 내 계정을 써야할 때, 내 계정 비밀번호를 노출하지 않고 2차로 발급받아 쓸 수 있는 임시 비밀번호
		//GitHub의 깃토큰처럼 한번 발급 받으면 다시 볼 수 없으므로 메모장에 저장해놔야함.
		
		//SMTP 서버 정보 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465); 
	    prop.put("mail.smtp.auth", "true"); 
	    prop.put("mail.smtp.ssl.enable", "true"); 
	    prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	    prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		
	    //세션 생성 및 내 계정 아이디, 비밀번호 넣기
	    Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
	    
	    //메일 전송
	    try {
	    	MimeMessage message = new MimeMessage(session);
	    	message.setFrom(new InternetAddress(user)); //발신자 주소
	    	
	    	//수신자 주소
	    	message.addRecipient(Message.RecipientType.TO, new InternetAddress(passenger));
	    	
	    	//Subject
	    	message.setSubject("임시 비밀번호 발급"); //메일 제목을 입력
	    	
	    	//Text
	    	message.setText("임시 비밀번호: " + code); //메일 내용을 입력
	    	
	    	//send the message
	    	Transport.send(message); //전송
	    	System.out.println("메일 전송 완료");
	    	return true;
	    	
	    } catch(AddressException e) {
	    	e.printStackTrace();
	    } catch(MessagingException e) {
	    	e.printStackTrace();
	    }
	    return false;
	}
}
