package DAO;

import Util.HibernateUtil;
import org.hibernate.HibernateException;

import java.io.Serializable;
import java.util.List;

public class BaseDAOImpl<T> implements BaseDAO<T> {
    private final HibernateUtil HU = new HibernateUtil();

    @Override
    public T get(String sql)
    {
        List<T> lst = HU.getSession().createQuery(sql).list();
        if(lst.size()>0){
            return lst.get(0);
        }
        return null;
    }

    @Override
    public List<T> getBySQL(String sql)
    {
        return HU.getSession().createQuery(sql).list();
    }

    @Override
    public boolean save(T t)
    {
        try{
            HU.getSession().save(t);
            return true;
        }
        catch(HibernateException e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(T t)
    {
        try{
            HU.getSession().update(t);
            return true;
        }
        catch(HibernateException e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(T t)
    {
        try{
            HU.getSession().delete(t);
            return true;
        }
        catch(HibernateException e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean execute(String sql) {
        try{
            HU.getSession().createQuery(sql).executeUpdate();
            return true;
        }
        catch(HibernateException e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Object get(Class type, Serializable id)
    {
        return HU.getSession().get(type, id);
    }

    @Override
    public Object load(Class type, Serializable id)
    {
        return HU.getSession().load(type, id);
    }

    @Override
    public T getById(Class<T> cls , Serializable id)
    {
        return HU.getSession().get(cls, id);
    }

    @Override
    public void init()
    {
        HU.InitSession();
    }

    @Override
    public boolean clear()
    {
        return HU.CloseSession();
    }
}
