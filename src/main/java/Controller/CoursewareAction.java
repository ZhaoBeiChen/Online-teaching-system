package Controller;

import Model.Courseware;
import Service.CoursewareService;
import View.CoursewareView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.*;
import java.util.List;

public class CoursewareAction extends ActionSupport {
    private CoursewareService coursewareService;
    //private Courseware courseware;
    private int id;
    private String name;
    private String content;
    private File file;
    private String fileFileName;
    private InputStream fileInput;

    public String Show() {
        coursewareService.init();
        List<CoursewareView> coursewareViews = coursewareService.getListViews("");
        ActionContext.getContext().getSession().put("coursewareViews", coursewareViews);
        coursewareService.clear();
        return "success";
    }

    public String Add() {
        coursewareService.init();
        try {
            coursewareService.setAdd(name, content, file, fileFileName);
        } catch (IOException e) {
            e.printStackTrace();
            return "fail";
        }
        coursewareService.clear();
        return "success";
    }
    public String Download(){
        coursewareService.init();
        Courseware courseware = coursewareService.getById(Courseware.class,id);
        String filePath = courseware.getPath();
        this.setFile(new File(filePath));
        this.setFileFileName(file.getName());
        System.out.println(fileFileName);
        try {
            fileInput = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        coursewareService.clear();
        return "success";

    }
    public CoursewareService getCoursewareService() {
        return coursewareService;
    }

    public void setCoursewareService(CoursewareService coursewareService) {
        this.coursewareService = coursewareService;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public InputStream getFileInput() {
        return fileInput;
    }

    public void setFileInput(InputStream fileInput) {
        this.fileInput = fileInput;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
