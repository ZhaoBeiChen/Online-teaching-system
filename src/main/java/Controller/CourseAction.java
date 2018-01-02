package Controller;
import Model.Course;
import Model.Offered;
import Model.Selected;
import Service.CourseService;
import Service.OfferedService;
import Service.SelectedService;
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
    private int id;
    private CourseService courseService;
    private OfferedService offeredService;
    private SelectedService selectedService;
    private List<JSONCourseView> courseNames;
    private Course course;
    public String Show()
    {
        courseService.init();
        List<Course> courseList = courseService.getListViews("");
        ActionContext.getContext().put("courseList",courseList);
        courseService.clear();
        return "success";
    }
    public String Add(){
        courseService.init();
        courseService.save(course);
        courseService.clear();
        return "success";
    }
    public String Delete(){
        courseService.init();
        offeredService.init();
        selectedService.init();
        List<Offered> offeredList = offeredService.getBySQL("from Offered where courseid="+id);
        for(Offered o : offeredList){
            selectedService.execute("delete from Selected where offeredid="+o.getId());
        }
        selectedService.clear();
        offeredService.execute("delete from Offered where courseid="+id);
        offeredService.clear();
        Course course = courseService.getById(Course.class,id);
        courseService.delete(course);
        courseService.clear();
        return "success";
    }
    public String JSONCourses(){
        courseService.init();
        courseNames = courseService.getNames("");
        courseService.clear();
        return "success";
    }


    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }


    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
    }


    public void setSelectedService(SelectedService selectedService) {
        this.selectedService = selectedService;
    }

    public List<JSONCourseView> getCourseNames() {
        return courseNames;
    }

    public void setCourseNames(List<JSONCourseView> courseNames) {
        this.courseNames = courseNames;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
