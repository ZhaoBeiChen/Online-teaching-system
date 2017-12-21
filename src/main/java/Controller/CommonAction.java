package Controller;

import Service.AdminService;
import Service.StudentService;
import Service.TeacherService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommonAction extends ActionSupport
{
    private AdminService AS;
    private TeacherService TS;
    private StudentService SS;

    private String username;
    private String password;
    public String Login(){
        SS.init();
        TS.init();
        AS.init();
        ActionContext context = ActionContext.getContext();
        if(SS.Login(context,username,password)){ }
        else if(TS.Login(context,username,password)){ }
        else if(AS.Login(context,username,password)){ }
        else{ return "fail"; }
        SS.clear();
        TS.clear();
        AS.clear();
        return "success";
    }

    public AdminService getAS() {
        return AS;
    }

    public void setAS(AdminService AS) {
        this.AS = AS;
    }

    public TeacherService getTS() {
        return TS;
    }

    public void setTS(TeacherService TS) {
        this.TS = TS;
    }

    public StudentService getSS() {
        return SS;
    }

    public void setSS(StudentService SS) {
        this.SS = SS;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
