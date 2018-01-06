package Controller;

import Model.Class;
import Model.Message;
import Model.Teacher;
import Service.ClassService;
import Service.MessageService;
import Service.TeacherService;
import View.MessageView;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.List;

public class MessageAction extends ActionSupport {

    private Message message;
    private MessageService messageService;
    private ClassService classService;
    private TeacherService teacherService;
    private List<MessageView> messageViewList;

    public String show(){
        messageService.init();
        classService.init();
        teacherService.init();
        messageViewList = new ArrayList<MessageView>();
        List<Message> messageList = messageService.getList();
        List<Class> classList = classService.getList();
        for (Message temp : messageList){
            MessageView messageView = new MessageView();
            messageView.setId(temp.getId());
            messageView.setName(temp.getName());
            messageView.setContent(temp.getContent());
            messageView.setAuthor(teacherService.getById(Teacher.class,temp.getAuthorid()));
            messageView.setClassid(temp.getClassid());
            messageView.setClassName(classList.get(temp.getClassid()).getName());
            messageView.setTimestamp(temp.getTime());
            messageViewList.add(messageView);
        }
        ActionContext.getContext().getSession().put("messageViewList", messageViewList);
        messageService.clear();
        classService.clear();
        return SUCCESS;
    }

    public String add(){
        messageService.init();
        boolean isSuccess = false;
        isSuccess = messageService.setAdd(message);
        messageService.clear();
        if (isSuccess) {
            return SUCCESS;
        }else {
            return ERROR;
        }
    }

    public String change(){
        messageService.init();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("messageId"));
        Message message = messageService.get(id);
        ActionContext.getContext().getSession().put("message", message);
        messageService.clear();
        return SUCCESS;
    }
    public String delete(){
        messageService.init();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("messageId"));
        Message message = messageService.get(id);
        messageService.delete(message);
        messageService.clear();
        return SUCCESS;
    }
    public String updateMessage(){
        messageService.init();
        boolean isSuccess = false;
        isSuccess = messageService.update(message);
        messageService.clear();
        if (isSuccess) {
            return SUCCESS;
        }else {
            return ERROR;
        }
    }
    public String JSONMessages(){
        show();
        return "success";
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setClassService(ClassService classService) {
        this.classService = classService;
    }

    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    public List<MessageView> getMessageViewList() {
        return messageViewList;
    }

    public void setMessageViewList(List<MessageView> messageViewList) {
        this.messageViewList = messageViewList;
    }
}
