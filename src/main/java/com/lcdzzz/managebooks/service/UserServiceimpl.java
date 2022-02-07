package com.lcdzzz.managebooks.service;

import com.lcdzzz.managebooks.dao.UserMapper;
import com.lcdzzz.managebooks.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class UserServiceimpl implements UserService {
    @Autowired(required = false)
    UserMapper userMapper;

    @Override
    public User checkUser(User user) {
        return userMapper.checkUser(user);
    }

    @Override
    public User checkManager(User user) {
        return userMapper.checkManager(user);
    }


    @Override
    public User findUserById(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateUser(User user, HttpServletRequest request) {
        //获取session对象中user对象
        User sessionUser = (User) request.getSession().getAttribute("user");
        user.setUserId(sessionUser.getUserId());

        int n = userMapper.updateByPrimaryKey(user);

        if (n > 0) {
            //修改成功，更新session对象
            User newUser = userMapper.selectByPrimaryKey(user.getUserId());
            request.getSession().setAttribute("user", newUser);
            return true;
        }

        return false;
    }
}
