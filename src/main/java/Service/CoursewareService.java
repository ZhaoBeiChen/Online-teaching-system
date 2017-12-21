package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Courseware;
import Model.Teacher;
import View.CoursewareView;

import java.util.ArrayList;
import java.util.List;

public class CoursewareService  extends BaseServiceImpl<Courseware> {
    public CoursewareService(){
        BaseDAO<Courseware> dao = new BaseDAOImpl<Courseware>();
        super.setDao(dao);
    }
    public List<CoursewareView> getListViews() {
        List<Courseware> coursewareList = getBySQL("from Courseware");
        List<CoursewareView> coursewareViews = new ArrayList<CoursewareView>();
        for(Courseware c : coursewareList){
            Teacher teacher = (Teacher) get(Teacher.class,c.getAuthorid());
            CoursewareView view = new CoursewareView();
            view.setId(c.getId());
            view.setName(c.getName());
            view.setContent(c.getContent());
            view.setPath(c.getPath());
            view.setTeacher(teacher);
            view.setGrade(c.getGrade());
            view.setTime(c.getTime());
            coursewareViews.add(view);
        }
        return coursewareViews;
    }
}
