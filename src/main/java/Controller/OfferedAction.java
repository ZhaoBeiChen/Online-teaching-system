package Controller;

import Service.OfferedService;
import View.OfferedView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class OfferedAction extends ActionSupport {
    private OfferedService offeredService;
    private int courseid = -1;
    public String Show(){
        offeredService.init();
        List<OfferedView> offeredViews = offeredService.getListViews("",courseid);
        ActionContext.getContext().getSession().put("offeredViews",offeredViews);
        offeredService.clear();
        return "success";
    }

    public OfferedService getOfferedService() {
        return offeredService;
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
}
