package com.app.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created on 2016/4/5.
 */
public interface BaseDao {
    //增加对应实体的一条记录
    boolean save(Object o);

    //更新对应实体的一条记录
     boolean update(Object o);

    //增加或者更新对应实体的一条记录
     boolean saveOrUpdate(Object o);

    //删除对应实体的一条记录
     boolean delete(Object o);

    //根据id删除对应实体的一条记录
     boolean delete(Class c, Serializable id);

    //执行hql语句删除一条记录
     Integer delete(String hql, Object... values);

    //执行hql语句查找
     List find(String hql);

    //分页查询，多参数条件
     List findBypage(String hql,final int page,final int pageSize, Object... values);

    //不带分页查询，多参数条件
     List find(String hql, Object... values);

    //执行hql语句更新，多参数条件
    boolean update(final String hql, final Object... values);

    //根据主键ID查询对应实体的一条记录，如果未能发现符合条件的记录，get方法返回null，而load方法会抛出一个ObjectNotFoundException。
     Object get(Class clazz, Serializable id);

    //根据主键ID查询对应实体的一条记录，load支持延迟加载，get不支持
     Object load(Class c, Serializable id);

    //获取总记录数
     int total(String hql, List values);

    //获取总记录数
     int total(String hql, Object... values);

}
