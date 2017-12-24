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
public class CourseAction extends ActionSupport
{
    private CourseService courseService;
    public String Show()
    {
        courseService.init();
        List<Course> courseList = courseService.getListViews("");
        ActionContext.getContext().put("courseList",courseList);
        courseService.clear();
        return "success";
    }

    public CourseService getCourseService() {
        return courseService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }
}
