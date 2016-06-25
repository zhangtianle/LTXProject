package ltx.service;

import ltx.DAO.ArticleDAO;
import ltx.model.Article;

public class FourthService {
	
	/**
	 * 业务层逻辑，根据文章id获取文章
	 * @param articleId
	 * @return 返回一篇文章
	 */
	public Article getArticleById(String articleId){
		
		ArticleDAO ad = new ArticleDAO();
		Article  article = ad.getArticleById(articleId);
		
		return article;
	}

}
