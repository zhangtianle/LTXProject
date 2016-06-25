package ltx.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ltx.model.Article;
import ltx.model.ArticleType;
import ltx.model.Pagination;
import ltx.service.ThirdSercive;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ThirdLevel {

	/**
	 * 通过typeId，pageNum查询文章列表
	 * 
	 * @param typeId
	 *            文章类型ID
	 * @param pageNum
	 *            当前显示的页数（1.2.3.4...）
	 * @param map
	 * @return
	 */

	@RequestMapping("/tlist/{typeId}.do")
	public String ThirdController(@PathVariable("typeId") String typeId,
			HttpServletRequest request, ModelMap map) {
		String pageNum = request.getParameter("pageNum");
		// pageNum初始化为1
		if (pageNum == null) {
			pageNum = "1";
		}
		// 将typeId放置于session对象中
		request.getSession().setAttribute("typeId", typeId);
		ThirdSercive ts = new ThirdSercive();
		// 查询文章的总数
		long totalCount = ts.getTotalCount(typeId);

		// 分页对象初始化
		Pagination page = new Pagination((int) totalCount,
				Integer.parseInt(pageNum));

		List<Article> articleList = ts.getThirdTitle(typeId, page);

		// 得到文章类别
		ArticleType articleType = ts.getTypeName(typeId);

		// 得到文章父类别名称
		String parantType = ts.getParantTypeName(articleType.getParentType());

		// 得到父类别下的所有子类别
		List<ArticleType> childType = ts.getAllChildType(articleType
				.getParentType());
		map.addAttribute("articleList", articleList);
		map.addAttribute("parantType", parantType);
		map.addAttribute("articleType", articleType);
		map.addAttribute("page", page);
		map.addAttribute("childType", childType);
		return "third";
	}

	// 为首页搜索框准备的搜索功能
	/*@RequestMapping("/indexSearch.do")
	public String searchArticle(String articleTitle,
			HttpServletRequest request, ModelMap map) {

		String pageNum = request.getParameter("pageNum");
		// pageNum初始化为1
		if (pageNum == null) {
			pageNum = "1";
		}

		request.getSession().setAttribute("articleTitle", articleTitle);
		ThirdSercive thirdSercive = new ThirdSercive();
		List<Article> articleList = new ArrayList<Article>();
		
		long totalCount = thirdSercive.getTotalSearchCount(articleTitle);
		Pagination page = new Pagination((int) totalCount,
				Integer.parseInt(pageNum));
		articleList = thirdSercive.findArticleByTitle(articleTitle, page);
		map.addAttribute("articleList", articleList);
		map.addAttribute("page", page);
		return "searchList";
	}

	// 左下角的搜索框
	@RequestMapping("/indexsearchFromType.do")
	public String searchArticleBytype(HttpServletRequest request,
			String articleTitle, String articleType, ModelMap map) {
		String pageNum = request.getParameter("pageNum");
		// pageNum初始化为1
		if (pageNum == null) {
			pageNum = "1";
		}
		
		request.getSession().setAttribute("articleTitle", articleTitle);
		Article article = new Article();
		article.setArticleTitle(articleTitle);
		article.setArticleType(articleType);
		ThirdSercive thirdSercive = new ThirdSercive();
		List<Article> articleList = new ArrayList<Article>();
		long totalCount = thirdSercive.getTotalSearchCount(article);
		Pagination page = new Pagination((int) totalCount,
				Integer.parseInt(pageNum));
		articleList = thirdSercive.findArticleByTitle_type(article,page);
		
		map.addAttribute("articleList", articleList);
		map.addAttribute("page", page);
		return "searchList";
	}*/
	
	
	
	//考虑将两个搜索混合到同一个controller里，根据articleType是否有值调用不同的逻辑层业务
	@RequestMapping("indexSearch.do")
	public String searchArticleAll(HttpServletRequest request,
			String articleTitle, String articleType, ModelMap map) {
		String pageNum = request.getParameter("pageNum");
		// pageNum初始化为1
		if (pageNum == null) {
			pageNum = "1";
		}
		
		request.getSession().setAttribute("articleTitle", articleTitle);
		request.getSession().setAttribute("articleType", articleType);
		Article article = new Article();
		article.setArticleTitle(articleTitle);
		article.setArticleType(articleType);
		ThirdSercive thirdSercive = new ThirdSercive();
		List<Article> articleList = new ArrayList<Article>();
		if(articleType==null || articleType.length()==0){
			//articleType为空
			long totalCount = thirdSercive.getTotalSearchCount(articleTitle);
			Pagination page = new Pagination((int) totalCount,
					Integer.parseInt(pageNum));
			articleList = thirdSercive.findArticleByTitle(articleTitle, page);
			map.addAttribute("articleList", articleList);
			map.addAttribute("page", page);
			return "searchList";
			
		}else{
			//articleType有值
			long totalCount = thirdSercive.getTotalSearchCount(article);
			Pagination page = new Pagination((int) totalCount,
					Integer.parseInt(pageNum));
			articleList = thirdSercive.findArticleByTitle_type(article,page);
			map.addAttribute("articleList", articleList);
			map.addAttribute("page", page);
			map.addAttribute("articleType", article.getArticleTypeName());
			return "searchList";
		}
		
	}
}
