package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Course;
import Model.Offered;
import Model.Teacher;
import View.JSONCourseView;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;
import java.util.List;

public class CourseService extends BaseServiceImpl<Course> {
    public CourseService(){
        BaseDAO<Course> dao = new BaseDAOImpl<Course>();
        super.setDao(dao);
    }

    public List<Course> getListViews(String keyword) {
        if(keyword==null){
            keyword="";
        }
        List<Course> courseList = getBySQL("from Course  where name like '%"+keyword+"%' or content like '%"+keyword+"%'");
        return courseList;
    }
    public List<JSONCourseView> getNames(String keyword){
        if(keyword==null){
            keyword="";
        }
        List<Course> courseList = getBySQL("from Course");
        List<JSONCourseView> courseNames = null;
        String usertype = (String) ActionContext.getContext().getSession().get("usertype");
        if(usertype.equals("teacher")) {
            //Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
            courseNames = new ArrayList<JSONCourseView>();
            for (Course c : courseList) {
                    JSONCourseView item = new JSONCourseView();
                    item.setId(c.getId());
                    item.setName(c.getName());
                    courseNames.add(item);
            }
        }
        return courseNames;
    }
}
