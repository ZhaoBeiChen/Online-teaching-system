package Controller;

import Model.Teacher;
import Service.SelectedService;
import View.SelectedView;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class SelectedAction extends ActionSupport{
    private SelectedService selectedService;
    private int classid = -1;
    public String Show(){
        selectedService.init();
        List<SelectedView> selectedViews = selectedService.getListViews("",classid);
        ActionContext.getContext().getSession().put("selectedViews",selectedViews);
        selectedService.clear();
        classid = -1;
        return "success";
    }

    public SelectedService getSelectedService() {
        return selectedService;
    }

    public void setSelectedService(SelectedService selectedService) {
        this.selectedService = selectedService;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }
}
