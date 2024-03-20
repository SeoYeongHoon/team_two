package common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import changoh.Magazine.MagazineControl;
import changoh.Magazine.MagazineListControl;
import changoh.Payment.PaymentControl;
import changoh.Payment.PaymentResultControl;
import dongwon.Cart.CartControl;
import dongwon.Mypage.MypageControl;
import dongwon.QnA.QnAControl;
import dongwon.Support.SupportControl;
import hyunook.AddMembers.AddMemberControl;
import hyunook.AddMembers.AddMemberForm;
import hyunook.AddMembers.SameEmailControl;
import hyunook.AddMembers.SameIdControl;
import hyunook.AddMembers.SameTelControl;
import hyunook.Find.SearchIdControl;
import hyunook.Find.SearchIdForm;
import hyunook.Find.SearchPwControl;
import hyunook.Find.SearchPwForm;
import hyunook.Login.LoginControl;
import hyunook.Login.LoginForm;
import hyunook.Login.LogoutControl;
import hyunook.MainPage.MainPage;
import hyunook.ProductList.PrivateListControl;
import hyunook.ProductList.PrivateListForm;
import youhwan.Company.Companyform;
import youhwan.Product.Productform;
import younghun.Admin.AdminControl;
import younghun.Admin.RequestControl;
import younghun.Manage.ManageControl;
import younghun.Manage.ManageForm;

public class MainController extends HttpServlet {

	Map<String, Control> controls;

	public MainController() {
		controls = new HashMap<String, Control>();
	}

	@Override
	public void init() throws ServletException {
		// 실행시킬 URL.do, 요청 및 응답처리 할 클래스 => exec함수 구현
		// xx.do, xxControl()로 구현할 것
		// 작성 예시 : controls.put("/test.do", new testControl());
		controls.put("/test.do", new TestControl());
		// 우선은 이름으로 컨트롤 분리하고, 나중에 기능으로 묶어서 일괄 분리 한번 더 할게요~

		// 창오
		controls.put("/magazineList.do", new MagazineListControl()); // 뉴스 리스트 페이지
		controls.put("/magazine.do", new MagazineControl()); // 뉴스 단일 페이지
		controls.put("/payment.do", new PaymentControl());
		controls.put("/paymentResult.do", new PaymentResultControl());
		// 동원
		controls.put("/mypage.do", new MypageControl());
		controls.put("/cart.do", new CartControl());
		controls.put("/qna.do", new QnAControl());
		controls.put("/support.do", new SupportControl());
		// 현욱
		controls.put("/main.do", new MainPage()); // 메인페이지
		controls.put("/loginForm.do", new LoginForm());// 로그인
		controls.put("/login.do", new LoginControl());
		controls.put("/logout.do", new LogoutControl());// 로그아웃
		controls.put("/addMemberForm.do", new AddMemberForm()); // 회원가입
		controls.put("/addMember.do", new AddMemberControl());
		controls.put("/sameId.do", new SameIdControl());
		controls.put("/sameTel.do", new SameTelControl());
		controls.put("/sameEmail.do", new SameEmailControl());
		controls.put("/searchIdForm.do", new SearchIdForm());// 아이디조회 폼
		controls.put("/searchPwForm.do", new SearchPwForm());// 비밀번호조회 폼
		controls.put("/seachIdControl.do", new SearchIdControl());// 아이디조회 컨트롤
		controls.put("/seachPwControl.do", new SearchPwControl());// 비밀번호조회 컨트롤
		controls.put("/privateListForm.do", new PrivateListForm());// 개인상품 리스트
		controls.put("/privateListControl.do", new PrivateListControl());// 개인상품 리스트 컨트롤

		// 유환
		controls.put("/product.do", new Productform()); // 상세페이지
		controls.put("/company.do", new Companyform()); // 회사

		// 영훈
		controls.put("/admin.do", new AdminControl());
		controls.put("/request.do", new RequestControl()); // 관리자 페이지에 등록된 유저 요청건의 확인 버튼 클릭 시 이동되는 페이지
		controls.put("/management.do", new ManageControl()); // 개인 판매자용 상품 관리 페이지
		controls.put("/manageForm.do", new ManageForm());
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
