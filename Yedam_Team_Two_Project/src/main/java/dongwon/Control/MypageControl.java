package dongwon.Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Control;
import dongwon.Service.MypageService;
import dongwon.Service.MypageServiceImpl;

public class MypageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MypageService svc = new MypageServiceImpl();
		
		
	}

}
