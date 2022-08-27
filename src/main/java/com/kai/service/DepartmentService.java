package com.kai.service;

import com.kai.dao.DepartmentMapper;
import com.kai.pojo.Department;
import com.kai.pojo.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author :wk
 * @Description
 * @Date: Created in 11:31 2022/8/25
 * @modified By:
 */
@Service
public class DepartmentService {
    @Autowired
     DepartmentMapper departmentMapper;
    public void setDepartmentMapper(DepartmentMapper departmentMapper) {
        this.departmentMapper = departmentMapper;
    }
    public DepartmentMapper getDepartmentMapper() {
        return departmentMapper;
    }
    public List<Department> getDepts(){
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
