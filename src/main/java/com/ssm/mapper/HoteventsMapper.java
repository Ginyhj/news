package com.ssm.mapper;

import com.ssm.pojo.Hotevents;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HoteventsMapper {
    public List getPage(@Param("keyWord")String keyWord,
                        @Param("pageIndex")int pageIndex,
                        @Param("pageSize")int pageSize);

    public int getCount(@Param("keyWord")String keyWord);

    public Hotevents getByteId(@Param("id")int id);
    public int update(@Param("id")int id);
}
