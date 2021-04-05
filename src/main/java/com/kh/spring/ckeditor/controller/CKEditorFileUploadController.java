package com.kh.spring.ckeditor.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.kh.spring.common.exception.CommonException;
import com.kh.spring.common.upload.Upload;

@Controller
@RequestMapping("/ckeditor")
public class CKEditorFileUploadController {
	
	@Autowired
	Upload upload;
	
	//CKEditor을 사용해서, textarea 본문에 업로드할 이미지 관련 요청을 처리
	@PostMapping("/upload.ck")
	@ResponseBody
	public String uploadFileOnCKEditor(HttpServletRequest request, HttpServletResponse response, 
									   MultipartHttpServletRequest uploadedFile, @RequestParam int function) throws Exception {

		JsonObject jsonObject = new JsonObject();
		PrintWriter writer = null;
		MultipartFile file = uploadedFile.getFile("upload");
		
		String changedName="";
		//changedName1,2,3,7,8,9 -> 순서는 패션,푸드,하우징,패션 사진, 푸드 사진, 하우징 사진 
		//10은 공지사항
		String changedName1="";
		String changedName2="";
		String changedName3="";
		String changedName7="";
		String changedName8="";
		String changedName9="";
		String changedName10 = "";
		
		if(file!=null) {
			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
				changedName = upload.saveFile(4, true, file, request);
				changedName1 = upload.saveFile(1, true, file, request);
				changedName2 = upload.saveFile(2, true, file, request);
				changedName3 = upload.saveFile(3, true, file, request);
				changedName7 = upload.saveFile(7, true, file, request);
				changedName8 = upload.saveFile(8, true, file, request);
				changedName9 = upload.saveFile(9, true, file, request);
				changedName10 = upload.saveFile(10, true, file, request);
							
			}
		}
		
		writer = response.getWriter();
		jsonObject.addProperty("uploaded", 1);
		jsonObject.addProperty("fileName", file.getName());
		
		switch(function) {
			case 1:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_fashion/ckeditor/"+changedName1);								
				break;
			case 2:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_food/ckeditor/"+changedName2);								
				break;
			case 3:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_housing/ckeditor/"+changedName3);								
				break;
			case 4:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/group_buy/ckeditor/"+changedName);				
				break;
			case 5:
				break;
			case 6:
				break;
			case 7:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_fashionP/ckeditor/"+changedName7);								
				break;
			case 8:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_foodP/ckeditor/"+changedName8);								
				break;
			case 9:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_housingP/ckeditor/"+changedName9);								
				break;
			case 10:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/notice/ckeditor/"+changedName10);								
				break;
				
			default:
				throw new CommonException("Invalid Function Number");
		}
		
		writer.println(jsonObject);
		if(writer!= null) {
			writer.close();
		}
		
		return "";
	}

}
