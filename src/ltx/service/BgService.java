package ltx.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ltx.DAO.ArticleDAO;
import ltx.model.Accessory;
import ltx.model.Article;
import ltx.model.ArticleMapper;
import ltx.model.ArticleType;
import ltx.model.Image;
import ltx.model.Pagination;
import ltx.tool.Helper;

public class BgService {

	/**
	 * 向数据库插入文章
	 * 
	 * @param article
	 *            文章对象
	 */
	public String postArticle(Article article) {
		ArticleDAO articleDAO = new ArticleDAO();
		Date date = new Date();
		java.sql.Date createTime = new java.sql.Date(date.getTime());
		article.setCreateTime(createTime);
		return articleDAO.postArticle(article);
		
	}

	/**
	 * 通过输入条件查询文章
	 * 
	 * @param article
	 * @return 返回文章列表
	 */
	public List<Article> findArticle(Article article) {
		ArticleDAO articleDAO = new ArticleDAO();
		return articleDAO.findArticle(article);
	}
	
	/**
	 * 通过id删除文件
	 * 
	 * @param id
	 *            文件编号
	 * @return
	 */
	public void deleteAccessoryById(String id) {

		ArticleDAO a= new ArticleDAO();
		a.deleteAccessoryById(id);
	}

	/**
	 * 业务层逻辑，根据文章id删除文章
	 * 
	 * @param articleId
	 * @return
	 */
	public void deleteArticleById(String articleId) {

		ArticleDAO ad = new ArticleDAO();
		ad.deleteArticleById(articleId);

	}

	/**
	 * 业务层逻辑，修改文章
	 * 
	 * @param updateArticle
	 * @return
	 */
	public void updateArticleById(Article updateArticle) {
		
		ArticleDAO ad = new ArticleDAO();
		ad.updateArticleById(updateArticle);

	}

	/**
	 * 业务层逻辑，通过parentType获取所有文章
	 * 
	 * @param parentType
	 * @return
	 */
	public List<Article> getAllChildTypeByparentId(String parentType,
			Pagination p) {

		ArticleDAO ad = new ArticleDAO();
		return ad.getAllChildTypeByparentId(parentType, p);

	}

	/**
	 * 业务层逻辑，通过parentType获取文章数目
	 * 
	 * @param parentType
	 * @return 文章数目
	 */
	public int getTotalCountByParentId(String parentType) {
		ArticleDAO ad = new ArticleDAO();
		return ad.getTotalCountByParentId(parentType);

	}

	/**
	 * 获取文章类型的信息
	 * 
	 * @author Elives
	 * @return
	 */
	public List<ArticleType> getAllType() {
		List<ArticleType> list = new ArrayList<>();
		ArticleDAO ad = new ArticleDAO();
		list = ad.getAllType();
		return list;
	}
	/**
	 * 图片/文件上传功能，均是以文章附件的形式上传
	 * @param articleid
	 * @param savePath
	 */
	public void upLoad(String articleId,String savePath,String fileName){
		ArticleDAO articleDAO = new ArticleDAO();
        String saveExt=savePath.substring(savePath.lastIndexOf(".") + 1).toLowerCase();
		boolean flag=isImage(saveExt);
        if(flag){
			//上传的文件判断为图片时的操作,
			Image image=new Image();
			image.setArticleId(articleId);
			image.setImgUrl(savePath);
			articleDAO.upLoadImage(image);
		}else{
			//上传的文件判断为文件是的操作，由于之前已经做过判定，传到后台的数据只能是image和file两种
			Accessory accessory=new Accessory(articleId,savePath,fileName);
			Date date = new Date();
			java.sql.Date upLoadTime = new java.sql.Date(date.getTime());
			accessory.setUpLoadTime(upLoadTime);
			articleDAO.upLoadFile(accessory);
		}
		
	}
	/**
	 * 文件以单独的形式上传 
	 * @param savePath 文件在服务器上保存的位置
	 */
	public void upLoadForFile(String savePath,String fileName){
		ArticleDAO articleDAO = new ArticleDAO();
		Accessory accessory=new Accessory(savePath,fileName);
		Date date = new Date();
		java.sql.Date upLoadTime = new java.sql.Date(date.getTime());
		accessory.setUpLoadTime(upLoadTime);
		articleDAO.upLoadForFile(accessory);
	}
	
	/**
	 * 判断上传的文件为何种文件，图片或者文档
	 * @param saveExt
	 * @return true:表示上传的为图片文件
	 * 		   false:表示上传的为文档文件
	 */
	public boolean isImage(String saveExt){
		//用于判断上传的文件后缀名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		//由于KingEditor中已经有条件判定，能传入到逻辑中的文档必然为image或者file
		//所以返回结果为真则表示图片，为假则表示文档
		if((Arrays.<String>asList(extMap.get("image").split(",")).contains(saveExt))){
			return true;
		}else{
			return false;
		}
	}
}
