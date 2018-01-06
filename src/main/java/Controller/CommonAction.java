package Controller;

import Model.Admin;
import Model.Class;
import Model.Student;
import Model.Teacher;
import Service.*;
import Util.JavaMailUtil;
import View.CountView;
import View.SearchView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.HibernateException;

import java.util.Random;

public class CommonAction extends ActionSupport
{
    private AdminService adminService;
    private TeacherService teacherService;
    private StudentService studentService;

    private ClassService classService;

    private ArticleService articleService;
    private CoursewareService coursewareService;
    private CourseService courseService;
    private OfferedService offeredService;
    private SelectedService selectedService;

    private String keyword;
    private String condition;

    private String username;
    private String password;
    private String email;
    private String usertype;
    private String verify;
    private String msg;

    private CountView countView;
    public String Index(){
        //username="student";
        //password="123456";
        //Login();
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
        if(studentService.Login(context,username,password)){
            classService.init();
            Student student = (Student) ActionContext.getContext().getSession().get("user");
            ActionContext.getContext().getSession().put("userclass",classService.getById(Class.class,student.getClassid()));
            classService.clear();
        }
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
    public String Count(){
        countView = new CountView();
        studentService.init();
        int studentCount = studentService.count("Student");
        studentService.clear();
        teacherService.init();
        int teacherCount = teacherService.count("Teacher");
        teacherService.clear();
        adminService.init();
        int adminCount = adminService.count("Admin");
        adminService.clear();
        countView.setUserCount(studentCount+teacherCount+adminCount);

        offeredService.init();
        countView.setOfferedCount(offeredService.count("Offered"));
        offeredService.clear();
        articleService.init();
        countView.setArticleCount(articleService.count("Article"));
        articleService.clear();
        coursewareService.init();
        countView.setCoursewareCount(coursewareService.count("Courseware"));
        coursewareService.clear();

        return "success";
    }
    public String FindPassword(){

        try{
            String param = (String) ActionContext.getContext().getSession().get("findtype");
            setMsg("");
            String findtype = "inputBasic";
            if(param!=null){
                findtype = param;
                if(findtype.equals("changePassword")){//修改密码
                    if(usertype.equals("admin")) {
                        adminService.init();
                        Admin admin = adminService.getBySQL("from Admin a where a.name = '" + username + "'").get(0);
                        admin.setPassword(password);
                        adminService.update(admin);
                        adminService.clear();
                    }
                    else if(usertype.equals("teacher")){
                        teacherService.init();
                        Teacher teacher = teacherService.getBySQL("from Teacher t where t.name = '" + username + "'").get(0);
                        teacher.setPassword(password);
                        teacherService.update(teacher);
                        teacherService.clear();
                    }
                    else if(usertype.equals("student")){
                        studentService.init();
                        Student student = studentService.getBySQL("from Student s where s.name = '" + username + "'").get(0);
                        student.setPassword(password);
                        studentService.update(student);
                        studentService.clear();
                    }
                    else{
                        setMsg("用户类型不正确！");
                        findtype = "inputBasic";
                        return "success";
                    }
                    findtype = "changed";
                    ActionContext.getContext().getSession().put("verify",null);
                }
                else if(findtype.equals("emailVerify")){
                    String verifycode = (String)ActionContext.getContext().getSession().get("verify");
                    if(verifycode.equals(verify)){
                        findtype = "changePassword";
                    }
                    else{
                        ActionContext.getContext().getSession().put("findtype",null);
                        return "fail";
                    }
                }
                else if(findtype.equals("inputBasic")){
                    return "success";
                }
                else{
                    return "fail";
                }
            }
            else {
                boolean empty = false;
                if(usertype.equals("admin")) {
                    adminService.init();
                    empty = adminService.getBySQL("from Admin a where a.name = '" + username + "' and a.email = '" + email + "'").isEmpty();
                    adminService.clear();
                }
                else if(usertype.equals("teacher")){
                    teacherService.init();
                    empty = teacherService.getBySQL("from Teacher t where t.name = '" + username + "' and t.email = '" + email + "'").isEmpty();
                    teacherService.clear();
                }
                else if(usertype.equals("student")){
                    studentService.init();
                    empty = studentService.getBySQL("from Student s where s.name = '" + username + "' and s.email = '" + email + "'").isEmpty();
                    studentService.clear();
                }
                else{
                    setMsg("用户类型不正确！");
                    findtype = "inputBasic";
                    return "success";
                }
                if (empty) {//未找到用户,需重新输入
                    findtype = "inputBasic";
                    setMsg("用户名或邮箱不正确，请检查！");
                }
                else { //进行邮箱验证
                    findtype = "emailVerify";
                    String verifycode = generateCode();
                    JavaMailUtil.sendMail(email,"修改密码！","您本次操作的验证码为： "+verifycode+" 。");
                    ActionContext.getContext().getSession().put("verify",verifycode);
                }
            }
            ActionContext.getContext().getSession().put("findtype",findtype);
            return "success";
        }
        catch (HibernateException e)
        {
            e.printStackTrace();
            return "fail";
        }
    }

    private void setMsg(String s) {
        this.msg = s;
    }

    private String generateCode() {
        int max=999999;
        int min=100000;
        Random random = new Random();
        int s = random.nextInt(max)%(max-min+1) + min;
        return s+"";
    }

    public void setClassService(ClassService classService) {
        this.classService = classService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public void setCoursewareService(CoursewareService coursewareService) {
        this.coursewareService = coursewareService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public void setOfferedService(OfferedService offeredService) {
        this.offeredService = offeredService;
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

    public CountView getCountView() {
        return countView;
    }

    public void setCountView(CountView countView) {
        this.countView = countView;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getVerify() {
        return verify;
    }

    public void setVerify(String verify) {
        this.verify = verify;
    }

    public String getMsg() {
        return msg;
    }
}
