package Controller;

import Model.Message;
import Service.MessageService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.List;

public class MessageAction extends ActionSupport {

    private Message message;
    private MessageService messageService;

    public String show(){
        messageService.init();
        List<Message> messageList = messageService.getList();
        System.out.println("1");
        ServletActionContext.getRequest().setAttribute("messageView",messageList);
        //messageList.clear();
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

    public String update(){
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



    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
}
