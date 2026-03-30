package com.example.authdemo.mapper;

import com.example.authdemo.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User findByUsername(@Param("username") String username);
}
