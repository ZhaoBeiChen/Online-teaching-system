package Service;

import DAO.BaseDAO;
import DAO.BaseDAOImpl;
import Model.Message;
import Model.Teacher;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MessageService extends BaseServiceImpl<Message> {

    public MessageService(){
        BaseDAO<Message> dao = new BaseDAOImpl<Message>();
        super.setDao(dao);
    }

    public boolean setAdd(Message message){
        Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("user");
        Message mes = new Message();
        mes.setAuthorid(teacher.getId());
        mes.setContent(message.getContent());
        mes.setName(message.getName());
        mes.setGrade(new SimpleDateFormat("yyyy").format(new Date()));
        mes.setTime(new Timestamp(new Date().getTime()));
        save(mes);
        return true;
    }

}
