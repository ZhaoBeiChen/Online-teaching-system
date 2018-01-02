package Service;

import DAO.BaseDAO;

import java.io.Serializable;
import java.util.List;

public abstract class BaseServiceImpl<T> implements BaseService<T>
{
    private BaseDAO<T> dao;

    public BaseDAO<T> getDao()
    {
        return dao;
    }

    public void setDao(BaseDAO<T> dao)
    {
        this.dao = dao;
    }
    @Override
    public T get(String sql)
    {
        return dao.get(sql);
    }

    @Override
    public List<T> getBySQL(String sql)
    {
        return dao.getBySQL(sql);
    }

    @Override
    public boolean save(T t)
    {
        return dao.save(t);
    }

    @Override
    public boolean update(T t)
    {
        return dao.update(t);
    }

    @Override
    public boolean delete(T t)
    {
        return dao.delete(t);
    }
    @Override
    public boolean execute(String sql){
        return dao.execute(sql);
    }

    public Object get(Class type, Serializable id)
    {
        return dao.get(type, id);
    }

    @Override
    public T getById(Class<T> cls , Serializable id)
    {
        return dao.getById(cls, id);
    }

    @Override
    public Object load(Class type,Serializable id)
    {
        return dao.load(type, id);
    }

    @Override
    public void init()
    {
        dao.init();
    }

    @Override
    public boolean clear()
    {
        return dao.clear();
    }
}

