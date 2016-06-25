package ltx.DAO;

import java.util.ArrayList;
import java.util.List;

import ltx.model.Accessory;
import ltx.model.Article;
import ltx.model.ArticleMapper;
import ltx.model.ArticleType;
import ltx.model.Image;
import ltx.model.Pagination;
import ltx.tool.Helper;

import org.apache.ibatis.session.SqlSession;

public class ArticleDAO {

	public List<Article> getTitle(String articleType) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			List<Article> s = mapper.getTilte(articleType);
			return s;
		} finally {
			session.close();
		}
	}

	/**
	 * 通过articleType 以及 前台传入的pageNum得到articleTitle
	 * 
	 * @param articleType
	 *            文章类型
	 * @param pageNum
	 *            当前页码
	 * @return 文章标题列表，15条数据一页
	 */
	public List<Article> getThirdTitle(String articleType, Pagination page) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			List<Article> s = mapper.getThirdTitle(articleType,
					page.getStartPos(), page.getPageSize());
			return s;
		} finally {
			session.close();
		}
	}

	/**
	 * 首页搜索框功能，通过articleTitle查询article所有内容
	 * 
	 * @param articleTitle
	 * @return
	 */
	public List<Article> findArticleByTitle(String articleTitle, Pagination page) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			List<Article> s = mapper.findArticleByTitle(articleTitle,
					page.getStartPos(), page.getPageSize());
			return s;
		} finally {
			session.close();
		}
	}

	// 查询搜索结果的总数
	public long getTotalSearchCount(String articleTitle) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			long totalCount = mapper.getTotalSearchCount(articleTitle);
			return totalCount;
		} finally {
			session.close();
		}
	}

	/**
	 * 站内搜索功能
	 * 
	 * @param article
	 * @return
	 */
	public List<Article> findArticleByTitle_type(Article article,
			Pagination page) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			List<Article> s = mapper.findArticleByTitle_type(
					article.getArticleTitle(), article.getArticleType(),
					page.getStartPos(), page.getPageSize());
			return s;
		} finally {
			session.close();
		}
	}

	// 查询搜索结果
	public long getTotalSearchCount(Article article) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			long totalCount = mapper.getTotalSearchCount_type(article);
			return totalCount;
		} finally {
			session.close();
		}
	}

	/**
	 * 查询符合条件的所有文章标题
	 * 
	 * @param articleType
	 *            标题ID
	 * @return
	 */
	public long getTotalCount(String articleType) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			long totalCount = mapper.getTotalCount(articleType);
			return totalCount;
		} finally {
			session.close();
		}
	}

	/**
	 * 通过typeId查询typeName
	 * 
	 * @param typeId
	 *            文章编号
	 * @return
	 */
	public ArticleType getTypeName(String typeId) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			ArticleType articleType = mapper.getTypeName(typeId);
			return articleType;
		} finally {
			session.close();
		}
	}

	/**
	 * 通过父类别ID查询对应类别名称
	 * 
	 * @param parentId
	 * @return
	 */
	public String getParantTypeName(String parentId) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			String parentType = mapper.getParantTypeName(parentId);
			return parentType;
		} finally {
			session.close();
		}
	}

	/**
	 * 通过父类别查询所有子类别
	 * 
	 * @param parentId
	 * @return
	 */
	public List<ArticleType> getAllChildType(String parentId) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			List<ArticleType> childType = mapper.getAllChildType(parentId);
			return childType;
		} finally {
			session.close();
		}
	}

	/**
	 * 通过articleId找到文章
	 * 
	 * @param articleId
	 *            文章编号
	 * @return 文章类型
	 */
	public Article getArticleById(String articleId) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			Article article = mapper.getArticleById(articleId);
			return article;
		} finally {
			session.close();
		}
	}

	// -----------------二级页面---------------------------------//
	/**
	 * 获取文章的类型
	 * 
	 * @param id传入的parentType的值
	 * @return
	 */
	public List<ArticleType> getParentType(int id) {
		// 存储查询到的类型编号
		List<ArticleType> lists = new ArrayList<>();
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper articleMapper = session
					.getMapper(ArticleMapper.class);
			lists = articleMapper.getArtivleType(id);
		} finally {
			session.close();
		}
		return lists;
	}

	/**
	 * 获取文章
	 * 
	 * @param list
	 *            传入一个查询到文章编号的数组
	 * @return
	 */
	public List<Article> getaArticles(int id) {
		// 存储查询到的文章
		List<Article> aList = new ArrayList<>();
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper articleMapper = session
					.getMapper(ArticleMapper.class);
			aList = articleMapper.getArticle(id);
		} finally {
			session.close();
		}
		return aList;
	}

	// -----------------后台管理---------------------------------//

	/**
	 * 通过articleId删除文章
	 * 
	 * @param articleId
	 *            文章编号
	 * @return
	 */
	public void deleteArticleById(String articleId) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			
			//图片删除
			mapper.deleteImage(articleId);
			//附件删除
			mapper.deleteAccessory(articleId);
			
			mapper.deleteArticleById(articleId);
			session.commit();

		} finally {
			session.close();
		}
	}
	
	
	/**
	 * 通过id删除文件
	 * 
	 * @param id
	 *            文件编号
	 * @return
	 */
	public void deleteAccessoryById(String id) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.deleteAccessoryById(id);
			session.commit();

		} finally {
			session.close();
		}
	}

	/**
	 * 修改文章
	 * 
	 * @param 修改文在对象
	 * 
	 * @return
	 */
	public void updateArticleById(Article updateArticle) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.updateArticleById(updateArticle);
			session.commit();

		} finally {
			session.close();
		}
	}

	/**
	 * 发布文章
	 * 
	 * @param article
	 */
	public String postArticle(Article article) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.postArticle(article);
			String articleId = article.getArticleId();
			session.commit();
			return articleId;
		} finally {
			session.close();
		}
	}

	/**
	 * 文件单独上传
	 * 
	 * @param accessory
	 */
	public void upLoadForFile(Accessory accessory) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.upLoadForFile(accessory);
			session.commit();
		} finally {
			session.close();
		}
	}

	/**
	 * 文件以附件形式上传
	 * 
	 * @param accessory
	 */
	public void upLoadFile(Accessory accessory) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.upLoadFile(accessory);
			session.commit();
		} finally {
			session.close();
		}
	}

	public List<Accessory> showDownLoadList() {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			return mapper.showDownLoadList();
		} finally {
			session.close();
		}
	}

	public List<Accessory> showDownLoad(Pagination page) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			
			return mapper.showDownLoad(page.getStartPos(), page.getPageSize());
		} finally {
			session.close();
		}
	}

	/**
	 * 上传图片
	 * 
	 * @param image
	 */
	public void upLoadImage(Image image) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.upLoadImage(image);
			session.commit();
		} finally {
			session.close();
		}
	}

	/**
	 * 后台查询文章
	 * 
	 * @param article
	 * @return 返回一篇或者多偏文章
	 */
	public List<Article> findArticle(Article article) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			return mapper.findArticle(article);
		} finally {
			session.close();
		}
	}

	/**
	 * 通过parentType 以及 前台传入的pageNum得到articleTitle
	 * 
	 * @param articleType
	 *            文章类型
	 * @param pageNum
	 *            当前页码
	 * @return 文章标题列表，15条数据一页
	 */
	public List<Article> getAllChildTypeByparentId(String parentType,
			Pagination page) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			List<Article> list = mapper.getAllChildTypeByParentId(parentType,
					page.getStartPos(), page.getPageSize());
			return list;
		} finally {
			session.close();
		}
	}

	/**
	 * 通过parentType 查询文章数量
	 * 
	 * @param parentType
	 * 
	 * 
	 * 
	 * @return 文章数目
	 */
	public int getTotalCountByParentId(String parentType) {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			int num = mapper.getTotalCountByParentId(parentType);
			return num;
		} finally {
			session.close();
		}
	}

	/**
	 * 获取所有的文章编号信息
	 * 
	 * @author Elives
	 * @return
	 */
	public List<ArticleType> getAllType() {
		// 存储查询到的类型编号
		List<ArticleType> list = new ArrayList<>();
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper articleMapper = session
					.getMapper(ArticleMapper.class);
			list = articleMapper.getAllType();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * 获取首页的图片
	 * 
	 * @author Elives
	 * @return
	 */
	public List<Image> getImage() {
		// 存储查询到的类型编号
		List<Image> list = new ArrayList<>();
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper articleMapper = session
					.getMapper(ArticleMapper.class);
			list = articleMapper.getImage();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * 获取没有二级属性的一级属性统计
	 * 
	 * @param articleType
	 * @return
	 */
	public int getCountNoSecond(int articleType) {
		SqlSession session = Helper.getSessionFactory().openSession();
		int coutNoSecond;
		try {
			ArticleMapper articleMapper = session
					.getMapper(ArticleMapper.class);
			coutNoSecond = articleMapper.getCountNoSecond(articleType);
		} finally {
			session.close();
		}
		return coutNoSecond;
	}

	/**
	 * 查询下载文件
	 * 
	 * @param accessory
	 * @return
	 */

	public Accessory getAccessoryById(String id) {
		SqlSession session = Helper.getSessionFactory().openSession();

		Accessory accessory = null;
		try {
			ArticleMapper articleMapper = session
					.getMapper(ArticleMapper.class);
			accessory = articleMapper.getAccessoryById(id);
		} finally {
			session.close();
		}
		return accessory;

	}
}
