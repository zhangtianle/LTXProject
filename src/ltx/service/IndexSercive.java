package ltx.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ltx.DAO.ArticleDAO;
import ltx.model.Accessory;
import ltx.model.Article;
import ltx.model.ArticleMapper;
import ltx.model.Image;
import ltx.model.Pagination;
import ltx.tool.Helper;

public class IndexSercive {

	public List<Article> getTitle(String articleType) {
		ArticleDAO articleDAO = new ArticleDAO();
		List<Article> list = articleDAO.getTitle(articleType);
		return list;
	}

	public List<Image> getImage() {
		ArticleDAO ad = new ArticleDAO();
		List<Image> list = ad.getImage();
		return list;

	}
	public List<Accessory> showDownLoadList(){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.showDownLoadList();
	}
	
	
	public List<Accessory> showDownLoad(Pagination page){
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.showDownLoad(page);
	}
	
	/**
	 * 查询下载文件
	 * 
	 * @param accessory
	 * @return
	 */

	public Accessory getAccessoryById(String id) {
		

		
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.getAccessoryById(id);
		

	}
	
	
	// 图片形式未定
	// public List<Image> getImage() {
	// }
}