package common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dongwon.Cart.CartControl;
import dongwon.Mypage.MypageControl;
import dongwon.QnA.QnAControl;
import dongwon.Support.SupportControl;
import changoh.Magazine.MagazineControl;
import changoh.Magazine.MagazineListControl;
import changoh.Magazine.PaymentResultControl;
import younghun.Admin.AdminControl;
import younghun.Admin.RequestControl;
import younghun.Manage.ManageControl;
import changoh.Payment.PaymentControl;
import youhwan.Company.Companyform;
import youhwan.Product.Productform;
import hyunook.Login.LoginControl;
import hyunook.Login.LoginForm;
import hyunook.Login.LogoutControl;
import hyunook.MainPage.MainPage;
import hyunook.addMember.AddMemberControl;
import hyunook.addMember.AddMemberForm;
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
		controls.put("/magazineList.do", new MagazineListControl()); //뉴스 리스트 페이지
		controls.put("/magazine.do", new MagazineControl()); //뉴스 단일 페이지
		controls.put("/payment.do", new PaymentControl());
		controls.put("/paymentResult.do", new PaymentResultControl());
		//동원
		controls.put("/mypage.do", new MypageControl());
		controls.put("/cart.do", new CartControl());
		controls.put("/qna.do", new QnAControl());
		controls.put("/support.do", new SupportControl());
		//현욱
        //메인페이지
		controls.put("/main.do", new MainPage());
		//로그인
		controls.put("/loginForm.do", new LoginForm());
		controls.put("/login.do", new LoginControl());
		//로그아웃
		controls.put("/logout.do", new LogoutControl());
		//회원가입
		controls.put("/addMemberForm.do", new AddMemberForm());
		controls.put("/addMember.do",new AddMemberControl());
		
		//유환
		controls.put("/product.do", new Productform()); // 상세페이지
		controls.put("/company.do", new Companyform()); // 회사
		
		//영훈
		controls.put("/admin.do", new AdminControl());
		controls.put("/request.do", new RequestControl());	// 관리자 페이지에 등록된 유저 요청건의 확인 버튼 클릭 시 이동되는 페이지
		controls.put("/management.do", new ManageControl()); // 개인 판매자용 상품 관리 페이지
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
