package com.ssm.service;

import com.ssm.pojo.Hotevents;
import com.ssm.util.Page;
import org.apache.ibatis.annotations.Param;

public interface HoteventsService {
    public Page<Hotevents> getPage(@Param("keyWord")String keyWord,
                                   @Param("pageIndex")int pageIndex,
                                   @Param("pageSize")int pageSize);
    public Hotevents getByteId(@Param("id")int id);
    public int update(@Param("id")int id);
}
