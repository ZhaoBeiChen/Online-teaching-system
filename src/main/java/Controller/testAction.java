package Controller;
import Model.Course;
import Service.CourseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

/**
 *
 * @author Zhudewen
 */
public class testAction extends ActionSupport
{
    private CourseService CS;
    public String Test()
    {
        CS.init();
        List<Course> courseList = CS.getBySQL("from Course");
        ActionContext.getContext().put("courseList",courseList);
        CS.clear();
        return "success";
    }

    public CourseService getCS() {
        return CS;
    }

    public void setCS(CourseService CS) {
        this.CS = CS;
    }
}
