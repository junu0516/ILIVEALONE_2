package com.kh.ila.ckeditor.controller;

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
import com.kh.ila.common.exception.CommonException;
import com.kh.ila.common.upload.Upload;

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
		
		if(file!=null) {
			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
				changedName = upload.saveFile(function, true, file, request);
			}
		}
		
		writer = response.getWriter();
		jsonObject.addProperty("uploaded", 1);
		jsonObject.addProperty("fileName", file.getName());
		
		switch(function) {
			case 1:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_fashion/ckeditor/"+changedName);								
				break;
			case 2:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_food/ckeditor/"+changedName);								
				break;
			case 3:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_housing/ckeditor/"+changedName);								
				break;
			case 4:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/group_buy/ckeditor/"+changedName);				
				break;
			case 5:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/used_market/ckeditor/"+changedName);
				break;
			case 6:
				//부동산의 경우 ck에디터를 사용하지 않기 때문에 일단 pass
				break;
			case 7:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_fashionP/ckeditor/"+changedName);								
				break;
			case 8:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_foodP/ckeditor/"+changedName);								
				break;
			case 9:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/commuity_housingP/ckeditor/"+changedName);								
				break;
			case 10:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/notice/ckeditor/"+changedName);								
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
