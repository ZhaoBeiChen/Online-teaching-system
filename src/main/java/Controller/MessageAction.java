package Controller;

import Model.Message;
import Service.MessageService;
import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport {

    private Message message;
    private MessageService messageService;

    public String add(){
        messageService.init();
        messageService.setAdd(message);
        messageService.clear();
        return SUCCESS;
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
