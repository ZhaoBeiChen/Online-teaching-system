package Controller;

import Model.Article;
import Model.Course;
import Service.ArticleService;
import Service.CourseService;
import View.ArticleView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ArticleAction extends ActionSupport{
    private int id;
    private ArticleService articleService;
    private Article article;
    private int courseid = -1;
    private List<ArticleView> articles;
    public String Show(){
        articleService.init();
        String condition = null;
        if(courseid<=-1){
            condition = "";
        }
        else{
            condition = "where courseid="+courseid;
        }
        ActionContext.getContext().getSession().remove("articleViews");
        List<ArticleView> articleViews = articleService.getListViews("",condition);
        ActionContext.getContext().getSession().put("articleViews",articleViews);
        articleService.clear();
        courseid = -1;
        return "success";
    }
    public String Add(){
        articleService.init();
        articleService.setAdd(article);
        articleService.clear();
        return "success";
    }
    public String Delete(){
        articleService.init();
        articleService.delete(articleService.getById(Article.class,id));
        articleService.clear();
        return "success";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public List<ArticleView> getArticles() {
        return articles;
    }

    public void setArticles(List<ArticleView> articles) {
        this.articles = articles;
    }

}
