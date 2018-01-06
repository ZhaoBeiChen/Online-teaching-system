package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Class;
import Model.Message;
import Model.Student;
import Model.Teacher;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MessageService extends BaseServiceImpl<Message> {

    public MessageService(){
        BaseDAO<Message> dao = new BaseDAOImpl<Message>();
        super.setDao(dao);
    }

    public List<Message> getList(){
        String usertype = (String) ActionContext.getContext().getSession().get("usertype");
        if(usertype==null){
            return new ArrayList<Message>();
        }
        if(usertype.equals("teacher")) {
            Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
            List<Message> messageList = getBySQL("from Message where authorid = " + teacher.getId() + " order by time desc");
            return messageList;
        }
        else {
            if(usertype.equals("student")){
                Student student = (Student) ActionContext.getContext().getSession().get("user");
                List<Message> messageList = getBySQL("from Message where classid = " + student.getClassid() + " order by time desc");
                return messageList;
            }
            else{
                List<Message> messageList = getBySQL("from Message order by time desc");
                return messageList;
            }
        }
    }

    public boolean setAdd(Message message){
        Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
        Message mes = new Message();
        mes.setAuthorid(teacher.getId());
        mes.setContent(message.getContent());
        mes.setName(message.getName());
        mes.setClassid(message.getClassid());
        mes.setGrade(new SimpleDateFormat("yyyy").format(new Date()));
        mes.setTime(new Timestamp(new Date().getTime()));
        if (save(mes)) {
            return true;
        }else {
            return false;
        }
    }

    public Message get(int id){
        Message message = (Message) get(Message.class, id);
        return message;
    }

    public boolean updateMessage(Message message){
        boolean isSuccess = false;
        isSuccess = update(message);
        if(isSuccess){
            return true;
        }else {
            return false;
        }
    }

}
