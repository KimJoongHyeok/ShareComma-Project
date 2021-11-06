package org.kosta.ShareCommaProject.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		MultipartRequest multi = null;
		int sizeLimit=10*1024*1024;
		String savePath = request.getServletContext().getRealPath("upload");
		System.out.println(savePath);
		HouseVO hvo=null;
		String id=null;
		String name=null;
		String address=null;
		String content =null;
	 
	try {
		 multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		 id=multi.getParameter("id");
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
		long fileSize = multi.getFile("filename").length();
		System.out.println(orgName + "," + filename + "," + fileSize);
		System.out.println("++++++++++++++++++");
		System.out.println(savePath);
		
		hvo=new HouseVO(id,name,address,content,null,null,null,null);

		/*
		 * updateImage 따로 updataHouse따로.
		 */
		
		ImageDAO.getInstance().updateImage(hvo,orgName, filename, savePath, fileSize);
		
		System.out.println("update image완료");
		
		HouseBoardDAO.getInstance().updateHouse(hvo);
		System.out.println("update house 완료");

//		return "redirect:"+contr+"Controller.do?postNo="+pvo.getPostNo()+"&fileName="+Ivo.getFileName();
		
		
//		이후 경로 수정 
		return "header.jsp";
//		return "redirect:fileout.jsp";//->request값 전달 불가 쿼리스트링 이용바람
//		return "redirect:fileout.jsp";//->request값 전달 불가 쿼리스트링 이용바람
	}
			
	}

}
