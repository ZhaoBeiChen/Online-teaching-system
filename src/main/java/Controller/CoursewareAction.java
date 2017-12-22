package Controller;

import Model.Courseware;
import Service.CoursewareService;
import View.CoursewareView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class CoursewareAction extends ActionSupport{
    private CoursewareService CWS;
    private Courseware courseware;
    public String Show(){
        CWS.init();
        List<CoursewareView> coursewareViews = CWS.getListViews();
        ActionContext.getContext().getSession().put("coursewareViews",coursewareViews);
        CWS.clear();
        return "success";
    }

    public String Add(){
        CWS.init();
        CWS.setAdd(courseware);
        CWS.clear();
        return "success";
    }

    public CoursewareService getCWS() {
        return CWS;
    }

    public void setCWS(CoursewareService CWS) {
        this.CWS = CWS;
    }
}
