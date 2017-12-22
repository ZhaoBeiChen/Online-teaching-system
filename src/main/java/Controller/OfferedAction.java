package Controller;

import Model.Course;
import Model.Offered;
import Model.Teacher;
import Service.CourseService;
import Service.OfferedService;
import Service.TeacherService;
import View.OfferedView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

public class OfferedAction extends ActionSupport {
    private OfferedService OS;

    public String Show(){
        OS.init();
        List<OfferedView> offeredViews = OS.getListViews();
        ActionContext.getContext().getSession().put("offeredViews",offeredViews);
        OS.clear();
        return "success";
    }

    public OfferedService getOS() {
        return OS;
    }

    public void setOS(OfferedService OS) {
        this.OS = OS;
    }
}
