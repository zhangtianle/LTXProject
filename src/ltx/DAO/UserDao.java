package ltx.DAO;

import org.apache.ibatis.session.SqlSession;

import ltx.model.ArticleMapper;
import ltx.model.User;
import ltx.tool.Helper;

public class UserDao {
	public void regist(User user){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			mapper.regist(user);
			session.commit();
		} finally {
			session.close();
		}
	}
	public User login(User loginUser){
		User user=new User();
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			user=mapper.findByUsername(loginUser.getUsername());
		} finally {
			session.close();
		}
		return user;
	}
}
