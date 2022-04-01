package com.jhl.cms.configuration.exception.base;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BaseException extends RuntimeException {
    private Integer errCode;
    private String errMsg;

    public BaseException() {
        this.errCode = 10002;
        this.errMsg = "接口调用失败";
    }

    public BaseException(Integer errCode, String errMsg) {
        this.errCode = errCode;
        this.errMsg = errMsg;
    }
}
