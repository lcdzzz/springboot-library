package com.lcdzzz.managebooks.exception;

import com.lcdzzz.managebooks.enumeration.ExceptionEnum;
import lombok.Data;


@Data
public class ServiceException extends RuntimeException {
    private Integer code;

    public ServiceException(ExceptionEnum exceptionEnum) {
        super(exceptionEnum.getMessage());
        this.code = exceptionEnum.getCode();
    }
}
