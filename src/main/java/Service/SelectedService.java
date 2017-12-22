package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.*;
import Model.Class;
import View.OfferedView;
import View.SelectedView;
import com.opensymphony.xwork2.ActionContext;

import java.util.ArrayList;
import java.util.List;

public class SelectedService  extends BaseServiceImpl<Selected>{
    public SelectedService(){
        BaseDAO<Selected> dao = new BaseDAOImpl<Selected>();
        super.setDao(dao);
    }

    public List<SelectedView> getListViews() {
        List<Selected> selectedList = null;
        String usertype = (String) ActionContext.getContext().getSession().get("usertype");
        if(usertype.equals("student")){
            Student student = (Student) ActionContext.getContext().getSession().get("user");
            selectedList = getBySQL("from Selected where classid="+student.getClassid());
        }
        else {
            selectedList = getBySQL("from Selected");
        }
        List<SelectedView> selectedViews = new ArrayList<SelectedView>();
        for(Selected s : selectedList){
            Class class1 = (Class) get(Class.class,s.getClassid());
            Offered offered = (Offered) get(Offered.class,s.getOfferedid());
            Course course = (Course) get(Course.class,offered.getCourseid());
            Teacher teacher = (Teacher) get(Teacher.class,offered.getTeacherid());
            SelectedView view = new SelectedView();
            view.setId(s.getId());
            view.setClass1(class1);
            view.setOffered(offered);
            selectedViews.add(view);
        }
        return selectedViews;
    }

}
