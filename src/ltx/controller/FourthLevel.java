package ltx.controller;

import java.util.List;

import ltx.model.Article;
import ltx.model.ArticleType;
import ltx.service.FourthService;
import ltx.service.ThirdSercive;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/*The fourth-level page controller
 *The Third-level page controller
 *RequestMapping（"/{type}/{subtype}/{articleId}.do"）*/
@Controller

public class FourthLevel {

	@RequestMapping("/four/{aid}.do")
	public String FourthController(@PathVariable("aid") String aid, ModelMap map) {

		FourthService fs = new FourthService();
		//根据从页面接受的articleId获取文章
		Article a = fs.getArticleById(aid);
		map.addAttribute("article", a);
		//得到文章的类型名称和父类型名称
		ThirdSercive t = new ThirdSercive();
		ArticleType at = t.getTypeName(a.getArticleType());
		map.addAttribute("name", at.getTypeName());
		if(at.getParentType()!=null){
			String parentName = t.getParantTypeName(at.getParentType());
			map.addAttribute("parentName", parentName);
			//得到改父类型的所有子类型名称
			List<ArticleType> ats= t.getAllChildType(at.getParentType());
			map.addAttribute("typeNames", ats);
		}else{
			map.addAttribute("parentName", at.getTypeName());
		}
		
		return "fourthLevel";

	}
	
	@RequestMapping("four2/{type}.do")
	public String go(@PathVariable("type") String type){
		
		if(type.equals("bszl")){
			return "bszl";
		}else {
			return "bmgk";
		}		
	}

}
