package com.example.study.service;

import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile avatarFile, String targetFolder) {
        // servletContext sẽ lấy đường dẫn tuyệt đối đến /webapp
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String fileName = "";
        try{
            byte[] bytes;
            bytes = avatarFile.getBytes();

            // nơi muốn lưu file, File.separator là dấu /
            File dir = new File(rootPath + File.separator + targetFolder);
            // nếu file chưa tồn tại thì tạo mới (mkdir được sử dụng trong linux)
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            fileName = System.currentTimeMillis() + "-" + avatarFile.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        }catch (IOException e){
            e.printStackTrace();
        }
        return fileName;
    }
}
