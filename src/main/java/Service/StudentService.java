package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Student;
import com.opensymphony.xwork2.ActionContext;

public class StudentService extends BaseServiceImpl<Student> {

    public StudentService(){
        BaseDAO<Student> dao = new BaseDAOImpl<Student>();
        super.setDao(dao);
    }

    public boolean Login(ActionContext context, String username, String password) {
        Student student = get("from Student where name='"+username+"' and password='"+password+"'");
        if(student != null){
            context.getSession().put("user",student);
            context.getSession().put("username",username);
            context.getSession().put("usertype","student");
            return true;
        }
        else{
            return false;
        }
    }
}
