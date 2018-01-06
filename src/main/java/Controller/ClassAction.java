package Controller;

import Model.Class;
import Model.Teacher;
import Service.ClassService;
import Service.OfferedService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ClassAction extends ActionSupport{
    private ClassService classService;
    private OfferedService offeredService;
    private Class aClass;
    private String type;
    private List<Class> classes;
    public String JSONClasses(){
        classService.init();
        if(type==null||type.equals("show")) {
            classes = classService.getBySQL("from Class");
        }
        else if (type.equals("select")){
            String usertype = (String) ActionContext.getContext().getSession().get("usertype");
            if(usertype!=null&&usertype.equals("teacher")){
                Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
                classes = classService.getBySQL("select c from Class c,Selected s,Offered o where c.id=s.classid and s.offeredid=o.id and o.teacherid="+teacher.getId());
            }
            else {
                classes = classService.getBySQL("from Class");
            }
        }
        else{
            classes = classService.getBySQL("from Class");
        }
        classService.clear();
        type = null;
        return "success";
    }

    public String getList(){
        classService.init();
        List<Class> classList = classService.getList();
        ActionContext.getContext().getSession().put("classList", classList);
        classService.clear();
        return SUCCESS;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
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

    public Class getaClass() {
        return aClass;
    }

    public void setaClass(Class aClass) {
        this.aClass = aClass;
    }

}
