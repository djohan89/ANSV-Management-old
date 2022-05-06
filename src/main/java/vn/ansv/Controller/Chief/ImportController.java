package vn.ansv.Controller.Chief;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller(value = "ImportController")
public class ImportController {
	@RequestMapping(value = { "/chief/fileform" }, method = RequestMethod.GET)
	public String showUploadForm () {
		return "view_upload_file/fileform";
	}
	
	@RequestMapping(value = { "/chief/uploadfile" }, method = RequestMethod.POST)
	public String fileupload (@RequestParam("profile") CommonsMultipartFile file, HttpSession s, Model m) {
		
		System.out.println("File upload handler");
		System.out.println(file.getSize());
		System.out.println(file.getContentType());
		System.out.println(file.getName());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getStorageDescription());
		byte[] data = file.getBytes();
		//we have to save this file to server...
		String path = s.getServletContext().getRealPath("/") + "assets" + File.separator + "file_import" + File.separator + file.getOriginalFilename();
		System.out.println(path);
		
		try {
			FileOutputStream fos = new FileOutputStream(path);
			
			//Tiến hành lưu file
			fos.write(data);
			fos.close();
			System.out.println("File uploaded");
			
			m.addAttribute("msg", "Uploaded successfully");
			m.addAttribute("path", path);
			m.addAttribute("filename", file.getOriginalFilename());
			
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Uploading error");
			
			m.addAttribute("msg", "Uploading error!!!");
		}
		
		return "view_upload_file/filesuccess";
	}
}
