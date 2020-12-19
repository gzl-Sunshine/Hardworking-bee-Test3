package com.bees.controller;

import com.bees.pojo.FileInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author 11384
 */
@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    private UserController userController;

    /**
     * 文件上传
     * @param request
     * @param mpf
     * @return
     * @throws Exception
     */
    @RequestMapping("/upload")
    public String fileUpload(HttpServletRequest request, MultipartFile mpf) throws Exception {
        if (mpf.isEmpty()) {
            //如果没有上传文件就点击上传就跳转
            return "redirect:http://localhost:8080/Test3/fileUpload.jsp";
        }
        System.out.println("SpringMVC的文件上传....");
        //获取用户名
        String username = (String) request.getSession().getAttribute("username");
        System.out.println("SpringMVC的文件上传...."+username);
        //先找到文件要上传的目录
        String path = request.getSession().getServletContext().getRealPath("/uploads/"+username);

        //创建File对象，一会儿向该文件夹下上传文件
        File file = new File(path);
        //判断该路径是否存在，若不存在，就创建
        if (!file.exists()) {
            file.mkdirs();
        }
        //获取上传文件的名称
        //倘若上传了同样的文件直接就替换掉了
        String filename=mpf.getOriginalFilename();
        //上传文件
        mpf.transferTo(new File(file, filename));
        return "redirect:http://localhost:8080/Test3/fileUpload.jsp";
    }

    /**
     * 文件下载
     * @param response
     * @param request
     * @param name
     * @throws Exception
     */
    @RequestMapping("/download/{name}.{type}")
    public void fileDownload(HttpServletResponse response, HttpServletRequest request, @PathVariable String name, @PathVariable String type) throws Exception {
        System.out.println("SpringMVC的文件下载"+name);
        System.out.println("SpringMVC的文件下载"+type);
        String fileName;
        fileName=name+"."+type;
        HttpSession session = request.getSession();
        ServletContext context = session.getServletContext();
        String username = (String) session.getAttribute("username");

        /**
         * 1.
         * 要下载的文件地址
         */
        String path = request.getSession().getServletContext().getRealPath("/uploads/"+username);
        /**
         * 2.
         * 设置response响应头
         */
        response.reset();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(fileName, "UTF-8"));

        File file = new File(path, fileName);

        /**
         * 3.读取文件--输入流
         */
        InputStream input = new FileInputStream(file);
        /**
         * 4.写出文件--输出流
         */
        OutputStream out = response.getOutputStream();

        byte[] bytes = new byte[1024];
        int index = 0;

        long length = file.length();
        System.out.println(fileName+"文件大小:"+length+"....");

        float sum=0;
        float progress;

        context.setAttribute("finish", "f");

        while ((index = input.read(bytes)) != -1) {


            /**
             * 限速功能:
             * 如果发现该用户不是会员则限制其下载速度
             * 设置等待的时间
             */
            if("F".equals(userController.checkMember(request))){
                Thread.sleep((int)(sum/10));
            }

            sum+=index;
            out.write(bytes, 0, index);
            out.flush();

            /**
             * 计算出文件的下载进度，并存到context域中
             */
            progress=(sum/length)*100;
            context.setAttribute("progress", progress);
            System.out.println("context中的progress"+context.getAttribute("progress")+".."+"cotext中的finish"+context.getAttribute("finish"));
            System.out.println(fileName+"文件下载进度"+(sum/length)*100+"%");

            /**
             * 上传成功
             */
            if(sum==length){
                context.setAttribute("finish", "t");
            }
        }


        out.close();
        input.close();
        return;

    }




    /**
     * 展示以及下载的文件的信息
     * @param request
     * @return
     */
    @RequestMapping("/showFiles")
    @ResponseBody
    public List<String> showFiles(HttpServletRequest request){
        System.out.println("FileController showFiles....");
        String username = (String) request.getSession().getAttribute("username");
        String path = request.getSession().getServletContext().getRealPath("/uploads/"+username);
        File file = new File(path);

        /**
         * 展示该目录下的所有文件
         */
        String[] files = file.list();


        List<String> list = Arrays.asList(files);
        request.getSession().setAttribute("files", list);
        return list;
    }

    /**
     * 根据不同的类型展示不同的文件
     * @param request
     * @param type
     * @return
     */
    @RequestMapping("/showFiles/{type}")
    @ResponseBody
    public List<String> showFilesByType(HttpServletRequest request, @PathVariable String type){
        System.out.println("FileController showFilesByType....");
        List<String> list = showFiles(request);
        ArrayList<String> listByType = new ArrayList<>();

        /**
         * 展示后缀名为type的文件
         */
        for (String s : list) {
            if(s.endsWith(type)){
                listByType.add(s);
            }
        }

        request.getSession().setAttribute("filesByType", listByType);
        return listByType;
    }

    /**
     * 展示文件有哪些类型
     * @param request
     * @return
     */
    @RequestMapping("/fileCategory")
    @ResponseBody
    public Set<String> fileCategory(HttpServletRequest request){
        //1.得到所有文件
        List<String> list = showFiles(request);


        //2.Set集合存储文件类型，set集合中的元素不重复
        Set<String> typeSet=new HashSet<>();
        for (String s : list) {
            String[] split = s.split("\\.");
            typeSet.add(split[1]);
        }
        request.getSession().setAttribute("types", typeSet);
        return typeSet;
    }


    /**
     * 展示图片的详细信息
     * @param request
     * @return
     */
    @RequestMapping("/showFileInfo")
    @ResponseBody
    public List<FileInfo> showFileInfo(HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("username");
        String path = request.getSession().getServletContext().getRealPath("/uploads/"+username);
        File fileFiles = new File(path);

        File[] files = fileFiles.listFiles();

        List<FileInfo> fileInfos = new ArrayList<>();

        long time;
        Date date;
        String name,lastTime,type;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (File file : files) {
            //文件名
            name = file.getName();
            //文件修改日期
            time = file.lastModified();
            date = new Date(time);

            lastTime = simpleDateFormat.format(date);
            //文件类型
            type = name.split("\\.")[1];
            switch (type){
                case "png":{
                    type="图片文件(.png)";
                    break;
                }
                case "jpg":{
                    type="图片文件(.jpg)";
                    break;
                }
                case "docx":{
                    type="Microsoft Word 文档";
                    break;
                }
                case "exe":{
                    type="应用程序";
                    break;
                }
                case "pptx":{
                    type="PowerPoint 演示文稿";
                    break;
                }
                case "xml":{
                    type="XML文件";
                    break;
                }
                case "md":{
                    type="Marldown File";
                    break;
                }
                case "rar":{
                    type="压缩文件";
                    break;
                }
                default:{
                    break;
                }
            }
            //文件大小(字节)
            String size=(file.length()/1024)+"";
            fileInfos.add(new FileInfo(name,lastTime,type,size));
        }

        request.getSession().setAttribute("fileInfos", fileInfos);
        return fileInfos;
    }


    /**
     * 根据文件名删除文件
     * @param setFileName
     */
    @RequestMapping("/deleteFile")
    @ResponseBody
    public void deleteFile( String setFileName,HttpServletRequest request){
        System.out.println("deleteFile删除文件....");
        String username = (String) request.getSession().getAttribute("username");
        String path = request.getSession().getServletContext().getRealPath("/uploads/"+username+"/");
        /**
         * setFileName是name1-name2-name3....的格式
         */
        String[] split = setFileName.split("-");
        File file;
        String filePath;
        /**
         * 逐个删除
         */
        for (String str : split) {
            filePath=path+str;
            file=new File(filePath);
            file.delete();
        }
        return;
    }
}
