package Service;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T>
{
    T get(String sql);
    List<T> getBySQL(String sql);
    boolean save(T t);
    boolean update(T t);
    boolean delete(T t);
    Object get(Class type, Serializable id);
    T getById(Class<T> cls,Serializable id);
    Object load(Class type, Serializable id);
    void init();
    boolean clear();
}
