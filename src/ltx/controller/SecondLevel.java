package ltx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ltx.model.Article;
import ltx.model.ArticleType;
import ltx.model.Pagination;
import ltx.service.SecondService;
import ltx.service.ThirdSercive;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecondLevel {

	@RequestMapping("/slist/{pId}.do")
	public String SecondChange(HttpServletRequest request, Model model,
			@PathVariable("pId") int pId) {
		if (pId < 6) {
			SecondService ss = new SecondService();
			ThirdSercive ts = new ThirdSercive();
			// 根据父id获取文章类型
			List<ArticleType> list = ss.getParentType(pId);
			// 获取文章
			List<List<Article>> aList = ss.getaArticles(list);
			// 发送给modelAndView
			model.addAttribute("theTitle", ts.getTypeName(String.valueOf(pId))
					.getTypeName());
			model.addAttribute("list", list);
			model.addAttribute("allList", aList);
		} else if (pId < 8 && pId >= 6 || pId == 9) {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			// 前台页面访问id
			request.getSession().setAttribute("typeId", pId);
			SecondService ss = new SecondService();
			ThirdSercive ts = new ThirdSercive();
			int count = ss.getCountNoSecond(pId);

			if (count == 0) {
				count = 1;
			}
			Pagination pagination = new Pagination(count,
					Integer.parseInt(pageNum));
			List<Article> list = ts.getThirdTitle(String.valueOf(pId),
					pagination);

			model.addAttribute("theTitle", ts.getTypeName(String.valueOf(pId))
					.getTypeName());
			model.addAttribute("onelist", list);
			model.addAttribute("page", pagination);

		} else if (pId == 8) {
			return "redirect:../downloadList.do";
		}

		else {
			model.addAttribute("errorMsg", "参数错误！");
		}

		return "second";
	}
}
