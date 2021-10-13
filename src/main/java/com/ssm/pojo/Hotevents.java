package com.ssm.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Hotevents {
    private int id;
    private String keyWord;
    private String hotContent;
    private int searchSum;
//    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private String createDate;
}
