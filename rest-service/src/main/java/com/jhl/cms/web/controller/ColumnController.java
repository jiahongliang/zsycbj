package com.jhl.cms.web.controller;

import com.jhl.cms.Constants;
import com.jhl.cms.entity.CmsColumn;
import com.jhl.cms.repository.CmsColumnRepository;
import com.jhl.cms.web.vo.ColumnVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author
 */
@Slf4j
@RestController
@RequestMapping(value = "column")
public class ColumnController {
    @Autowired
    private CmsColumnRepository columnRepository;

    @GetMapping("list")
    public List<ColumnVo> commonColumnList() {
        List<CmsColumn> lst = columnRepository.findAllByParentIsNullAndPropertyOrderByOrderValue(Constants.COLUMN_PROPERTY_COMMON);
        return toVo(lst);
    }

    private List<ColumnVo> toVo(List<CmsColumn> columns) {
        List<ColumnVo> result = new ArrayList<>();
        if (columns != null || columns.size() > 0) {
            columns.forEach((e) -> {
                if (e.getDisplayFlag()) {
                    ColumnVo vo = new ColumnVo();
                    vo.setId(e.getId());
                    vo.setCode(e.getCode());
                    vo.setName(e.getName());
                    vo.setEnName(e.getEnName());
                    vo.setParentId(e.getPid());
                    vo.setParentName(e.getParentName());
                    vo.setIconId(e.getIconId());
                    vo.setOrderValue(e.getOrderValue());
                    vo.setMemo(e.getMemo());
                    if (e.getChildren() != null && e.getChildren().size() > 0) {
                        vo.setChildren(toVo(e.getChildren()));
                    } else {
                        vo.setChildren(new ArrayList<>());
                    }
                    result.add(vo);
                }
            });
        }
        return result;
    }
}
