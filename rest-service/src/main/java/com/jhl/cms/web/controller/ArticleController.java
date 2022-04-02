package com.jhl.cms.web.controller;

import com.jhl.cms.Constants;
import com.jhl.cms.entity.CmsArticle;
import com.jhl.cms.repository.CmsArticleRepository;
import com.jhl.cms.web.msg.WebReq;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.apache.bcel.classfile.ConstantString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author
 */
@Slf4j
@RestController
@RequestMapping(value = "article")
public class ArticleController {
    @Autowired
    private CmsArticleRepository articleRepository;

    @PostMapping("list")
    Page<CmsArticle> articleList(@RequestBody WebReq<CmsArticle, Long> req) {
        Assert.notNull(req.getEntity(), "请求数据不能为空");
        Assert.notNull(req.getEntity().getColumnId(), "请求数据的栏目参数不能为空");

        Sort sort = Sort.by(Sort.Direction.ASC, "orderValue").and(Sort.by(Sort.Direction.DESC, "id"));
        Pageable pageable = PageRequest.of(req.getPageNum() - 1, req.getPageSize(), sort);
        return articleRepository.findByColumnId(req.getEntity().getColumnId(), pageable);
    }

    @PostMapping("all_list")
    Page<CmsArticle> allArticleList(@RequestBody WebReq<CmsArticle, Long[]> req) {
        Assert.notNull(req.getExt(), "请求数据不能为空");

        Sort sort = Sort.by(Sort.Direction.ASC, "orderValue").and(Sort.by(Sort.Direction.DESC, "id"));
        Pageable pageable = PageRequest.of(req.getPageNum() - 1, req.getPageSize(), sort);
        return articleRepository.findAllByColumnIdIn(req.getExt(), pageable);
    }

    @GetMapping("info/{id}")
    CmsArticle articleInfo(@PathVariable("id") Long id) {
        Assert.notNull(id, "请求数据不能为空");
        CmsArticle bo = articleRepository.getById(id);
        if (bo == null) {
            bo = new CmsArticle();
        }
        return bo;
    }

    @GetMapping("slide_images")
    List<CmsArticle>  slideImages() {
        return articleRepository.findAllByColumnPropertyOrderByIdDesc(Constants.COLUMN_PROPERTY_SLIDE_IMAGE);
    }

    @GetMapping("friend_link")
    List<CmsArticle>  friendLinks() {
        return articleRepository.findAllByColumnPropertyOrderByIdDesc(Constants.COLUMN_PROPERTY_LINK);
    }
}
