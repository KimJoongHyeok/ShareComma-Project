package org.kosta.ShareCommaProject.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.HouseVO;
import org.kosta.ShareCommaProject.model.ImageDAO;
import org.kosta.ShareCommaProject.model.ImageVO;

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
//		HttpSession session = request.getSession(false);
//		if (request.getMethod().equals("POST") == false) {
//			System.out.println("낫포스트");
//			return "redirect:index.jsp";
//		} else {
		//session 있을경우 
			MultipartRequest multi = null;
			int sizeLimit = 10 * 1024 * 1024;
			
			
			//login Session.mvo MemberVO 값받아오기 이후 수정
//			HouseVO hvo=new HouseVO("1",request.getParameter("name"),request.getParameter("address"),request.getParameter("content"),null,null,null,(MemberVO)request.getSession(false).getAttribute("mvo"));
			HouseVO hvo=new HouseVO("1",request.getParameter("name"),request.getParameter("address"),request.getParameter("content"),null,null,null,null);
			 
			System.out.println("++++++++"+hvo.getHouseAddress()+"+++++++++++++++++");//null값나옴
			//-------------------------------------------------
			
//			HouseBoardDAO.getInstance().registHouse(hvo);
			
			//---------------------------------------------------
			
			String savePath = request.getServletContext().getRealPath("upload");
				System.out.println(savePath);
			try {
				multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
				System.out.println("test 값:"+multi.getParameter("name"));
				System.out.println("file저장 실행");
				System.out.println("try문");
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

				/*
				 * inserFile메서드를 통해 filedb에 db정보들을 삽입 시킴.
				 */
			 
				ImageDAO.getInstance().insertImage(hvo,orgName, filename, savePath, fileSize);
				System.out.println("upload완료");
				// filedb 모두 조회.
				// ArrayList<ImageVO> list = ImageDAO.getInstance().getAllFile();

				/*
				 * fvo 객체 만들고 ImageDAO.getFile(postNo, filename) 메서드로 저장한 파일명에 해당하는 정보들을 조회한뒤 있으면
				 * fvo객체에 넣어줌. 넣어주는 이유는 아래 return값을 통한 page 이동시 redirect로 이동해서 이동한 Controller or
				 * jsp 에서는 request 를 할 수 없음. 따라서 쿼리스트링으로 fvo값을 return값에 넣어줌.
				 */
				ImageVO Ivo = new ImageVO();
				Ivo = ImageDAO.getInstance().getImage(hvo);
				
				File file = multi.getFile("filename");
				System.out.println(file);
				System.out.println("***********************");
				
				System.out.println("**이상확인*********************");
				System.out.println("filePath:"+Ivo.getFilePath().toString());//file Path확인
				System.out.println("fileName:"+Ivo.getFileName().toString());//file Path확인
				//System.out.println("fileSize:"+Ivo.getFileSize().toString());//file Path확인
				System.out.println("fileOrgName:"+Ivo.getOrgName().toString());//file Path확인
				System.out.println("***********************");
				
				request.setAttribute("ivo", Ivo);//redirect시 쿼리스트링 이용해야댐 중요 x1000

//				return "redirect:"+contr+"Controller.do?postNo="+pvo.getPostNo()+"&fileName="+Ivo.getFileName();
				
				
//				이후 경로 수정 
				return "test-ljm.jsp";
//				return "redirect:fileout.jsp";//->request값 전달 불가 쿼리스트링 이용바람
//				return "redirect:fileout.jsp";//->request값 전달 불가 쿼리스트링 이용바람
			}
		}
	}
//}
