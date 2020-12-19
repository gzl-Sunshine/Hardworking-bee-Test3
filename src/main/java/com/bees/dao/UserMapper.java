package com.bees.dao;

import com.bees.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * Dao层之用户
 * @author 11384
 */
public interface UserMapper {

    /**
     * 1.注册新用户
     * @param user
     */
    @Insert("insert into user (username,password) values (#{username},#{password}) ")
    public void addUser(User user);


    /**
     * 2.用户登录
     * @param user
     * @return
     */
    @Select("select count(*) from user where username = #{username} and password = #{password}")
    public int loginUser(User user);


    /**
     * 3.检测用户名是否可用(唯一)
     * @param username
     * @return
     */
    @Select("select count(*) from user where username = #{username}")
    public int checkUsername(String username);

    /**
     * 4.将用户注册为会员
     * @param username
     */
    @Update("update user set memberFlag = 'T' where username = #{username}")
    public void becomeMember(String username);


    /**
     * 5.检查是否为会员
     * @param username
     * @return
     */
    @Select("select memberFlag from user where username = #{username}")
    public String checkMember(String username);

}
