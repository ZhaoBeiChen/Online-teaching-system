package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Course;
import Model.Offered;
import Model.Teacher;
import View.JSONCourseView;
import View.OfferedView;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;
import java.util.List;

public class OfferedService extends BaseServiceImpl<Offered>{
    public OfferedService(){
        BaseDAO<Offered> dao = new BaseDAOImpl<Offered>();
        super.setDao(dao);
    }

    public List<OfferedView> getListViews(String keyword, int courseid) {
        if(keyword==null){
            keyword="";
        }
        List<Offered> offeredList = getBySQL("from Offered");
        List<OfferedView> offeredViews = new ArrayList<OfferedView>();
        for(Offered o : offeredList){
            Course course = (Course) get(Course.class,o.getCourseid());
            Teacher teacher = (Teacher) get(Teacher.class,o.getTeacherid());
            OfferedView view = new OfferedView();
            view.setId(o.getId());
            view.setDatestart(o.getDatestart());
            view.setDateend(o.getDateend());
            view.setCourse(course);
            view.setTeacher(teacher);
            if(view.getCourse().getName().contains(keyword) ||
                    view.getCourse().getContent().contains(keyword) ||
                    view.getTeacher().getName().contains(keyword) ||
                    view.getTeacher().getEmail().contains(keyword)){
                if(courseid==-1||courseid==view.getCourse().getId()) {
                    offeredViews.add(view);
                }
            }
        }
        return offeredViews;
    }

    public List<JSONCourseView> getNames(String keyword) {
        if(keyword==null){
            keyword="";
        }
        List<Offered> offeredList = getBySQL("from Offered");
        List<JSONCourseView> courseNames = null;
        String usertype = (String) ActionContext.getContext().getSession().get("usertype");
        if(usertype.equals("teacher")) {
            Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
            courseNames = new ArrayList<JSONCourseView>();
            for (Offered o : offeredList) {
                if (o.getTeacherid() == teacher.getId()) {
                    Course course = (Course) get(Course.class, o.getCourseid());
                    JSONCourseView item = new JSONCourseView();
                    item.setId(course.getId());
                    item.setName(course.getName());
                    courseNames.add(item);
                }
            }
        }
        return courseNames;
    }
}
