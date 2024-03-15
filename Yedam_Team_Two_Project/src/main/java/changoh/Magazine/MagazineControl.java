package changoh.Magazine;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class MagazineControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파라미터로 들어온 Magazine의 magazineId로 해당 게시물의 자세한 정보 조회하여 
		// Magazine객체 생성하고 Magazine.jsp로 송출
	}

}
