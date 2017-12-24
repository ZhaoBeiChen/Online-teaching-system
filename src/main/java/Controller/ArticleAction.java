package Controller;

import Model.Article;
import Service.ArticleService;
import View.ArticleView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ArticleAction extends ActionSupport{
    private ArticleService articleService;
    private Article article;
    public String Show(){
        articleService.init();
        List<ArticleView> articleViews = articleService.getListViews("");
        ActionContext.getContext().getSession().put("articleViews",articleViews);
        articleService.clear();
        return "success";
    }
    public String Add(){
        articleService.init();
        articleService.setAdd(article);
        articleService.clear();
        return "success";
    }
    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
