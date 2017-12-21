package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Course;

public class CourseService extends BaseServiceImpl<Course> {
    public CourseService(){
        BaseDAO<Course> dao = new BaseDAOImpl<Course>();
        super.setDao(dao);
    }
}
