package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Teacher;
import View.TeacherView;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;
import java.util.List;

public class TeacherService extends BaseServiceImpl<Teacher> {

    public TeacherService(){
        BaseDAO<Teacher> dao = new BaseDAOImpl<Teacher>();
        super.setDao(dao);
    }

    public boolean Login(ActionContext context, String username, String password) {
        Teacher teacher = get("from Teacher where name='"+username+"' and password='"+password+"'");
        if(teacher != null){
            context.getSession().put("user",teacher);
            context.getSession().put("username",username);
            context.getSession().put("usertype","teacher");
            context.getSession().put("useremail",teacher.getEmail());
            return true;
        }
        else{
            return false;
        }
    }

    public List<TeacherView> getListViews() {
        List<TeacherView> teacherViews = new ArrayList<TeacherView>();
        List<Teacher> teachers = getBySQL("from Teacher");
        for(Teacher t : teachers){
            TeacherView view = new TeacherView();
            view.setId(t.getId());
            view.setName(t.getName());
            view.setEmail(t.getEmail());
            teacherViews.add(view);
        }
        return teacherViews;
    }
}
