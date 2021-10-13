package com.ssm.mapper;

import com.ssm.pojo.Comments;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentsMapper {
    public List<Comments> getByteId(@Param("hotEventsId")int hotEventsId);

    public int add(Comments c);

}
