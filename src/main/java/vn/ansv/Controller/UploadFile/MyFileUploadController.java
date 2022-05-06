package vn.ansv.Controller.UploadFile;
 
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import vn.ansv.Controller.Form.MyUploadForm;
 
@Controller
public class MyFileUploadController {
 
   // Phương thức này được gọi mỗi lần có Submit.
   @InitBinder
   public void initBinder(WebDataBinder dataBinder) {
       Object target = dataBinder.getTarget();
       if (target == null) {
           return;
       }
       System.out.println("Target=" + target);
 
       if (target.getClass() == MyUploadForm.class) {
  
           // Đăng ký để chuyển đổi giữa các đối tượng multipart thành byte[]
           dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
       }
   }
  
   // GET: Hiển thị trang form upload
   @RequestMapping(value = "/uploadOneFile", method = RequestMethod.GET)
   public String uploadOneFileHandler(Model model) {
 
       MyUploadForm myUploadForm = new MyUploadForm();
       model.addAttribute("myUploadForm", myUploadForm);
 
       // Forward to "/WEB-INF/pages/uploadOneFile.jsp".
       return "pages/uploadOneFile";
   }
  
   // POST: Sử lý Upload
   @RequestMapping(value = "/uploadOneFile", method = RequestMethod.POST)
   public String uploadOneFileHandlerPOST(HttpServletRequest request, //
           Model model, //
           @ModelAttribute("myUploadForm") MyUploadForm myUploadForm) {
 
       return this.doUpload(request, model, myUploadForm);
 
   }
  
   // GET: Hiển thị trang form upload
   @RequestMapping(value = "/uploadMultiFile", method = RequestMethod.GET)
   public String uploadMultiFileHandler(Model model) {
 
       MyUploadForm myUploadForm = new MyUploadForm();
       model.addAttribute("myUploadForm", myUploadForm);
 
       // Forward to "/WEB-INF/pages/uploadMultiFile.jsp".
       return "pages/uploadMultiFile";
   }
  
   // POST: Sử lý Upload
   @RequestMapping(value = "/uploadMultiFile", method = RequestMethod.POST)
   public String uploadMultiFileHandlerPOST(HttpServletRequest request, //
           Model model, //
           @ModelAttribute("myUploadForm") MyUploadForm myUploadForm) {
 
       return this.doUpload(request, model, myUploadForm);
 
   }
 
   private String doUpload(HttpServletRequest request, Model model, //
           MyUploadForm myUploadForm) {
 
       String description = myUploadForm.getDescription();
       System.out.println("Description: " + description);
 
       // Thư mục gốc upload file.
       String uploadRootPath = request.getServletContext().getRealPath("upload");
       System.out.println("uploadRootPath=" + uploadRootPath);
 
       File uploadRootDir = new File(uploadRootPath);
       //
       // Tạo thư mục gốc upload nếu nó không tồn tại.
       if (!uploadRootDir.exists()) {
           uploadRootDir.mkdirs();
       }
       CommonsMultipartFile[] fileDatas = myUploadForm.getFileDatas();
       //
       List<File> uploadedFiles = new ArrayList<File>();
       for (CommonsMultipartFile fileData : fileDatas) {
 
           // Tên file gốc tại Client.
           String name = fileData.getOriginalFilename();
           System.out.println("Client File Name = " + name);
 
           if (name != null && name.length() > 0) {
               try {
                   // Tạo file tại Server.
                   File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);
 
                   // Luồng ghi dữ liệu vào file trên Server.
                   BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                   stream.write(fileData.getBytes());
                   stream.close();
                   //
                   uploadedFiles.add(serverFile);
                   System.out.println("Write file: " + serverFile);
               } catch (Exception e) {
                   System.out.println("Error Write file: " + name);
               }
           }
       }
       model.addAttribute("description", description);
       model.addAttribute("uploadedFiles", uploadedFiles);
       return "pages/uploadResult";
   }
 
}