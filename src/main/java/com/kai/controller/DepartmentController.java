package com.kai.controller;

import com.kai.pojo.Department;
import com.kai.pojo.Msg;
import com.kai.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author :wk
 * @Description
 * @Date: Created in 11:28 2022/8/25
 * @modified By:
 */
@Controller
public class DepartmentController {
    @Autowired
    @Qualifier("DepartmentService")
    private DepartmentService departmentService;
    /**
     * 返回所有部门信息
     */
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department>  list = departmentService.getDepts();
        return Msg.success().add("depts",list);
    }
}
