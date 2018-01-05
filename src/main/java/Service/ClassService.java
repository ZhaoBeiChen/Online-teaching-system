package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Class;

import java.util.List;

public class ClassService  extends BaseServiceImpl<Class> {
    public ClassService(){
        BaseDAO<Class> dao = new BaseDAOImpl<Class>();
        super.setDao(dao);
    }

    public List<Class> getList(){
        List<Class> classList = getBySQL("from Class");
        return classList;
    }

}
