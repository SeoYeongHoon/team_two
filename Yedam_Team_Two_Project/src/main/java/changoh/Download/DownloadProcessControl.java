package changoh.Download;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Control;
import common.Goods;

public class DownloadProcessControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//다운로드 할 파일 명 파라미터로 부터 불러오기
		
		String[] goodsNameAry = req.getParameterValues("goodsName");
		for(int i = 0; i < goodsNameAry.length; ++i) {
			System.out.println(goodsNameAry[i]);
		}
		
		//파일 압축하기
		String zipFile = "C:/goods.zip";
		String downloadFileName = "template";
		List<String> sourceFiles = new ArrayList<String>();
		
		for(int i = 0; i < goodsNameAry.length; ++i) {
			//서버의 실제 절대 경로 및 파일 위치
			sourceFiles.add("C:\\Users\\admin\\git\\team_two\\Yedam_Team_Two_Project\\src\\main\\webapp\\static\\img\\bg-img\\" + goodsNameAry[i]);
		}
				
		
		for(int i = 0; i < sourceFiles.size(); ++i) {
			File file = new File(sourceFiles.get(i));
			
			if (file.exists()) {
				System.out.println("파일 있음");
				System.out.println(sourceFiles.get(i));
			}
		}
		
		try {
			FileOutputStream fout = new FileOutputStream(zipFile);
			ZipOutputStream zout = new ZipOutputStream(fout);
			
			for(int i = 0; i < sourceFiles.size(); ++i) {
				//본래 파일명 유지. 경로 제외 파일 압축을 위해 new File로
				ZipEntry zipEntry = new ZipEntry(new File(sourceFiles.get(i)).getName());
				zout.putNextEntry(zipEntry);
				
				FileInputStream fin = new FileInputStream(sourceFiles.get(i));
				byte[] buffer = new byte[1024];
				int length;
				
				//input file을 1024바이트로 읽음, zip stream에 읽은 바이트를 씀
				while((length = fin.read(buffer)) > 0) {
					zout.write(buffer, 0, length);
				}
				
				zout.closeEntry();
				fin.close();
			}
			zout.close();
			System.out.println("압축완료");
			
			//파일 다운하기
			resp.setContentType("application/zip");
			resp.addHeader("Content-Disposition", "attachment; filename=" + downloadFileName + ".zip");
			
			FileInputStream fis = new FileInputStream(zipFile);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = resp.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);
			
			byte[] data = new byte[2048];
			int input = 0;
			
			while((input=bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}
			System.out.println("다운완료");
			
			
			if (bos != null) bos.close();
			if (bis != null) bis.close();
			if (so != null) so.close();
			if (fis != null) fis.close();
			
			
		} catch (IOException ioe) {
			System.out.println(ioe);
		}
		
		return;
	}
}
