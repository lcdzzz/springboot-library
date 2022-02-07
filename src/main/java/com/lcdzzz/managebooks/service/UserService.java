package com.lcdzzz.managebooks.service;

import com.lcdzzz.managebooks.pojo.User;

import javax.servlet.http.HttpServletRequest;


public interface UserService {
    User checkUser(User user);

    User checkManager(User user);

    //通过id查找用户
    User findUserById(int id);

    boolean updateUser(User user, HttpServletRequest request);
}
