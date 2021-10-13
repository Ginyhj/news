package com.ssm.service.impl;

import com.ssm.mapper.CommentsMapper;
import com.ssm.pojo.Comments;
import com.ssm.service.CommentsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CommentsServiceImpl implements CommentsService {
    @Resource
    CommentsMapper mapper;

    @Override
    public List<Comments> getByteId(int hotEventsId) {
        return mapper.getByteId(hotEventsId);
    }

    @Override
    public int add(Comments c) {
        return mapper.add(c);
    }
}
