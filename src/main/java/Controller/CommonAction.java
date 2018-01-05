package Controller;

import Service.*;
import View.SearchView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommonAction extends ActionSupport
{
    private AdminService adminService;
    private TeacherService teacherService;
    private StudentService studentService;

    private ArticleService articleService;
    private CoursewareService coursewareService;
    private CourseService courseService;
    private OfferedService offeredService;
    private SelectedService selectedService;

    private String keyword;
    private String condition;

    private String username;
    private String password;

    public String Index(){
        username="student";
        password="123456";
        Login();
        if(ActionContext.getContext().getSession().get("username")!=null){
            return "success";
        }
        return "fail";
    }

    public String Login(){
        studentService.init();
        teacherService.init();
        adminService.init();
        ActionContext context = ActionContext.getContext();
        if(studentService.Login(context,username,password)){ }
        else if(teacherService.Login(context,username,password)){ }
        else if(adminService.Login(context,username,password)){ }
        else{ return "fail"; }
        studentService.clear();
        teacherService.clear();
        adminService.clear();
        return "success";
    }
    public String Logout(){
        ActionContext.getContext().getSession().remove("username");
        ActionContext.getContext().getSession().remove("usertype");
        ActionContext.getContext().getSession().remove("user");
        return "success";
    }
    public String Search(){
        SearchView searchView;
        if(condition==null||condition.equals("all")){
            searchView = new SearchView();
            searchView.setCondition("all");
            articleService.init();
            searchView.setArticleViews(articleService.getListViews(keyword,""));
            articleService.clear();
            coursewareService.init();
            searchView.setCoursewareViews(coursewareService.getListViews(keyword,""));
            coursewareService.clear();
            courseService.init();
            searchView.setCourses(courseService.getListViews(keyword));
            courseService.clear();
            offeredService.init();
            searchView.setOfferedViews(offeredService.getListViews(keyword, -1));
            offeredService.clear();
            selectedService.init();
            searchView.setSelectedViews(selectedService.getListViews(keyword, -1));
            selectedService.clear();
        }
        else if(condition.equals("article")){
            searchView = new SearchView();
            searchView.setCondition("article");
            articleService.init();
            searchView.setArticleViews(articleService.getListViews(keyword,""));
            articleService.clear();
        }
        else if(condition.equals("courseware")){
            searchView = new SearchView();
            searchView.setCondition("courseware");
            coursewareService.init();
            searchView.setCoursewareViews(coursewareService.getListViews(keyword,""));
            coursewareService.clear();
        }
        else if(condition.equals("course")){
            searchView = new SearchView();
            searchView.setCondition("course");
            courseService.init();
            searchView.setCourses(courseService.getListViews(keyword));
            courseService.clear();
            offeredService.init();
            searchView.setOfferedViews(offeredService.getListViews(keyword, -1));
            offeredService.clear();
            selectedService.init();
            searchView.setSelectedViews(selectedService.getListViews(keyword, -1));
            selectedService.clear();
        }
        else{
            return "fail";
        }
        ActionContext.getContext().getSession().put("searchView",searchView);
        return "success";
    }
    public AdminService getAdminService() {
        return adminService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public TeacherService getTeacherService() {
        return teacherService;
    }

    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    public StudentService getStudentService() {
        return studentService;
    }

    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public CoursewareService getCoursewareService() {
        return coursewareService;
    }

    public void setCoursewareService(CoursewareService coursewareService) {
        this.coursewareService = coursewareService;
    }

    public CourseService getCourseService() {
        return courseService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public OfferedService getOfferedService() {
        return offeredService;
    }

    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
    }

    public SelectedService getSelectedService() {
        return selectedService;
    }

    public void setSelectedService(SelectedService selectedService) {
        this.selectedService = selectedService;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
