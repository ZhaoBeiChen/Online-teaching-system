package View;

import Model.Course;

import java.util.List;

public class SearchView {
    private String condition;
    private List<ArticleView> articleViews;
    private List<CoursewareView> coursewareViews;
    private List<Course> courses;
    private List<OfferedView> offeredViews;
    private List<SelectedView> selectedViews;

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public List<ArticleView> getArticleViews() {
        return articleViews;
    }

    public void setArticleViews(List<ArticleView> articleViews) {
        this.articleViews = articleViews;
    }

    public List<CoursewareView> getCoursewareViews() {
        return coursewareViews;
    }

    public void setCoursewareViews(List<CoursewareView> coursewareViews) {
        this.coursewareViews = coursewareViews;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<OfferedView> getOfferedViews() {
        return offeredViews;
    }

    public void setOfferedViews(List<OfferedView> offeredViews) {
        this.offeredViews = offeredViews;
    }

    public List<SelectedView> getSelectedViews() {
        return selectedViews;
    }

    public void setSelectedViews(List<SelectedView> selectedViews) {
        this.selectedViews = selectedViews;
    }
}
