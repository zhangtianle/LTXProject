package ltx.service;
import org.springframework.stereotype.Service;

import ltx.DAO.UserDao;
import ltx.model.User;

@Service("userService")
public class UserService {
	
	public void regist(User user){
		UserDao userDao=new UserDao();
		userDao.regist(user);
	}
	public boolean login(User user){
		UserDao  userDao=new UserDao();
		User loginUser=userDao.login(user);
		if(loginUser!=null){
			if(loginUser.getPassword().equals(user.getPassword())){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
}
