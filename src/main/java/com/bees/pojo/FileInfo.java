package com.bees.pojo;

/**
 * 文件信息类
 * @author 11384
 */
public class FileInfo {
    private String name;
    /**
     * 最后一次修改的时间
     */
    private String date;
    private String type;
    private String size;

    public FileInfo() {
    }

    public FileInfo(String name, String date, String type, String size) {
        this.name = name;
        this.date = date;
        this.type = type;
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "FileInfo{" +
                "name='" + name + '\'' +
                ", date='" + date + '\'' +
                ", type='" + type + '\'' +
                ", size=" + size +
                '}';
    }
}
