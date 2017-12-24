package Controller;

import Service.SelectedService;
import View.SelectedView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class SelectedAction extends ActionSupport{
    private SelectedService selectedService;
    public String Show(){
        selectedService.init();
        List<SelectedView> selectedViews = selectedService.getListViews("");
        ActionContext.getContext().getSession().put("selectedViews",selectedViews);
        selectedService.clear();
        return "success";
    }

    public SelectedService getSelectedService() {
        return selectedService;
    }

    public void setSelectedService(SelectedService selectedService) {
        this.selectedService = selectedService;
    }
}