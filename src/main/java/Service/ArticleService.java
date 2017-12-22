package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Article;
import Model.Teacher;
import View.ArticleView;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ArticleService  extends BaseServiceImpl<Article>{
    public ArticleService(){
        BaseDAO<Article> dao = new BaseDAOImpl<Article>();
        super.setDao(dao);
    }

    public List<ArticleView> getListViews() {
        List<Article> articleList = getBySQL("from Article");
        List<ArticleView> articleViews = new ArrayList<ArticleView>();
        for(Article a : articleList){
            Teacher teacher = (Teacher) get(Teacher.class,a.getAuthorid());
            ArticleView view = new ArticleView();
            view.setId(a.getId());
            view.setName(a.getName());
            view.setContent(a.getContent());
            view.setTeacher(teacher);
            view.setGrade(a.getGrade());
            view.setTime(a.getTime());
            articleViews.add(view);
        }
        return articleViews;
    }

    public boolean setAdd(Article article) {
        Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
        Article a = new Article();
        a.setName(article.getName());
        a.setContent(article.getContent());
        a.setAuthorid(teacher.getId());
        a.setTeacher(teacher);
        a.setGrade(new SimpleDateFormat("yyyy").format(new Date()));
        a.setTime(new Timestamp(new Date().getTime()));
        save(a);
        return true;
    }
}
