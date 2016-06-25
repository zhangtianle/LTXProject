package ltx.controller;

import java.util.List;

import ltx.model.*;
import ltx.service.IndexSercive;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*The '/index' controller.*/
@Controller
public class Index {

	/**
	 * this class is the index controller. Get data from database and return
	 * data to index.jsp
	 */
	@RequestMapping("/index.do")
	public String IndexController(Model model) {
		IndexSercive is = new IndexSercive();

		List<Article> tzgg = is.getTitle("14");
		model.addAttribute("tzgg", tzgg);
		List<Article> dtxw = is.getTitle("15");
		model.addAttribute("dtxw", dtxw);
		List<Article> djdt = is.getTitle("18");
		model.addAttribute("djdt", djdt);
		List<Article> gxxyd = is.getTitle("22");
		model.addAttribute("gxxyd", gxxyd);
		List<Article> lll = is.getTitle("24");
		model.addAttribute("lll", lll);
		List<Article> bjjt = is.getTitle("6");
		model.addAttribute("bjjt", bjjt);
		List<Image> images = is.getImage();
		model.addAttribute("images", images);
		// List<Image> images = is.getImage();
		return "index";
	}
	

}
