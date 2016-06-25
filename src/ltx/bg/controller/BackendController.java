package ltx.bg.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ltx.bg.support.SavePathCount;
import ltx.model.Accessory;
import ltx.model.Article;
import ltx.model.ArticleType;
import ltx.model.Pagination;
import ltx.model.User;
import ltx.service.BgService;
import ltx.service.FourthService;
import ltx.service.IndexSercive;
import ltx.service.ThirdSercive;
import ltx.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BackendController {

	// 跳转处理
	@RequestMapping("bglogin.do")
	public String login(Model model) {
		return "bg/login";
	}

	@RequestMapping("bghome.do")
	public String index(Model model) {
		return "bg/bgFrame";
	}

	// (测试)登陆处理
	@RequestMapping("login.do")
	public String index(@ModelAttribute User loginUser,
			HttpServletRequest request, Model model) {
		UserService userService = new UserService();
		boolean loginFlag = userService.login(loginUser);
		if (loginFlag) {
			HttpSession session = request.getSession();
			// 将登录信息存放在session中，已便验证
			session.setAttribute("userName", loginUser.getUsername());
			return "bg/bgFrame";
		} else {
			model.addAttribute("msg", "账号或密码错误,请重新登录");
			return "bg/login";
		}

	}

	@RequestMapping("doRegist.do")
	public String doRegist(Model model) {
		return "bg/regist";
	}

	// 注册处理
	@RequestMapping("regist.do")
	public String registe(@ModelAttribute User user, Model model) {
		UserService userService = new UserService();
		userService.regist(user);
		return "bg/login";
	}

	// 发布文章页面
	@RequestMapping("myform.do")
	public String myform(Model model) {
		return "bg/myForm";
	}

	// 发布文章功能
	@RequestMapping("postArticle.do")
	public String postArticle(@RequestBody Article article,
			HttpServletRequest request) {
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		BgService bgService = new BgService();
		// 完成文章的发表,文章发表完成后返回文章ID
		article.getArticleType();
		String articleId = bgService.postArticle(article);
		HttpSession session = request.getSession();
		// 得到上传图片的数量
		int index = SavePathCount.getIndex();
		for (int i = 0; i < index; i++) {
			// 将每张图片在服务器上的路径存到数据库
			String savePath = (String) session.getAttribute("savePath"
					+ String.valueOf(i));
			String fileName = (String) session.getAttribute("fileName"
					+ String.valueOf(i));
			// 判断取得的savePath是否为空
			if (savePath != null) {
				bgService.upLoad(articleId, savePath, fileName);
			}
		}
		// 完成图片路径的存储后将辅助类SavePathCount的index重置
		SavePathCount.resetIndex();
		return "bg/myForm";

	}

	// 搜索功能
	@RequestMapping("searchResult.do")
	@ResponseBody
	public Map<Object, Object> searchArticle(@RequestBody Article article) {
		BgService bgService = new BgService();
		List<Article> articleList = bgService.findArticle(article);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("Rows", articleList);
		return map;
	}

	// 从服务器得到数据(查看新闻)
	@RequestMapping("getdata/{typeId}.do")
	@ResponseBody
	public Map<Object, Object> look(String page, String pagesize,
			@PathVariable("typeId") String typeId) {
		ThirdSercive ts = new ThirdSercive();
		int totalCount = 0;
		List<Article> list = new ArrayList<Article>();

		Map<Object, Object> map = new HashMap<Object, Object>();

		// 判断是二级还是三级？
		if (Integer.parseInt(typeId) > 9 || Integer.parseInt(typeId) == 6
				|| Integer.parseInt(typeId) == 7) {
			// 三级
			// 得到typeId类型的文章总数

			totalCount = (int) ts.getTotalCount(typeId);
			// 初始化分页对象
			Pagination p = new Pagination(totalCount, Integer.parseInt(page));
			p.setPageSize(Integer.parseInt(pagesize));
			map.put("Total", totalCount);

			// 得到文章
			list = ts.getThirdTitle(typeId, p);

			for (Article article : list) {
				article.setArticleTypeName(ts.getTypeName(
						article.getArticleType()).getTypeName());
			}

			map.put("Rows", list);

		} else {

			// 二级
			// 得到typeId类型的文章总数、
			BgService bs = new BgService();
			totalCount = bs.getTotalCountByParentId(typeId);
			// 初始化分页对象
			Pagination p = new Pagination(totalCount, Integer.parseInt(page));
			p.setPageSize(Integer.parseInt(pagesize));
			// 得到文章
			list = bs.getAllChildTypeByparentId(typeId, p);

			for (Article article : list) {
				article.setArticleTypeName(ts.getTypeName(
						article.getArticleType()).getTypeName());
			}
			map.put("Total", totalCount);
			map.put("Rows", list);
		}

		return map;
	}

	// 从服务器得到文件信息
	@RequestMapping("getAccessory.do")
	@ResponseBody
	public Map<Object, Object> getAccessory(String page, String pagesize) {

		int totalCount = 0;
		IndexSercive i = new IndexSercive();
		totalCount = i.showDownLoadList().size();
		Pagination p = new Pagination(totalCount, Integer.parseInt(page));
		p.setPageSize(Integer.parseInt(pagesize));
		List<Accessory> list = new ArrayList<Accessory>();
		list = i.showDownLoad(p);
		Map<Object, Object> map = new HashMap<Object, Object>();

		map.put("Total", totalCount);

		map.put("Rows", list);

		return map;
	}
	
	
	// 删除文件
		@RequestMapping("deleteAccessory.do")
		public void deleteAccessory(String id) {

			BgService bs = new BgService();
			bs.deleteAccessoryById(id);

		}

	// 删除新闻
	@RequestMapping("deleteArticle.do")
	public void deleteArticle(String articleId) {

		BgService bs = new BgService();
		bs.deleteArticleById(articleId);

	}

	// 修改新闻
	@RequestMapping("updateArticle.do")
	@ResponseBody
	public Map<String, String> updateArticle(@RequestBody Article updateArticle,HttpServletRequest request) {

		BgService bs = new BgService();
		bs.updateArticleById(updateArticle);
		Map<String, String> map = new HashMap<String, String>();

		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		BgService bgService = new BgService();
		
		HttpSession session = request.getSession();
		// 得到上传图片的数量
		int index = SavePathCount.getIndex();
		for (int i = 0; i < index; i++) {
			// 将每张图片在服务器上的路径存到数据库
			String savePath = (String) session.getAttribute("savePath"
					+ String.valueOf(i));
			String fileName = (String) session.getAttribute("fileName"
					+ String.valueOf(i));
			// 判断取得的savePath是否为空
			if (savePath != null) {
				bgService.upLoad(updateArticle.getArticleId(), savePath, fileName);
			}
		}
		// 完成图片路径的存储后将辅助类SavePathCount的index重置
		SavePathCount.resetIndex();
		map.put("update", "修改成功！");
		return map;

	}

	// 跳转到修改新闻页面
	@RequestMapping("goUpdateArticle.do")
	public String goUpdateArticle(String articleId, Model model) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		// Map<Object, Object> map1 = new HashMap<Object, Object>();
		FourthService fs = new FourthService();
		Article a1 = fs.getArticleById(articleId);
		
		String src = a1.getArticleContext().replace('"', '\'');
		a1.setArticleContext(src);
		
		
		model.addAttribute("article", a1);
		ThirdSercive t = new ThirdSercive();
		ArticleType a = t.getTypeName(a1.getArticleType());
		List<ArticleType> list = new ArrayList<ArticleType>();

		list = t.getAllChildType(a.getParentType());

		if (a.getParentType() == null) {
			list.add(a);
			model.addAttribute("TypeNames", list);

		} else {
			list = t.getAllChildType(a.getParentType());
			model.addAttribute("TypeNames", list);
		}

		model.addAttribute("TypeNames", list);
		return "bg/updateArticle";
	}

	// 跳转到查看新闻页面
	@RequestMapping("lookArticle.do")
	public String lookArticle() {

		return "bg/lookArticle";
	}
	
	// 跳转到查看文件页面
		@RequestMapping("lookAccessory.do")
		public String lookAccessory() {

			return "bg/lookAccessory";
		}

	// 跳转到查找页面
	@RequestMapping("search.do")
	public String searchArticle() {
		return "bg/search";
	}

	/**
	 * 获取所有的文章类型
	 * 
	 * @author Elives
	 * @param response
	 */
	@RequestMapping("getAllType.do")
	@ResponseBody
	public void getAllType(HttpServletResponse response) {
		BgService bs = new BgService();
		List<ArticleType> list = bs.getAllType();
		String temp = "[";
		for (ArticleType a : list) {
			temp = temp + "{id:" + a.getArticleType() + "," + "\"" + "text"
					+ "\"" + ":" + "\"" + a.getTypeName() + "\"" + "},";
		}
		temp = temp + "]";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=utf-8");
		try {

			response.getWriter().write(temp);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 跳转回文件上传页面
	 * 
	 * @author Elives
	 * @return
	 */
	@RequestMapping("uploadFile.do")
	public String returnUpload() {
		return "bg/uploadFile";

	}
}
