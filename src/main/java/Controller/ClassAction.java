package Controller;

import Model.Class;
import Service.ClassService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ClassAction extends ActionSupport{
    private ClassService classService;
    private List<Class> classes;
    public String JSONClasses(){
        classService.init();
        classes = classService.getBySQL("from Class");
        classService.clear();
        return "success";
    }

    public ClassService getClassService() {
        return classService;
    }

    public void setClassService(ClassService classService) {
        this.classService = classService;
    }

    public List<Class> getClasses() {
        return classes;
    }

    public void setClasses(List<Class> classes) {
        this.classes = classes;
    }
}
