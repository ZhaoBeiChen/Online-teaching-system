package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Class;

public class ClassService  extends BaseServiceImpl<Class> {
    public ClassService(){
        BaseDAO<Class> dao = new BaseDAOImpl<Class>();
        super.setDao(dao);
    }

}
