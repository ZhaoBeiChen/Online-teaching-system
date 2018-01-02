package Controller;

import Model.Selected;
import Model.Teacher;
import Service.OfferedService;
import Service.SelectedService;
import View.SelectedView;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class SelectedAction extends ActionSupport{
    private int id;
    private SelectedService selectedService;
    private OfferedService offeredService;
    private int classid = -1;
    private Selected selected;
    public String Show(){
        selectedService.init();
        List<SelectedView> selectedViews = selectedService.getListViews("",classid);
        ActionContext.getContext().getSession().put("selectedViews",selectedViews);
        selectedService.clear();
        classid = -1;
        return "success";
    }
    public String Add(){
        selectedService.init();
        selectedService.setAdd(selected);
        selectedService.clear();
        return "success";
    }
    public String Delete(){
        selectedService.init();
        Selected selected1 = selectedService.getById(Selected.class,id);
        selectedService.delete(selected1);
        selectedService.clear();
        return "success";
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
    }

    public Selected getSelected() {
        return selected;
    }

    public void setSelected(Selected selected) {
        this.selected = selected;
    }
}
