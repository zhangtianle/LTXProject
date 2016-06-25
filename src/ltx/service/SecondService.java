package ltx.service;

import java.util.ArrayList;
import java.util.List;

import ltx.DAO.ArticleDAO;
import ltx.model.Article;
import ltx.model.ArticleType;

public class SecondService {
	/**
	 * 业务逻辑层获取文章类型id
	 * 
	 * @param id
	 * @return
	 */
	public List<ArticleType> getParentType(int id) {
		ArticleDAO ad = new ArticleDAO();
		List<ArticleType> list = ad.getParentType(id);
		return list;
	}

	/**
	 * 业务逻辑层获取文章
	 * 
	 * @param list
	 * @return
	 */
	public List<List<Article>> getaArticles(List<ArticleType> list) {
		ArticleDAO ad = new ArticleDAO();
		List<List<Article>> aList = new ArrayList<>();
		for (ArticleType at : list) {
			List<Article> temp = ad.getaArticles(Integer.parseInt(at
					.getArticleType()));
			aList.add(temp);
		}
		return aList;
	}

	/**
	 * 业务逻辑层获取没有二级属性的统计
	 * 
	 * @param articleType
	 * @return
	 */
	public int getCountNoSecond(int articleType) {
		ArticleDAO ad = new ArticleDAO();
		int count = ad.getCountNoSecond(articleType);
		return count;
	}
}
