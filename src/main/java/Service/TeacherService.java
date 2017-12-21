package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Teacher;
import com.opensymphony.xwork2.ActionContext;

public class TeacherService extends BaseServiceImpl<Teacher> {

    public TeacherService(){
        BaseDAO<Teacher> dao = new BaseDAOImpl<Teacher>();
        super.setDao(dao);
    }

    public boolean Login(ActionContext context, String username, String password) {
        if(get("from Student where name='"+username+"' and password='"+password+"'") != null){
            context.getSession().put("username",username);
            context.getSession().put("usertype","teacher");
            return true;
        }
        else{
            return false;
        }
    }
}
