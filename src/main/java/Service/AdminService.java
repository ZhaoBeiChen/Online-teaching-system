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
        Admin admin = get("from Admin where name='"+username+"' and password='"+password+"'");
        if(admin != null){
            context.getSession().put("user",admin);
            context.getSession().put("username",username);
            context.getSession().put("usertype","admin");
            context.getSession().put("useremail",admin.getEmail());
            return true;
        }
        else{
            return false;
        }
    }
}
