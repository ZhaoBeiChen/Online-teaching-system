package Controller;

import Service.TeacherService;
import View.TeacherView;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class TeacherAction extends ActionSupport
{
    private TeacherService teacherService;
    private List<TeacherView> teacherNames;
    public String JSONTeachers(){
        teacherService.init();
        teacherNames = teacherService.getListViews();
        teacherService.clear();
        return "success";
    }

    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    public List<TeacherView> getTeacherNames() {
        return teacherNames;
    }

    public void setTeacherNames(List<TeacherView> teacherNames) {
        this.teacherNames = teacherNames;
    }
}
