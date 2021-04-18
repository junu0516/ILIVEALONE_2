package com.kh.ila.common.upload;

import com.kh.ila.common.exception.CommonException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public interface Upload {
    public String saveFile(int function, boolean isCK, MultipartFile multipartFile, HttpServletRequest request);

    public void deleteFile(int function, String fileName, HttpServletRequest request);
}
