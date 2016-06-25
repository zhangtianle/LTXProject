package ltx.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ltx.model.Accessory;
import ltx.model.Pagination;
import ltx.service.IndexSercive;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DownloadController {

	
	@RequestMapping("/downloadList.do")
	public String showDownLoadList(Model map,HttpServletRequest request) {
		
		
		String pageNum=request.getParameter("pageNum");
		//pageNum初始化为1
		if(pageNum==null){
			pageNum="1";
		}
		
		
		IndexSercive indexSercive = new IndexSercive();
		//查询文件的总数
		long totalCount=indexSercive.showDownLoadList().size();
		//分页对象初始化
		Pagination page=new Pagination((int) totalCount,Integer.parseInt(pageNum));
		List<Accessory> accessoryList = indexSercive.showDownLoad(page);
		
		map.addAttribute("accessoryList", accessoryList);
		
		map.addAttribute("page", page);
		
		return "downLoad";
	}

	@RequestMapping("/downLoad.do")
	public void down(String id, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		response.setContentType("application/vnd.ms-excel");

		// ------------------模拟前台传入一个accessory对象---------------------//
		
		// ------------------------------------------------------//

		// 当前文件路径 C:\Program
		// Files\apache-tomcat-7.0.53\webapps\LTXProject\resources\file\2014-12-12\20141212190400_764.xls
		
		IndexSercive i = new IndexSercive();
		Accessory accessory = i.getAccessoryById(id);
	
		
		// 得到文件在服务器上的存储路径
		String nowPath = request.getSession().getServletContext()
				.getRealPath("/resources")
				+ "\\"
				+ "file"
				+ "\\"
				+ accessory.getUpLoadTime().toString()
				+ "\\"
				+ accessory.getFileName();
		String contextPath = request.getContextPath();// /BJSWT
		// String newFileName="独立实验课调整安排.xls";
		File file = new File(nowPath);

		// 清空response
		response.reset();

		// 设置response的Header
		response.addHeader("Content-Disposition", "attachment;filename="
				+ new String(accessory.getFileName().getBytes("utf-8"),
						"iso-8859-1")); // 转码之后下载的文件不会出现中文乱码
		response.addHeader("Content-Length", "" + file.length());

		try {
			// 以流的形式下载文件
			InputStream fis = new BufferedInputStream(new FileInputStream(
					nowPath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();

			OutputStream toClient = new BufferedOutputStream(
					response.getOutputStream());
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
