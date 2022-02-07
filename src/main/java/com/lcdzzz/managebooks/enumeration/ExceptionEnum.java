package com.lcdzzz.managebooks.enumeration;

import lombok.Getter;


@Getter
public enum ExceptionEnum {
    ADD_FAILURE(10001,"添加失败"),
    RESERVATION_FAILURE(10002,"预约失败");

    private Integer code;
    private String message;

    ExceptionEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}

