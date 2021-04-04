package com.kh.spring.common.upload;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.exception.CommonException;

/*
 * 기존의 모든 컨트롤러에서 동일하게 사용되던 saveFile, deleteFile 메소드 코드의 중복을 방지하기 위한 클래스
 * 
 * */
@Component
public class Upload {
	
	/*
	 * function : 기능별로 사진이 저장될 폴더를 달리하기 위해, 일단 기능별 번호를 구분하여 각기 다른 폴더에 사진을 저장하는 처리를 진행하게 될 것
	 * 
	 * 기능별 번호
	 * 1: 패션 커뮤니티
	 * 2: 푸드 커뮤니티
	 * 3: 하우징 커뮤니티
	 * 4: 공동구매
	 * 5: 중고거래
	 * 6: 부동산
	 * 7: 패션 사진 커뮤니티
	 * 8: 푸드 사진 커뮤니티
	 * 9: 하우징 사진 커뮤니티
	 * 
	 * */
	
	public String saveFile(int function, boolean isCK, MultipartFile multipartFile, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath="";
		if(!isCK) {//ck에디터를 통해 업로드한 이미지가 아닌 경우
			
			switch(function) {
				case 1:
					savePath = resources+"\\images\\commuity_fashion\\";
					break;
				case 2:
					savePath = resources+"\\images\\commuity_food\\";
					break;
				case 3:
					savePath = resources+"\\images\\commuity_housing\\";
					break;
				case 4:
					savePath = resources+"\\images\\group_buy\\";
					break;
				case 5:
					savePath = resources+"\\images\\used_market\\";
					break;
				case 6:
					savePath = resources+"\\images\\real_estate\\";
					break;
				case 7:
					savePath = resources+"\\images\\commuity_fashionP\\";
					break;
				case 8:
					savePath = resources+"\\images\\commuity_foodP\\";
					break;
				case 9:
					savePath = resources+"\\images\\commuity_housingP\\";
					break;
					
				default:
					throw new CommonException("사진 저장 경로가 잘못되었습니다.");
			}
		}else {//ck에디터를 통해 업로드한 경우
			
			switch(function) {
				case 1:
					savePath = resources+"\\images\\commuity_fashion\\ckeditor\\";
					break;
				case 2:
					savePath = resources+"\\images\\commuity_food\\ckeditor\\";
					break;
				case 3:
					savePath = resources+"\\images\\commuity_housing\\ckeditor\\";
					break;
				case 4:
					savePath = resources+"\\images\\group_buy\\ckeditor\\";
					break;
				case 5:
					savePath = resources+"\\images\\used_market\\ckeditor\\";
					break;
				case 6:
					savePath = resources+"\\images\\real_estate\\ckeditor\\";
					break;
				case 7:
					savePath = resources+"\\images\\commuity_fashionP\\ckeditor\\";
					break;
				case 8:
					savePath = resources+"\\images\\commuity_foodP\\ckeditor\\";
					break;
				case 9:
					savePath = resources+"\\images\\commuity_housingP\\ckeditor\\";
					break;
				
				default:
					throw new CommonException("사진 저장 경로가 잘못되었습니다.");
			}			
		}
				
		String originalName = multipartFile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
		
		String ext = originalName.substring(originalName.lastIndexOf("."));
		String changedName = currentTime+ext;
		
		try {
			multipartFile.transferTo(new File(savePath+changedName));
			System.out.println("서버에 이미지 저장 완료");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 저장 오류 : " + e.getMessage());
		}
			
		return changedName;
	}
	
	public void deleteFile(int function, String fileName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath="";
		switch(function) {
			case 1:
				savePath = resources+"\\images\\commuity_fashion\\";
				break;
			case 2:
				savePath = resources+"\\images\\commuity_food\\";
				break;
			case 3:
				savePath = resources+"\\images\\commuity_housing\\";
				break;
			case 4:
				savePath = resources+"\\images\\group_buy\\";
				break;
			case 5:
				savePath = resources+"\\images\\used_market\\";
				break;
			case 6:
				savePath = resources+"\\images\\real_estate\\";
				break;
			case 7:
				savePath = resources+"\\images\\commuity_fashionP\\";
				break;
			case 8:
				savePath = resources+"\\images\\commuity_foodP\\";
				break;
			case 9:
				savePath = resources+"\\images\\commuity_housingP\\";
				break;
				
			default:
				throw new CommonException("사진 저장 경로가 잘못되었습니다.");
		}
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();	
	}

}
