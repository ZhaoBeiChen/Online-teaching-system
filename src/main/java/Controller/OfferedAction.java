package Controller;

import Model.Offered;
import Service.OfferedService;
import Service.SelectedService;
import View.JSONOfferedView;
import View.OfferedView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class OfferedAction extends ActionSupport {
    private int id;
    private OfferedService offeredService;
    private SelectedService selectedService;
    private int courseid = -1;
    private List<JSONOfferedView> offeredNames;
    private Offered offered;
    public String Show(){
        offeredService.init();
        List<OfferedView> offeredViews = offeredService.getListViews("",courseid);
        ActionContext.getContext().getSession().put("offeredViews",offeredViews);
        offeredService.clear();
        return "success";
    }
    public String Add(){
        offeredService.init();
        offeredService.setAdd(offered);
        offeredService.clear();
        return "success";
    }
    public String Delete(){
        offeredService.init();
        selectedService.init();
        Offered offered1 = offeredService.getById(Offered.class,id);
        selectedService.execute("delete from Selected where offeredid="+id);
        offeredService.delete(offered1);
        selectedService.clear();
        offeredService.clear();
        return "success";
    }
    public String JSONOffereds(){
        offeredService.init();
        offeredNames = offeredService.getNames();
        offeredService.clear();
        return "success";
    }

    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Offered getOffered() {
        return offered;
    }

    public void setOffered(Offered offered) {
        this.offered = offered;
    }

    public List<JSONOfferedView> getOfferedNames() {
        return offeredNames;
    }

    public void setOfferedNames(List<JSONOfferedView> offeredNames) {
        this.offeredNames = offeredNames;
    }

    public void setSelectedService(SelectedService selectedService) {
        this.selectedService = selectedService;
    }
}
