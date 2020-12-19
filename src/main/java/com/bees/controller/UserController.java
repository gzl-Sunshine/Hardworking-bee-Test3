package com.bees.controller;


import com.bees.pojo.Msg;
import com.bees.pojo.User;
import com.bees.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户的Controller层
 * @author 11384
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private  UserService userService;

    /**
     * 1.新用户注册
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(User user){
        userService.addUser(user);

        /**
         * 跳转到登录页面
         */
        return "redirect:http://localhost:8080/Test3/login.jsp";
    }

    /**
     * 2.用户登录
     * @param user
     * @return
     */
    @RequestMapping("/loginUser")
    @ResponseBody
    public Msg loginUser(@RequestBody User user, HttpServletRequest request){
        boolean flag = userService.loginUser(user);
        if(flag){
            request.getSession().setAttribute("username", user.getUsername());
            /**
             * 清空缓存
             */
            request.getSession().setAttribute("files", "");
            request.getSession().setAttribute("filesByType", "");
            request.getSession().setAttribute("types", "");
            request.getSession().setAttribute("fileInfos", "");
            request.getSession().getServletContext().setAttribute("finish", "");
            request.getSession().getServletContext().setAttribute("progress", "");
            request.getSession().getServletContext().setAttribute("finish", "");
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    /**
     * 3.检测用户名是否可用
     * @param username
     * @return
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public Msg checkUsername(@RequestBody String username){
        boolean flag = userService.checkUsername(username);
        if(flag){
           return Msg.success();
        }else{
            return Msg.fail();
        }
    }


    /**
     * 退出系统
     * @param request
     */
    @RequestMapping("/logout")
    @ResponseBody
    public void logout(HttpServletRequest request){
        System.out.println("UserController...退出系统");
        request.getSession().removeAttribute("username");
    }

    /**
     * 注册会员
     * @param request
     */
    @RequestMapping("/becomeMember")
    @ResponseBody
    public void becomeMember(HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("username");
        userService.becomeMember(username);
    }

    /**
     * 检查是否是会员
     * @param request
     * @return
     */
    @RequestMapping("/checkMember")
    @ResponseBody
    public  String checkMember(HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("username");
        String flag=userService.checkMember(username);
        return flag;
    }

}
