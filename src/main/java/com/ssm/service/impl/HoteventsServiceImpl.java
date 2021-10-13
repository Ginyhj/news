package com.ssm.service.impl;

import com.ssm.mapper.HoteventsMapper;
import com.ssm.pojo.Hotevents;
import com.ssm.service.HoteventsService;
import com.ssm.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class HoteventsServiceImpl implements HoteventsService {
    @Resource
    HoteventsMapper mapper;


    @Override
    public Page<Hotevents> getPage(String keyWord, int pageIndex, int pageSize) {
        Page<Hotevents> page = new Page<Hotevents>();
        page.setPageSize(pageSize);
        page.setPageIndex(pageIndex);
        page.setTotalCount(mapper.getCount(keyWord));
        page.setList(mapper.getPage(keyWord,(pageIndex-1)*pageSize,pageSize));
        return page;
    }

    @Override
    public Hotevents getByteId(int id) {
        return mapper.getByteId(id);
    }

    @Override
    public int update(int id) {
        return mapper.update(id);
    }
}
