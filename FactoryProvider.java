package com.learn.mycart.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static final SessionFactory factory = buildSessionFactory();

    private FactoryProvider() {
        // private constructor to enforce Singleton pattern
    }

    private static SessionFactory buildSessionFactory() {
        try {
            return new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to build SessionFactory: " + e.getMessage());
        }
    }

    public static SessionFactory getFactory() {
        return factory;
    }
}
