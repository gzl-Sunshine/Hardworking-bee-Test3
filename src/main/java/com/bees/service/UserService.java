package com.bees.service;

import com.bees.dao.UserMapper;
import com.bees.pojo.Msg;
import com.bees.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户的service层
 * @author 11384
 */
@Service("userService")
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 1.注册新用户
     * @param user
     */
    public void addUser(User user){
        userMapper.addUser(user);
    }

    /**
     * 2.用户登录
     * @param user
     * @return
     */
    public boolean loginUser(User user){
        int i = userMapper.loginUser(user);
        if(i==1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 3.检测用户名是否可用(唯一)
     * @param username
     * @return
     */
    public boolean checkUsername(String username){
        int i = userMapper.checkUsername(username);
        if (i==0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 注册会员
     * @param username
     */
    public void becomeMember(String username){
        System.out.println("becomeMember执行了"+username);
        userMapper.becomeMember(username);
    }

    /**
     * 检查是否为会员
     */
    public String checkMember(String username){
        String flag = userMapper.checkMember(username);
        return flag;
    }
}
