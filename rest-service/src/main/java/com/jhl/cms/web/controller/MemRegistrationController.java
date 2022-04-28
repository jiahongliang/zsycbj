package com.jhl.cms.web.controller;

import com.jhl.cms.entity.MemRegistration;
import com.jhl.cms.repository.MemRegistrationRepository;
import com.jhl.cms.web.msg.WebReq;
import com.jhl.cms.web.msg.WebResp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author
 */
@Slf4j
@RestController
@RequestMapping(value = "member")
public class MemRegistrationController {

    @Autowired
    private MemRegistrationRepository memRegistrationRepository;

    /**
     * 扫描二维码会员登记
     *
     * @param req
     * @return
     */
    @PostMapping("register")
    public WebResp<MemRegistration, Object> register(@RequestBody WebReq<MemRegistration, Long> req, HttpServletRequest request) {
        Assert.notNull(req.getEntity(), "请求数据不能为空");
        Assert.notNull(req.getEntity().getOrgname(), "单位名称不能为空");
        Assert.notNull(req.getEntity().getLinkman(), "联系人不能为空");
        Assert.notNull(req.getEntity().getPhone(), "电话号码不能为空");
        MemRegistration obj = req.getEntity();
        obj.setIp(request.getRemoteAddr());
        memRegistrationRepository.save(obj);
        return new WebResp();
    }
}
