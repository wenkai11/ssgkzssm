package com.kai.pojo;

import com.sun.javafx.collections.MappingChange;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author :wk
 * @Description 设计一个通用的返回的类
 * @Date: Created in 15:31 2022/8/23
 * @modified By:
 */
@Data
public class Msg {
    //状态码 100--成功  200---失败
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMsg("处理成功!");
        return msg;
    }
    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理失败!");
        return msg;
    }
    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }
}
