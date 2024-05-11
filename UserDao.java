package com.learn.mycart.dao;

import com.learn.mycart.entities.User;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password){
        User user=null;

        try{
            // Hibernate Query Language (HQL) to retrieve a user by email and password
            String query = "from User where userEmail =: e and userPassword =: p";

            // Open a session from the factory
            Session session = this.factory.openSession();

            // Create a Hibernate Query from the HQL
            Query q = session.createQuery(query);

            // Set parameters for email and password
            q.setParameter("e", email);
            q.setParameter("p", password);

            // Retrieve the unique result (assuming the email and password combination is unique)
            List<User> userList = q.getResultList();

            if (!userList.isEmpty()) {
                user = userList.get(0);
            }


            // Close the session
            session.close();
        } catch(Exception e){
            e.printStackTrace();
        }

        return user;
    }
}
