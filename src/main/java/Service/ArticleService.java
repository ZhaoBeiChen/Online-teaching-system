package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Article;
import Model.Course;
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

    public List<ArticleView> getListViews(String keyword) {
        if(keyword==null){
            keyword="";
        }
        List<Article> articleList = getBySQL("from Article");
        List<ArticleView> articleViews = new ArrayList<ArticleView>();
        for(Article a : articleList){
            Teacher teacher = (Teacher) get(Teacher.class,a.getAuthorid());
            Course course = (Course) get(Course.class,a.getCourseid());
            ArticleView view = new ArticleView();
            view.setId(a.getId());
            view.setName(a.getName());
            view.setContent(a.getContent());
            view.setTeacher(teacher);
            view.setCourse(course);
            view.setGrade(a.getGrade());
            view.setTime(a.getTime());
            if(view.getName().contains(keyword) ||
                    view.getContent().contains(keyword) ||
                    view.getTeacher().getName().contains(keyword) ||
                    view.getTeacher().getEmail().contains(keyword) ||
                    view.getCourse().getName().contains(keyword) ||
                    view.getCourse().getContent().contains(keyword)){
                articleViews.add(view);
            }
        }
        return articleViews;
    }

    public boolean setAdd(Article article) {
        Teacher nowteacher = (Teacher) ActionContext.getContext().getSession().get("user");
        Course course = (Course) load(Course.class,article.getCourseid());
        Teacher teacher = (Teacher) load(Teacher.class,nowteacher.getId());
        article.setAuthorid(teacher.getId());
        article.setTeacher(teacher);
        article.setCourse(course);
        article.setGrade(new SimpleDateFormat("yyyy").format(new Date()));
        article.setTime(new Timestamp(new Date().getTime()));
        save(article);
        return true;
    }
}
