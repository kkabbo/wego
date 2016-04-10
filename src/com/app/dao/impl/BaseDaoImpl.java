package com.app.dao.impl;

import com.app.dao.BaseDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.*;

/**
 * Created on 2016/4/5.
 */
@Transactional
public class BaseDaoImpl implements BaseDao {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    public boolean delete(Object o) {
        try {
            sessionFactory.getCurrentSession().delete(o);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean delete(Class c, Serializable id) {
        try {
            sessionFactory.getCurrentSession().delete(get(c, id));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Integer delete(final String hql, final Object... values) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        if (values != null && values.length > 0) {
            for (int i = 0; i < values.length; i++) {
                q.setParameter(i, values[i]);
            }
        }
        return q.executeUpdate();
    }

    @Override
    public boolean update(Object o) {
        try {
            sessionFactory.getCurrentSession().update(o);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean save(Object o) {
        try {
            sessionFactory.getCurrentSession().save(o);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean saveOrUpdate(Object o) {
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(o);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List find(String hql) {
        return sessionFactory.getCurrentSession().createQuery(hql).list();
    }

    @Override
    public List findBypage(final String hql, final int page, final int pageSize, final Object... values) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        if (values != null && values.length > 0) {
            for (int i = 0; i < values.length; i++) {
                q.setParameter(i, values[i]);
            }
        }
        return q.setFirstResult(page).setMaxResults(pageSize).list();
    }

    @Override
    public List find(String hql, Object... values) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        if (values != null && values.length > 0) {
            for (int i = 0; i < values.length; i++) {
                q.setParameter(i, values[i]);
            }
        }
        return q.list();
    }

    @Override
    public boolean update(final String hql, final Object... values) {
        try {
            Query q =  sessionFactory.getCurrentSession().createQuery(hql);
            if (values != null && values.length > 0) {
                for (int i = 0; i < values.length; i++) {
                    q.setParameter(i, values[i]);
                }
            }
            q.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Object get(Class c, Serializable id) {
        return sessionFactory.getCurrentSession().get(c, id);
    }

    @Override
    public Object load(Class c, Serializable id) {
        return sessionFactory.getCurrentSession().load(c, id);
    }

    @Override
    public int total(final String hql, final List values) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        if (values != null && values.size() > 0) {
            for (int i = 0; i < values.size(); i++) {
                q.setParameter(i, values.get(i));
            }
        }
        return q.list().size();
    }

    @Override
    public int total(final String hql, final Object... values) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        if (values != null && values.length > 0) {
            for (int i = 0; i < values.length; i++) {
                q.setParameter(i, values[i]);
            }
        }
        return q.list().size();
    }

}
