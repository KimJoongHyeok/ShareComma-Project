package org.kosta.ShareCommaProject.controller;

import java.io.File;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.HouseBoardDAO;
import org.kosta.ShareCommaProject.model.HouseVO;
import org.kosta.ShareCommaProject.model.ImageDAO;
import org.kosta.ShareCommaProject.model.ImageVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateHouseController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("게시글 삭제는 post 방식만 허용됩니다");		
		MultipartRequest multi = null;
		int sizeLimit=10*1024*1024;
		String savePath= "C:/kosta224/web-workspace2/ShareComma-Project/src/main/webapp/upload";		
		System.out.println(savePath);
		HouseVO hvo=null;
		ImageVO ivo=null;
		String id=null;
		String name=null;
		String address=null;
		String content =null;	 		 
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			id=multi.getParameter("houseId");
			name=multi.getParameter("name");
			address=multi.getParameter("address");
			content=multi.getParameter("content");
			System.out.println("test 값:"+id+name+address);

		} catch (Exception e) {
			System.out.println("에러나옴");
			e.printStackTrace();
		}
		System.out.println("세션존재");
//--------------------------------------------------------------------------------------------------------

		String filename = multi.getFilesystemName("filename");// 저장된 파일명
	/*
	 * 만약 filename이 없다면 파일이 없는거임. 따라서 아래 else구문의 multi 객체를 통해 orgName(원래파일명)과
	 * fileSize등을 통해 filedb에 file관련 값들을 넣어줄 필요없으므로 바로 redirect를 통해
	 * PostDetailController로 이동
	 */
		if (filename == null || filename == "") {
			return "redirect:error.jsp";
		} else {
			String orgName = multi.getOriginalFileName("filename");
			LocalTime now = LocalTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
			String formatedNow = now.format(formatter);
			Random ran=new Random();
			String sran=String.valueOf(ran.nextLong());
			String t1=filename.substring(0,filename.lastIndexOf("."));
			String t2=filename.substring(filename.lastIndexOf("."), filename.length());
			String ssran =sran.substring(5); 
			filename=t1+formatedNow+ssran+t2;		
			long fileSize = multi.getFile("filename").length();
			System.out.println(orgName + "," + filename + "," + fileSize);
			System.out.println("++++++++++++++++++");
			System.out.println(savePath);		
			hvo=new HouseVO(id,name,address,content,null,null,null,null);
			//기존파일 삭제
			System.out.println("test1"+hvo);
			ivo=ImageDAO.getInstance().getImage(hvo);	
			File delfile=new File(ivo.getFilePath()+ivo.getFileName());
			delfile.delete();
			System.out.println("파일삭제완료");
			File newfile=multi.getFile("filename");
			newfile.renameTo(new File (savePath+"/"+t1+formatedNow+ssran+t2));
			// updateImage 따로 updataHouse따로.		
			ImageDAO.getInstance().updateImage(hvo,orgName, filename, savePath, fileSize);
			System.out.println("update image완료");
			HouseBoardDAO.getInstance().updateHouse(hvo);
			System.out.println("update house 완료");	
	//		이후 경로 수정 
			return "HouseListController.do";
		}	
	}	 
}
