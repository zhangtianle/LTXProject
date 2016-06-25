package ltx.bg.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ltx.bg.support.SavePathCount;
import ltx.service.BgService;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class KindEditorController {
	private static final ObjectMapper objectMapper = new ObjectMapper();
    private PrintWriter writer = null;
    
    
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "file_upload.do", method = RequestMethod.POST)
    public void fileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
    	
    	//文件保存目录路径    resources是服务器存储上传图片的目录名
    	ServletContext application = request.getSession().getServletContext();
        String savePath = application.getRealPath("/") + "resources/";
        
        
        // 文件保存目录URL
        String saveUrl = request.getContextPath() + "/resources/";
        
        // 定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
 
        // 最大文件大小
        long maxSize = 10240000;
        
        response.reset();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        writer = response.getWriter();
        // writer.println(json); //想办法把map转成json
 
        if (!ServletFileUpload.isMultipartContent(request)) {
            writer.println(objectMapper.writeValueAsString(getError("请选择文件。")));
            return;
        }
        // 检查目录
        File uploadDir = new File(savePath);
        if (!uploadDir.isDirectory()) {
            writer.println(objectMapper.writeValueAsString(getError("上传目录不存在。")));
            return;
        } 
        // 检查目录写权限
        if (!uploadDir.canWrite()) {
            writer.println(objectMapper.writeValueAsString(getError("上传目录没有写权限。")));
            return;
        }
        
        String dirName = request.getParameter("dir");
        
        if (dirName == null) {
            dirName = "image";
        }
        if (!extMap.containsKey(dirName)) {
            writer.println(objectMapper.writeValueAsString(getError("目录名不正确。")));
            return;
        }
        // 创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        List items = upload.parseRequest(request);
        Iterator itr = items.iterator();
        String saveOfName;
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            String fileName = item.getName();
            saveOfName=fileName;
            if (!item.isFormField()) {
                // 检查文件大小
                if (item.getSize() > maxSize) {
                    writer.println(objectMapper.writeValueAsString(getError("上传文件大小超过限制。")));
                    return;
                }
                // 检查扩展名
                String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                if (!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)) {
                    writer.println(objectMapper.writeValueAsString(getError("上传文件扩展名是不允许的扩展名。\n只允许"
                            + extMap.get(dirName) + "格式。")));
                    return;
                }
                String newFileName=null;
                if (Arrays.<String>asList(extMap.get("image").split(",")).contains(fileExt)) {
                	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                	newFileName =df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
                }else{
                	newFileName =saveOfName;
                }
                
                //String newFileName =saveOfName;
                //SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                
                // String newFileName =df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
               
                try {
                	
                    File uploadedFile = new File(savePath, newFileName);
                    item.write(uploadedFile);
                    
                } catch (Exception e) {
                    writer.println(objectMapper.writeValueAsString(getError("上传文件失败。")));
                }
 
                Map<String, Object> msg_file = new HashMap<String, Object>();
                msg_file.put("error", 0);
                msg_file.put("url", saveUrl + newFileName);
                msg_file.put("origin_name", saveOfName);
                //调用辅助类SavePathCount记录插入的图片数
                int index=SavePathCount.getIndex();
                //将图片的路径、文件名装载在session上
                request.getSession().setAttribute("savePath"+String.valueOf(index), saveUrl + newFileName);
                request.getSession().setAttribute("fileName"+String.valueOf(index), saveOfName);
                
                //每完成一个文件的上传，index+1
                SavePathCount.addSavePath();
                writer.println(objectMapper.writeValueAsString(msg_file));
                return;
            }
        }
        return;
    }
    private Map<String, Object> getError(String message) {
        Map<String, Object> msg = new HashMap<String, Object>();
        msg.put("error", 1);
        msg.put("message", message);
        return msg;
    }
    
    //独用于文件上传
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "upLoad.do", method = RequestMethod.POST)
    public void upLoad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
    	BgService bgService=new BgService();
    	//文件保存目录路径    resources是服务器存储上传文件的目录名
    	ServletContext application = request.getSession().getServletContext();
        String savePath = application.getRealPath("/") + "resources/";
        
        // 文件保存目录URL
        String saveUrl = request.getContextPath() + "/resources/";
        
        // 定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
        // 最大文件大小
        long maxSize = 10240000;
        
        response.reset();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        writer = response.getWriter();
        // writer.println(json); //想办法把map转成json
 
        if (!ServletFileUpload.isMultipartContent(request)) {
            writer.println(objectMapper.writeValueAsString(getError("请选择文件。")));
            return;
        }
        // 检查目录
        File uploadDir = new File(savePath);
        if (!uploadDir.isDirectory()) {
            writer.println(objectMapper.writeValueAsString(getError("上传目录不存在。")));
            return;
        } 
        // 检查目录写权限
        if (!uploadDir.canWrite()) {
            writer.println(objectMapper.writeValueAsString(getError("上传目录没有写权限。")));
            return;
        }
        
        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "file";
        }
        if (!extMap.containsKey(dirName)) {
            writer.println(objectMapper.writeValueAsString(getError("目录名不正确。")));
            return;
        }
        // 创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        List items = upload.parseRequest(request);
        Iterator itr = items.iterator();
        String newFileName=null;
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            String fileName = item.getName();
            newFileName=fileName;
            if (!item.isFormField()) {
                // 检查文件大小
                if (item.getSize() > maxSize) {
                    writer.println(objectMapper.writeValueAsString(getError("上传文件大小超过限制。")));
                    return;
                }
                // 检查扩展名
                String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                if (!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)) {
                    writer.println(objectMapper.writeValueAsString(getError("上传文件扩展名是不允许的扩展名。\n只允许"
                            + extMap.get(dirName) + "格式。")));
                    return;
                }
                //SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                //String newFileName =
                //          df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
                try {
                    File uploadedFile = new File(savePath, newFileName);
                    item.write(uploadedFile);
                    
                } catch (Exception e) {
                    writer.println(objectMapper.writeValueAsString(getError("上传文件失败。")));
                }
                String filePath=saveUrl + newFileName;
                bgService.upLoadForFile(filePath,newFileName);
                Map<String, Object> msg_file = new HashMap<String, Object>();
                msg_file.put("error", 0);
                msg_file.put("url", saveUrl + newFileName);
                msg_file.put("origin_name", newFileName);
                writer.println(objectMapper.writeValueAsString(msg_file));
                return;
            }
        }
        return;
    }
    
}
