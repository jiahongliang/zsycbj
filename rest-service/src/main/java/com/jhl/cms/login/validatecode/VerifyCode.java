package com.jhl.cms.login.validatecode;

import lombok.Data;

/**
 * @author
 */
@Data
public class VerifyCode {

    private String code;

    private byte[] imgBytes;

    private long expireTime;

}
