package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Course;
import Model.Courseware;
import Model.Teacher;
import View.CoursewareView;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CoursewareService  extends BaseServiceImpl<Courseware> {

    private final static String UPLOADDIR = "D:\\courseware";

    public CoursewareService(){
        BaseDAO<Courseware> dao = new BaseDAOImpl<Courseware>();
        super.setDao(dao);
    }
    public List<CoursewareView> getListViews(String keyword,String condition) {
        if(keyword==null){
            keyword="";
        }
        List<Courseware> coursewareList = getBySQL("from Courseware " + condition);
        List<CoursewareView> coursewareViews = new ArrayList<CoursewareView>();
        for(Courseware c : coursewareList){
            Teacher teacher = (Teacher) get(Teacher.class,c.getAuthorid());
            Course course = (Course) get(Course.class,c.getCourseid());
            CoursewareView view = new CoursewareView();
            view.setId(c.getId());
            view.setName(c.getName());
            view.setContent(c.getContent());
            view.setPath(c.getPath());
            view.setTeacher(teacher);
            view.setCourse(course);
            view.setGrade(c.getGrade());
            view.setTime(c.getTime());
            if(view.getName().contains(keyword) ||
                    view.getContent().contains(keyword) ||
                    view.getTeacher().getName().contains(keyword) ||
                    view.getTeacher().getEmail().contains(keyword) ||
                    view.getCourse().getName().contains(keyword) ||
                    view.getCourse().getContent().contains(keyword)){
                coursewareViews.add(view);
            }
        }
        return coursewareViews;
    }

    public boolean setAdd(String name,String content,int courseid, File file, String fileName) throws IOException {
        String dir = UPLOADDIR;//ServletActionContext.getRequest().getRealPath(UPLOADDIR);
        File fileLocation = new File(dir);
        File uploadFile = new File(dir, fileName);
        if(file != null){
            int i=0;
            while(uploadFile.exists()){
                uploadFile = new File(dir, fileName+(new Date().toString()));
            }
            if(!uploadFile.getParentFile().exists()){
                boolean isCreated  = uploadFile.getParentFile().mkdir();
                if(!isCreated) {
                    return false;
                }
            }
            FileUtils.copyFile(file, uploadFile);
        }
        else{
            return false;
        }
        Teacher nowteacher = (Teacher) ActionContext.getContext().getSession().get("user");
        Course course= (Course) load(Course.class,courseid);
        Teacher teacher = (Teacher) load(Teacher.class,nowteacher.getId());
        Courseware c = new Courseware();
        c.setName(name);
        c.setContent(content);
        c.setTeacher(teacher);
        c.setCourseid(courseid);
        c.setCourse(course);
        c.setAuthorid(teacher.getId());
        c.setPath(uploadFile.getAbsolutePath());
        c.setGrade(new SimpleDateFormat("yyyy").format(new Date()));
        c.setTime(new Timestamp(new Date().getTime()));
        save(c);
        return true;
    }
}
