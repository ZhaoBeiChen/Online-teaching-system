package DAO;
import java.io.Serializable;
import java.util.List;

public interface BaseDAO<T>
{
    List<T> get(String table);
    boolean save(T t);
    boolean update(T t);
    boolean delete(T t);
    Object get(Class type, Serializable id);
    Object load(Class type, Serializable id);
    T findById(Class<T> cls,Serializable id);
    List<T> findBySQL(String sql);
    void init();
    boolean clear();
}