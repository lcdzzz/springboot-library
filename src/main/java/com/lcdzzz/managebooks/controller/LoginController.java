package com.lcdzzz.managebooks.controller;

import com.lcdzzz.managebooks.pojo.User;
import com.lcdzzz.managebooks.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/managebooks")
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    /**
     * login.html里面的form表单，提交的地址是/managebooks/detail
     */
    //通过request请求拿到用户名和密码两个参数
    //关于model：model是用来从后台封装数据到页面的，
    // 比如页面上展示一个“欢迎你，{userName}",你就可以用model封装一个userName进去，model.addAttribute("useNamer”,张三"" );页面就会显示”欢迎你，张三”
    @GetMapping(value = "/detail")
    public String detail(Model model,
                         HttpServletRequest request) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        User user;
        if (userName == null) return "login";
        if (userName.contains("admin_")) {
            user = new User(userName, password);//得到user对象
            User u = userService.checkManager(user);//传入user对象，在user.xml的select语句中得到u这个user类对象
            if (u == null) return "login";//若是没有得到对象，说明没有在数据库中查找到用户名和密码正确的数据
            model.addAttribute("user", u); //把值放到model里面。用model把查找到的user对象封装进去，当后面的前端页面需要用的时候，就可以{user.xxx}
            request.getSession().setAttribute("user", u);//先获取session，然后把值放到session里面（不管session在哪里，都能取到值）
            return "detail_admin";
        } else {
            user = new User(userName, password);
            User u = userService.checkUser(user);
            if (u == null) return "login";
            model.addAttribute("user", u);
            request.getSession().setAttribute("user", u);
            return "detail_user";
        }
    }

    //通过"detail_user.html"可知，点击“图书借阅”,跳转到这里，是首页
    @GetMapping(value = "/homepage")
    public String homepage(Model model,
                           HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");//从session里拿到User对象
        model.addAttribute("user", user);//老样子，把user对象封装到model容器中，方便前端调用。
        //model容器中的user对象在detail_user.html的啥啥啥欢迎你里面用到了
        return "detail_user";
    }

    @GetMapping(value = "admin/homepage")
    public String adminhomepage(Model model,
                           HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        return "detail_admin";
    }


    @RequestMapping("/userMessagePage")
    public String userMessagePage(Model model, HttpServletRequest request) {
        User session_user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", session_user);

        User user = userService.findUserById(session_user.getUserId());
        model.addAttribute("message_user", user);
        return "userMessage";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public boolean updateUser(User user, HttpServletRequest request) {
        return userService.updateUser(user, request);
    }
}
