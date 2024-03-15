package common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import younghun.Admin.AdminControl;
import younghun.Admin.RequestControl;
import changoh.Payment.PaymentControl;
import dongwon.Control.MypageControl;

public class MainController extends HttpServlet{
	
	Map<String, Control> controls;
	
	public MainController() {
		controls = new HashMap<String, Control>();
	}
	
	@Override
	public void init() throws ServletException {
		//실행시킬 URL.do, 요청 및 응답처리 할 클래스 => exec함수 구현
		//xx.do, xxControl()로 구현할 것
		//작성 예시 : controls.put("/test.do", new testControl());
		controls.put("/test.do", new TestControl());
		//우선은 이름으로 컨트롤 분리하고, 나중에 기능으로 묶어서 일괄 분리 한번 더 할게요~
		//창오
		controls.put("/payment.do", new PaymentControl());
		//동원
		controls.put("/mypage.do", new MypageControl());
		
		//현욱
		
		//유환
		
		//영훈
		controls.put("/admin.do", new AdminControl());
		controls.put("/request.do", new RequestControl());	// 관리자 페이지에 등록된 유저 요청건의 확인 버튼 클릭 시 이동되는 페이지
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service 실행");
		
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		
		Control control = controls.get(path);
		control.exec(req,  resp); //요점 url에 따른 실행컨트롤을 호출
	}
}
