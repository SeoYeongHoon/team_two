package changoh.Magazine;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;

public class MagazineListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//JDBC작업을 통해 불러 온 Magazine 정보를 List에 담아 magazineList.jsp로 송출
		
	}

}
