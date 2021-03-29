package com.kh.spring.common.ckeditor.controller;

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
									   MultipartHttpServletRequest uploadedFile, @RequestParam int function ) throws Exception {
		
		System.out.println("에디터용 컨트롤러 진입 확인");
		JsonObject jsonObject = new JsonObject();
		PrintWriter writer = null;
		MultipartFile file = uploadedFile.getFile("upload");
		
		String changedName="";
		if(file!=null) {
			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
				changedName = upload.saveFile(4, true, file, request);
			}
		}
		
		writer = response.getWriter();
		jsonObject.addProperty("uploaded", 1);
		jsonObject.addProperty("fileName", file.getName());
		
		switch(function) {
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				jsonObject.addProperty("url", request.getContextPath()+"/resources/images/group_buy/ckeditor/"+changedName);				
				break;
			case 5:
				break;
			case 6:
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
