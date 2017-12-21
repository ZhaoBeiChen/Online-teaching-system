package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Article;
import Model.Teacher;
import View.ArticleView;

import java.util.ArrayList;
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
}
