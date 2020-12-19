package com.bees.pojo;

/**
 * 用户
 *
 * @author 11384
 */
public class User {
    private int uid;
    private String username;
    private String password;
    /**
     * 是否是会员?
     */
    private String memberFlag;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMemberFlag() {
        return memberFlag;
    }

    public void setMemberFlag(String memberFlag) {
        this.memberFlag = memberFlag;
    }

    /**
     * 方便测试
     */
    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", memberFlag='" + memberFlag + '\'' +
                '}';
    }
}
