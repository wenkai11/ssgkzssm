package com.kai.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kai.pojo.Employee;
import com.kai.pojo.Msg;
import com.kai.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author :wk
 * @Description
 * @Date: Created in 18:32 2022/8/22
 * @modified By:
 */
@Controller
public class EmployeeController {
    @Autowired
    @Qualifier("EmployeeService")
    EmployeeService employeeService;

    /**
     * 单个批量二合一
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids") String ids){
    if(ids.contains("-")){
           List<Integer> del_ids = new ArrayList<>();
          String[] str_ids = ids.split("-");
        for (String string : str_ids) {
            del_ids.add(Integer.parseInt(string));
        }
        employeeService.deleteBatch(del_ids);
    }else {
        Integer id =Integer.parseInt(ids);
        employeeService.deleteEmp(id);
    }
    return Msg.success();
    }
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee){
        System.out.println("将要更新的员工数据"+employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                System.out.println("错误的字段名"+fieldError.getField());
                System.out.println("错误信息"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
         employeeService.saveEmp(employee);
         return  Msg.success();
        }
    }
    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuse(@RequestParam("empName") String empName){
           String regx = "(^[a-zA-Z0-9]{4,16}$)";
           if(!empName.matches(regx)){
               return Msg.fail().add("va_msg","用户名不可用");
           }
         boolean b = employeeService.checkUser(empName);
         if(b){
             return Msg.success();
         }else {
             return Msg.fail().add("va_msg","用户名重复");
         }
    }
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",pageInfo);
    }
    /**
     * 查询员工数据(分页查询)
     * @return
     */
     //@RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        //这边需要做一个分页查询
//        //引入PageHelper分页插件
//        PageHelper.startPage(pn,5);
//        List<Employee> emps = employeeService.getAll();
//        PageInfo pageInfo = new PageInfo(emps,5);
//        model.addAttribute("pageInfo",pageInfo);
//        return "list";
//    }
}
