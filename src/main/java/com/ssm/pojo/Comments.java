package com.ssm.pojo;

import lombok.Data;

@Data
public class Comments {
    private int id;
    private int  hotEventsId;
//    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private String commentDate;
    private String content;
}
