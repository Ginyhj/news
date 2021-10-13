package com.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.ssm.pojo.Comments;
import com.ssm.pojo.Hotevents;
import com.ssm.service.CommentsService;
import com.ssm.service.HoteventsService;
import com.ssm.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.jws.WebParam;
import java.util.List;

@Controller
public class cont {
    @Resource
    HoteventsService service;
    @Resource
    CommentsService service1;


    @RequestMapping("/page")
    public String getPage(String keyWord, @RequestParam(value = "pageIndex",required = true,defaultValue = "1")int pageIndex,
                          Model model){
        Page<Hotevents> page = service.getPage(keyWord, pageIndex, 2);
        model.addAttribute("page",page);
        return "index";
    }


    @RequestMapping(value = "/index2",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Page<Hotevents> index(String keyWord, @RequestParam(value = "pageIndex",required = true,defaultValue = "1")int pageIndex
                        ){
        Page<Hotevents> page = service.getPage(keyWord, pageIndex, 2);
        return page;
    }


    @RequestMapping("/toselect")
    public String toselect(int id,Model model){
        Hotevents byteId = service.getByteId(id);
        model.addAttribute("b",byteId);
        List<Comments> byteId1 = service1.getByteId(id);
        model.addAttribute("b2",byteId1);
        return "toselect";
    }

    @RequestMapping("/add")
    public String add(Comments c){
        int add = service1.add(c);
        if(add>0){
            int update = service.update(c.getHotEventsId());
            return "redirect:/page";
        }else{
            return "redirect:/toselect";
        }
    }


    @RequestMapping("/tosel")
    public String tosel(int id,Model model){
        model.addAttribute("id",id);
        return "toselect2";
    }

    @RequestMapping("/sel")
    @ResponseBody
    public Hotevents sel(int id){
        Hotevents byteId = service.getByteId(id);

        return byteId;
    }

    @RequestMapping("/sel2")
    @ResponseBody
    public List<Comments> sel2(int id){
        List<Comments> list = service1.getByteId(id);
        return list;
    }

     @RequestMapping("/add2")
     @ResponseBody
    public String add2(Comments c){
        int add = service1.add(c);
        if(add>0){
            int update = service.update(c.getHotEventsId());
            return "ok";
        }else{
            return "false";
        }
    }

}
