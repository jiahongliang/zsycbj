package com.jhl.cms.web.msg;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 请求报文对象
 *
 * @param <T>
 * @param <T2>
 * @author
 */
@Data
public class WebReq<T, T2> implements Serializable {

    private T entity;

    private T2 ext;

    private List<WebQuery> where;

    private List<WebRange> range;

    private int pageNum;

    private int pageSize;

    private String orderBy = "";

    public void addWebQuery(String... arr) {
        if (where == null) {
            where = new ArrayList<>();
        }
        where.add(new WebQuery(arr[0], arr[1], arr[2], arr[3]));
    }
}
