package com.jhl.cms.configuration.exception.handler;

import com.jhl.cms.configuration.exception.biz.AttachmentException;
import com.jhl.cms.configuration.exception.biz.CmsArticleException;
import com.jhl.cms.configuration.exception.biz.CmsColumnException;
import com.jhl.cms.configuration.exception.biz.DictException;
import com.jhl.cms.web.msg.WebResp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = AuthenticationException.class)
    @ResponseBody
    public WebResp exceptionHandler(HttpServletRequest req, AuthenticationException ex) {
        WebResp resp = new WebResp();
        resp.setCode(10001);
        resp.setMsg(ex.getMessage());
        return resp;
    }

    @ExceptionHandler(value = DictException.class)
    @ResponseBody
    public WebResp exceptionHandler(HttpServletRequest req, DictException ex) {
        WebResp resp = new WebResp();
        resp.setCode(Integer.valueOf(ex.getErrCode()));
        resp.setMsg(ex.getErrMsg());
        return resp;
    }

    @ExceptionHandler(value = AttachmentException.class)
    @ResponseBody
    public WebResp exceptionHandler(HttpServletRequest req, AttachmentException ex) {
        WebResp resp = new WebResp();
        resp.setCode(Integer.valueOf(ex.getErrCode()));
        resp.setMsg(ex.getErrMsg());
        return resp;
    }

    @ExceptionHandler(value = CmsColumnException.class)
    @ResponseBody
    public WebResp exceptionHandler(HttpServletRequest req, CmsColumnException ex) {
        WebResp resp = new WebResp();
        resp.setCode(Integer.valueOf(ex.getErrCode()));
        resp.setMsg(ex.getErrMsg());
        return resp;
    }

    @ExceptionHandler(value = CmsArticleException.class)
    @ResponseBody
    public WebResp exceptionHandler(HttpServletRequest req, CmsArticleException ex) {
        WebResp resp = new WebResp();
        resp.setCode(Integer.valueOf(ex.getErrCode()));
        resp.setMsg(ex.getErrMsg());
        return resp;
    }

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public WebResp exceptionHandler(HttpServletRequest req, Exception e) {
        log.error("全局错误请求地址 {}", req.getRequestURI());
        log.error("全局错误", e);

        WebResp resp = new WebResp();
        resp.setCode(10002);
        resp.setMsg(e.getMessage());
        return resp;
    }
}
