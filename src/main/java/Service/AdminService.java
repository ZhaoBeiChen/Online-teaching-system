package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Admin;
import com.opensymphony.xwork2.ActionContext;

public class AdminService extends BaseServiceImpl<Admin> {

    public AdminService(){
        BaseDAO<Admin> dao = new BaseDAOImpl<Admin>();
        super.setDao(dao);
    }
    public boolean Login(ActionContext context, String username, String password) {
        if(get("from Admin where name='"+username+"' and password='"+password+"'") != null){
            context.getSession().put("username",username);
            context.getSession().put("usertype","admin");
            return true;
        }
        else{
            return false;
        }
    }
}
