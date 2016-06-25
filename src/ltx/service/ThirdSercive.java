package ltx.service;

import java.util.List;

import ltx.DAO.ArticleDAO;
import ltx.model.Article;
import ltx.model.ArticleType;
import ltx.model.Pagination;

public class ThirdSercive {
	
	/**
	 * 通过文章类型查询文章标题列表
	 * @param articleType 文章类型
	 * @param pageNum 当前页码
	 * @return 文章列表
	 */
	public List<Article> getThirdTitle(String articleType,Pagination page) {
		ArticleDAO articleDAO = new ArticleDAO();
		List<Article> list = articleDAO.getThirdTitle(articleType,page);
		return list;
	}
	
	/**
	 * 通过ID得到文章类别名称
	 * @param typeId
	 * @return
	 */
	public ArticleType getTypeName(String typeId) {
		ArticleDAO articleDAO = new ArticleDAO();
		ArticleType articleType = articleDAO.getTypeName(typeId);
		return articleType;
	}
	public List<ArticleType> getAllChildType(String parentId){
		ArticleDAO articleDAO = new ArticleDAO();
		List<ArticleType> childType = articleDAO.getAllChildType(parentId);
		return childType;
	}
	/**
	 * 查询父类别的类别名称
	 * @param parentId
	 * @return
	 */
	public String getParantTypeName(String parentId){
		ArticleDAO articleDAO = new ArticleDAO();
		String parentType = articleDAO.getParantTypeName(parentId);
		return parentType;
	}
	/**
	 * 通过文章类别ID查出所有符合条件的文章总数
	 * @param articleType
	 * @return
	 */
	public long getTotalCount(String articleType){
		ArticleDAO articleDAO = new ArticleDAO();
		long totalCount=articleDAO.getTotalCount(articleType);
		return totalCount;
	}
	
	/**
	 * 首页搜索框
	 * @return
	 */
	public List<Article> findArticleByTitle(String articleTitle,Pagination page){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.findArticleByTitle(articleTitle,page);
		
	}
	//搜索结果条数
	public long getTotalSearchCount(String articleTitle){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.getTotalSearchCount(articleTitle);
	}
	/**
	 * 站内搜索框
	 * @param article
	 * @return
	 */
	public List<Article> findArticleByTitle_type(Article article,Pagination page){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.findArticleByTitle_type(article,page);
	}
	//搜索结果条数
	public long getTotalSearchCount(Article article){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.getTotalSearchCount(article);
	}
}
