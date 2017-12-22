package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Course;
import Model.Offered;
import Model.Teacher;
import View.OfferedView;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;
import java.util.List;

public class OfferedService extends BaseServiceImpl<Offered>{
    public OfferedService(){
        BaseDAO<Offered> dao = new BaseDAOImpl<Offered>();
        super.setDao(dao);
    }

    public List<OfferedView> getListViews() {
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
            offeredViews.add(view);
        }
        return offeredViews;
    }
}
