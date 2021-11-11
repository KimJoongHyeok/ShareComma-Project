package org.kosta.ShareCommaProject.controller;

import java.io.File;
 
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.HouseBoardDAO;
import org.kosta.ShareCommaProject.model.HouseVO;
import org.kosta.ShareCommaProject.model.ImageDAO;
import org.kosta.ShareCommaProject.model.ImageVO;
import org.kosta.ShareCommaProject.model.MemberVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


//1차 수정 사항
//1.멤버 객체의 id 받아 온다.
//2.hvo.set~ 으로 수정 ex)hvo.setImageVO(Ivo);
//3.ImageVO SQL문 수정  이후 하우스 추가후 사진추가 해보기
//4.최종테스트 후에 경로 수정해주기
public class RegisterHouseController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (request.getMethod().equals("POST") == false) {
			System.out.println("낫포스트");
			return "redirect:index.jsp";
		} else {
		//session 있을경우 
			MultipartRequest multi = null;
			HouseVO hvo=null;
			int sizeLimit = 10 * 1024 * 1024;
			//현재시간
			LocalTime now = LocalTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
			String formatedNow = now.format(formatter);
			Random ran=new Random();
			String sran=String.valueOf(ran.nextLong());
			//filename+formatedNow+ran
			MemberVO mvo=(MemberVO)session.getAttribute("mvo");
			//---------------------------------------------------			
			String savePath= "C:/kosta224/web-workspace2/ShareComma-Project/src/main/webapp/upload";			
			try {
				multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
				hvo=new HouseVO("null",multi.getParameter("name"),multi.getParameter("address"),multi.getParameter("content"),null,null,null,mvo);
				 
			} catch (Exception e) {
				e.printStackTrace();
			}
			//--------------------------------------------------------------------------------------------------------

			String filename = multi.getFilesystemName("filename");// 저장된 파일명			
			String t1=filename.substring(0,filename.lastIndexOf("."));
			String t2=filename.substring(filename.lastIndexOf("."), filename.length());
			String ssran =sran.substring(5); 
			filename=t1+formatedNow+ssran+t2;		
			
			/*
			 * 만약 filename이 없다면 파일이 없는거임. 따라서 아래 else구문의 multi 객체를 통해 orgName(원래파일명)과
			 * fileSize등을 통해 filedb에 file관련 값들을 넣어줄 필요없으므로 바로 redirect를 통해
			 * PostDetailController로 이동
			 */
			if (filename == null || filename == "") {
				return "redirect:error.jsp";
			} else {
				File file=multi.getFile("filename");
				file.renameTo(new File (savePath+"/"+t1+formatedNow+ssran+t2));
				String orgName = multi.getOriginalFileName("filename");
				long fileSize = multi.getFile("filename").length();
				HouseBoardDAO.getInstance().registHouse(hvo);
				hvo.setHouseId(HouseBoardDAO.getInstance().getHouseId());			
				
			 //---------------------------------------------------------------
				ImageDAO.getInstance().insertImage(hvo,orgName, filename, savePath, fileSize);
				ImageVO Ivo = new ImageVO();
				Ivo = ImageDAO.getInstance().getImage(hvo);
				request.setAttribute("ivo", Ivo); 
				return "redirect:HouseListController.do";
			}
		}
	}
}
