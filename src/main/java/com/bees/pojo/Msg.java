package com.bees.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 信息类
 * 前后端交流的信使
 *
 * @author 11384
 */
public class Msg {

    /**
     * 状态码
     * 100-->成功
     * 200-->失败
     */
    private int code;

    /**
     * 关于返回值的信息
     */
    private String message;

    /**
     * 数据
     */
    private Map<String, Object> data = new HashMap<>();


    /**
     * 成功的信息
     * @return
     */
    public static Msg success() {
        Msg msg = new Msg();
        msg.code = 100;
        msg.message = "处理成功!";
        return msg;
    }

    /**
     * 失败的信息
     * @return
     */
    public static Msg fail(){
        Msg msg=new Msg();
        msg.code=200;
        msg.message="处理失败!";
        return msg;
    }

    /**
     * 将要返回的数据添加到信息中
     * @param key
     * @param value
     * @return
     */
    public Msg add(String key,Object value){
        this.data.put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
