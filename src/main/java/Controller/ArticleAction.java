package Controller;

import Service.ArticleService;
import View.ArticleView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ArticleAction extends ActionSupport{
    private ArticleService AS;

    public String Show(){
        AS.init();
        List<ArticleView> articleViews = AS.getListViews();
        ActionContext.getContext().getSession().put("articleViews",articleViews);
        AS.clear();
        return "success";
    }

    public ArticleService getAS() {
        return AS;
    }

    public void setAS(ArticleService AS) {
        this.AS = AS;
    }
}
