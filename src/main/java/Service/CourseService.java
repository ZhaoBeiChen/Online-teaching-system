package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Course;

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
}
