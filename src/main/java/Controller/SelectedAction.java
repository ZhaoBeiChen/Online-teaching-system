package Controller;

import Service.SelectedService;
import View.SelectedView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class SelectedAction extends ActionSupport{
    private SelectedService SS;
    public String Show(){
        SS.init();
        List<SelectedView> selectedViews = SS.getListViews();
        ActionContext.getContext().getSession().put("selectedViews",selectedViews);
        SS.clear();
        return "success";
    }

    public SelectedService getSS() {
        return SS;
    }

    public void setSS(SelectedService SS) {
        this.SS = SS;
    }
}
