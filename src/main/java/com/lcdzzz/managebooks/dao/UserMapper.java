package com.lcdzzz.managebooks.dao;

import com.lcdzzz.managebooks.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    //通过username和passwd 验证用户 reader
    User checkUser(@Param("user") User user);
    User checkManager(@Param("user") User user);
    User selectByPrimaryKey(Integer userId);
    int updateByPrimaryKey(User record);
}
