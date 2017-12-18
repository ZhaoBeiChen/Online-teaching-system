/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Zhudewen
 */
public class SingleSessionFactory
{
    private SingleSessionFactory(){
        
    }
    
    private static volatile  SessionFactory instance;
    
    public static SessionFactory getInstance(){
        if(instance==null){
            synchronized(SingleSessionFactory.class){
                if(instance==null){
                    instance = new Configuration().configure().buildSessionFactory();
                }
            }
        }
        return instance;
    }
}
