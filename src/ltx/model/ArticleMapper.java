package ltx.model;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ArticleMapper {
	/**
	 * 获取文章类型id by 黄扬峰
	 * 
	 * @param id
	 * @return
	 */
	public List<ArticleType> getArtivleType(int id);

	/**
	 * 根据文章的类型获取文章的内容 by 黄扬峰
	 * 
	 * @param lists
	 * @return
	 */
	public List<Article> getArticle(int id);

	/**
	 * 获取所有数据库的类型
	 * 
	 * @author Elives
	 * @return
	 */
	public List<ArticleType> getAllType();

	/**
	 * 获取首页图片
	 * 
	 * @author Elives
	 * @return
	 */
	public List<Image> getImage();

	/**
	 * 获取没有二级属性的一级属性统计数据
	 * 
	 * @param articleType
	 * @return
	 */
	public int getCountNoSecond(int articleType);

	public List<Article> getTilte(String articleType);

	/**
	 * 通过文章类型得到文章 附带分页by叶述锋
	 * 
	 * @param articleType
	 *            文章类型 ，String
	 * @return List<Article>
	 */

	public List<Article> getThirdTitle(
			@Param(value = "articleType") String articleTyp,
			@Param(value = "startPos") int startPos,
			@Param(value = "pageSize") int pageSize);

	/**
	 * 通过typeId得到typeNameby叶述锋
	 * 
	 * @param typeId
	 *            文章类型ID
	 * @return ArticleType对象
	 */
	public ArticleType getTypeName(String typeId);

	/**
	 * 通过父类别ID查询对应类别名称by叶述锋
	 * 
	 * @param parentId
	 * @return
	 */
	public String getParantTypeName(String parentId);

	public List<ArticleType> getAllChildType(String parentId);

	/**
	 * 通过类别ID查询文章标题数目 by叶述锋
	 * 
	 * @param articleType
	 * @return
	 */
	public long getTotalCount(String articleType);

	/**
	 * 首页搜索框功能，通过文章名称查询所有文章 by叶述锋
	 * 
	 * @param articleTitle
	 * @return 文章列表
	 */
	public List<Article> findArticleByTitle(
			@Param(value = "articleTitle") String articleTitle,
			@Param(value = "startPos") int startPos,
			@Param(value = "pageSize") int pageSize);

	/**
	 * 站内搜索框功能，通过文章名称以及文章类型查询文章 by 叶述锋
	 * 
	 * @param article
	 * @return 文章列表
	 */
	public List<Article> findArticleByTitle_type(
			@Param(value = "articleTitle") String articleTitle,
			@Param(value = "articleType") String articleType,
			@Param(value = "startPos") int startPos,
			@Param(value = "pageSize") int pageSize);

	/**
	 * 通过id得到文章 by 段洪源
	 * 
	 * @param articleId
	 * @return
	 */
	public Article getArticleById(String articleId);

	/**
	 * 通parentType查询文章标题数目 by 段洪源
	 * 
	 * @param parentType
	 * @return
	 */
	public int getTotalCountByParentId(String parentType);

	/**
	 * 通过父文章类型得到文章 附带分页 by 段洪源
	 * 
	 * @param articleType
	 *            文章类型 ，String
	 * @return List<Article>
	 */

	public List<Article> getAllChildTypeByParentId(
			@Param(value = "parentType") String parentType,
			@Param(value = "startPos") int startPos,
			@Param(value = "pageSize") int pageSize);

	/**
	 * 通过articleId删除文章 by 段洪源
	 * 
	 * @param articleId
	 * @return
	 */
	public void deleteArticleById(String articleId);
	/**
	 * 通过articleId删除图片 by 段洪源
	 * 
	 * @param articleId
	 * @return
	 */
	public void deleteImage(String articleId);
	/**
	 * 通过articleId删除文件 by 段洪源
	 * 
	 * @param articleId
	 * @return
	 */
	public void deleteAccessory(String articleId);

	/**
	 * 修改文章 by 段洪源
	 * 
	 * @param articleId
	 * @return
	 */
	public void updateArticleById(Article updateArticle);
	
	/**
	 * 删除文件 by 段洪源
	 * 
	 * @param id
	 * @return
	 */
	public void deleteAccessoryById(String id);

	/**
	 * 注册，测试用
	 * 
	 * @param user
	 */
	public void regist(User user);

	/**
	 * 登录时查询用户名与密码是否正确
	 * 
	 * @param username
	 * @return
	 */
	public User findByUsername(@Param("username") String username);

	/**
	 * 发布文章
	 * 
	 * @param article
	 */
	public int postArticle(Article article);

	/**
	 * 上传图片功能
	 * 
	 * @param image
	 */
	public int upLoadImage(Image image);

	/**
	 * 文件以文章的附件形式上传
	 * 
	 * @param accessory
	 * @return
	 */
	public int upLoadFile(Accessory accessory);

	/**
	 * 文件以单独形式上传
	 * 
	 * @param accessory
	 * @return
	 */
	public int upLoadForFile(Accessory accessory);

	/**
	 * 显示所有下载附件
	 * 
	 * @return
	 */
	public List<Accessory> showDownLoadList();

	/**
	 * 查询下载文件
	 * 
	 * @param accessory
	 * @return
	 */

	public Accessory getAccessoryById(String id);

	/**
	 * 显示所有下载附件（分页）
	 * 
	 * @return
	 */
	public List<Accessory> showDownLoad(
			@Param(value = "startPos") int startPos,
			@Param(value = "pageSize") int pageSize);

	/**
	 * 查询下载文件
	 * 
	 * @param accessory
	 * @return
	 */

	public Accessory downLoad(Accessory accessory);

	/**
	 * 搜索文章
	 * 
	 * @param article
	 * @return 一篇或者多篇文章
	 */
	public List<Article> findArticle(Article article);

	/**
	 * 得到搜索结果的条数/首页搜索框
	 * 
	 * @param articleTitle
	 * @return
	 */
	public long getTotalSearchCount(String articleTitle);

	/**
	 * 得到搜索结果的条数/站内搜索
	 * 
	 * @param article
	 * @return
	 */
	public long getTotalSearchCount_type(Article article);
}
