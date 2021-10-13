package com.ssm.service;

import com.ssm.pojo.Comments;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentsService {
    public List<Comments> getByteId(@Param("hotEventsId")int hotEventsId);
    public int add(Comments c);
}
