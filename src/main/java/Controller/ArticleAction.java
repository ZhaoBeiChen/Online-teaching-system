package Controller;

import Model.Article;
import Service.ArticleService;
import View.ArticleView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ArticleAction extends ActionSupport{
    private ArticleService AS;
    private Article article;
    public String Show(){
        AS.init();
        List<ArticleView> articleViews = AS.getListViews();
        ActionContext.getContext().getSession().put("articleViews",articleViews);
        AS.clear();
        return "success";
    }
    public String Add(){
        AS.init();
        AS.setAdd(article);
        AS.clear();
        return "success";
    }
    public ArticleService getAS() {
        return AS;
    }

    public void setAS(ArticleService AS) {
        this.AS = AS;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
