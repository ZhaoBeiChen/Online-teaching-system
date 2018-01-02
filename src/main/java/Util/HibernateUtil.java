/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Zhudewen
 */
public class HibernateUtil
{
    private SessionFactory SF;
    private Session session;
    private Transaction trans;
    
    public void InitSession()
    {
        SF = SingleSessionFactory.getInstance();
        session = SF.openSession();
        trans = session.beginTransaction();
    }
    public Session getSession()
    {
        return session;
    }
    
    public Transaction getTransaction()
    {
        return trans;
    }
    
    public boolean CloseSession()
    {
        try{
            if (trans != null) {
                trans.commit();
            }
            if (session != null) {
                session.clear();
                session.close();
            }
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }
}
