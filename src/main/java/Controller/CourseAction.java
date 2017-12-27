package Controller;
import Model.Course;
import Service.CourseService;
import Service.OfferedService;
import View.JSONCourseView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zhudewen
 */
public class CourseAction extends ActionSupport
{
    private CourseService courseService;
    private OfferedService offeredService;
    private List<JSONCourseView> courseNames;
    public String Show()
    {
        courseService.init();
        List<Course> courseList = courseService.getListViews("");
        ActionContext.getContext().put("courseList",courseList);
        courseService.clear();
        return "success";
    }
    public String getJSON(){
        offeredService.init();
        courseNames = offeredService.getNames("");
        offeredService.clear();
        return "success";
    }

    public CourseService getCourseService() {
        return courseService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public OfferedService getOfferedService() {
        return offeredService;
    }

    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
    }

    public List<JSONCourseView> getCourseNames() {
        return courseNames;
    }

    public void setCourseNames(List<JSONCourseView> courseNames) {
        this.courseNames = courseNames;
    }

}
