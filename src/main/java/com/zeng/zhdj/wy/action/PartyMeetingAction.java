package com.zeng.zhdj.wy.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zeng.zhdj.unity.RemoveRepeatingElements;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.zeng.zhdj.unity.DateUnti;
import com.zeng.zhdj.unity.UUIDTool;
import com.zeng.zhdj.wy.entity.ApiResponse;
import com.zeng.zhdj.wy.entity.CreateQRCode;
import com.zeng.zhdj.wy.entity.MeetingComment;
import com.zeng.zhdj.wy.entity.MeetingFile;
import com.zeng.zhdj.wy.entity.MeetingPeople;
import com.zeng.zhdj.wy.entity.MeetingSignRecord;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.UserMessage;
import com.zeng.zhdj.wy.entity.vo.MeetingVo;
import com.zeng.zhdj.wy.entity.PartyBranchMeeting;
import com.zeng.zhdj.wy.entity.PartyMeetingResponse;
import com.zeng.zhdj.wy.entity.vo.MeetingCountVo;
import com.zeng.zhdj.wy.entity.vo.PartyMeetingVo;
import com.zeng.zhdj.wy.entity.vo.PersonalMeetingVo;
import com.zeng.zhdj.wy.exception.CustomException;
import com.zeng.zhdj.wy.service.MeetingSignService;
import com.zeng.zhdj.wy.service.PartyMeetingService;

//党员会议控制层
@Controller
@RequestMapping("meeting")
public class PartyMeetingAction extends BaseExceptionHandleAction {

    @Autowired
    private PartyMeetingService service;
    @Autowired
    private MeetingSignService signService;

    /**
     * @param meeting
     * @param starttime
     * @param endtime
     * @param signStarttime
     * @param signEndtime
     * @return
     * @throws ParseException  Description:新增会议
     * @throws WriterException
     * @author:HAO
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse addMeeting(PartyBranchMeeting meeting, String starttime,
                                  String endtime, String signStarttime, String signEndtime,
                                  @RequestParam("ids") String[] ids, @RequestParam("type") int type)
            throws ParseException, WriterException {
        System.out.println("好棒棒哦！找到了！");

        ApiResponse response = null;
        // 上传路径
        String imgUploadUrl = "/zhdj/" + "upload/files/meetingSign/";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        // 生成uuid
        String UUID = UUIDTool.getUUID();
        meeting.setEndTime(sdf.parse(endtime));// 会议结束时间
        meeting.setSignStartTime(sdf.parse(signStarttime));// 签到开始时间
        meeting.setSignEndTime(sdf.parse(signEndtime));// 签到结束时间
        meeting.setStartTime(sdf.parse(starttime));// 会议开始时间
        meeting.setUuid(UUID);// uuid
        meeting.setType(type);// 会议类型
        // meeting.setSignCode(imgUploadUrl+UUID+".png");//二维码路径
        JSONArray json = new JSONArray();

        System.out.println("--------->>>>添加开会的人员的id:"+ids.toString());
        RemoveRepeatingElements removeRepeatingElements=new RemoveRepeatingElements();
        String[] idList=removeRepeatingElements.remove(ids);
        // 生成二维码
        // CreateQRCode.main("http://localhost//:8080/zhdj/base/goURL/weixin/mtSign?uuid="+UUID);//微信扫码签到，记得改成公网域名
        if (idList.length != 0) {// 根据id获取用户信息
            for (int i = 0; i < idList.length; i++) {
                if (idList[i] != "") {
                    try {
                        UserMessage user = service.getUserMessageById(Integer
                                .parseInt(idList[i]));
                        if (user != null) {
                            json.add(user);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    // json.add(user);
                }
            }
        }
        meeting.setArriveNumber(json.size());
        System.out.println("-----++++++Meeting的值："+meeting.toString());


        System.out.println(json.toString());

        if (service.addMeeting(meeting) == 1) {
            int meetingId = service.getMeetingByuuid(meeting.getUuid()).getId();
            // 批量添加参会人员
            if (addArrivePeople(json.toString(), type, meetingId,
                    meeting.getStartTime()) == 1) {
                response = new ApiResponse(1, "操作成功");
            } else {
                return new ApiResponse(0, "操作失败");
            }
        } else {
            response = new ApiResponse(0, "操作失败");
        }
        return response;
    }

    /**
     * @param meeting
     * @return Description:编辑会议
     * @author:HAO
     */
    @RequestMapping(value = "modify", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse editMeeting(PartyBranchMeeting meeting) {
        ApiResponse response = null;
        if (service.editMeeting(meeting) == 1) {
            response = new ApiResponse(1, "操作成功");
        } else {
            response = new ApiResponse(0, "操作失败");
        }
        return response;
    }

    /**
     * @return Description:删除会议
     * @author:HAO
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse deleteMeeting(@RequestParam("meetingId") int meetingId) {
        ApiResponse response = null;
        Map<String, Object> map = new HashMap<>();
        map.put("meetingId", meetingId);
        List<MeetingFile> list = service.getFileUrl(map);
        for (int i = 0; i < list.size(); i++) {
            File file = new File(list.get(i).getFile());
            file.delete();
        }

        if (service.deleteMeeting(meetingId) == 1
                && service.deleteArrivePeople(meetingId) >= 0
                && service.deleteComment(meetingId) >= 0
                && service.deleteFileByMeetId(meetingId) >= 0
                && service.deletePeopleByMeetingId(meetingId) >= 0) {
            response = new ApiResponse(1, "操作成功");
        } else {
            response = new ApiResponse(0, "操作失败");
        }
        return response;
    }

    // 批量添加参会人员
    public int addArrivePeople(String jsonArray, int type, int meetingId,
                               Date startTime) {
        System.out.println("批量添加参会人员！");
        int result = 0;
        // 将json形式字符串转换成jsonArray
        JSONArray json = JSONArray.parseArray(jsonArray);
        List<MeetingPeople> peopleList = new ArrayList<>();
        List<MeetingSignRecord> signList = new ArrayList<>();
        // 将jsonArray转换成object
        peopleList = JSONObject
                .parseArray(json.toString(), MeetingPeople.class);
        for (MeetingPeople people : peopleList) {
            people.setMeetingId(meetingId);
            people.setType(type);
            people.setStartTime(startTime);
            // 封装初始签到记录
            MeetingSignRecord signRecord = new MeetingSignRecord();
            signRecord.setMeetingId(meetingId);// 会议id
            signRecord.setSignPeople(people.getArrivePeople());// 参会人姓名
            signRecord.setSignPeoplePhone(people.getArrivePeoplePhone());// 参会人手机号
            signRecord.setStatus(0);// 签到状态
            signRecord.setType(type);// 会议类型
            signRecord.setStartTime(startTime);// 会议开始时间
            signList.add(signRecord);
        }
        service.addSignPeopleBatch(signList);

        // 批量添加参会人员和添加初始签到记录
        if (service.addArrivePeopleBatch(peopleList) == 1) {
            result = 1;
        } else {
            result = 1;
        }
        return result;
    }

    /**
     * @param page
     * @param rows
     * @param orgId
     * @return Description:后台获取会议
     * @author:HAO
     */
    @RequestMapping(value = "backGetMeeting", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> backStageGetMeeting(int page, int rows, int orgId) {
        Map<String, Object> jo = new HashMap();
        if (page == 0) {
            page = 1;
        }
        if (rows == 0) {
            rows = 10;
        }
        Map<String, Object> map = new HashMap<>();
        map.put("orgId", orgId);
        map.put("start", (page - 1) * 10);
        map.put("pagesize", rows);
        List<PartyBranchMeeting> list = new ArrayList<>();
        list = service.backStageGetMeeting(map);
        Date now = new Date();
        // 将date类型日期转换成字符串
        for (int i = 0; i < list.size(); i++) {
            PartyBranchMeeting meeting = list.get(i);
            meeting.setAStartTime(DateUnti.dateToStr(
                    list.get(i).getStartTime(), 12));
            meeting.setAEndTime(DateUnti
                    .dateToStr(list.get(i).getEndTime(), 12));
            meeting.setASignStartTime(DateUnti.dateToStr(list.get(i)
                    .getSignStartTime(), 12));
            meeting.setASignEndTime(DateUnti.dateToStr(list.get(i)
                    .getSignEndTime(), 12));
            meeting.setOrgName(service
                    .getOrgNameByOrgId(list.get(i).getOrgId()));
            ;
            if (now.compareTo(meeting.getEndTime()) > 0) {
                meeting.setStatus("已结束");
            } else {
                meeting.setStatus("未结束");
            }
        }
        int meetingCount = service.getMeetingCount(orgId);
        jo.put("total", meetingCount);
        jo.put("rows", list);
        return jo;

    }

    /**
     * @param arrivePeoplePhone
     * @param type
     * @param request
     * @return Description:用户获取会议
     * @author:HAO
     */
    @RequestMapping(value = "userGetMeeting", method = RequestMethod.POST)
    @ResponseBody
    public MeetingVo appGetMeeting(
            @RequestParam("arrivePeoplePhone") String arrivePeoplePhone,
            @RequestParam("type") int type, @RequestParam("start") int start,
            HttpServletRequest request) {
        String basePath = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort();
        MeetingVo response = null;
        Map<String, Object> map = new HashMap<>();
        map.put("arrivePeoplePhone", arrivePeoplePhone);// 用户手机
        map.put("type", type);// 会议类型
        map.put("start", (start - 1) * 10);// 页数
        List<PartyBranchMeeting> list = new ArrayList<>();
        List<Integer> idList = service.getMeetingIdByPhone(map);// 会议id集合
        if (idList.size() != 0) {
            for (int id : idList) {
                PartyBranchMeeting meeting = service.getMeetingById(id);// 根据会议id获取会议
                if (meeting != null) {
                    // meeting.setSignCodeUrl(basePath+meeting.getSignCode());//二维码路径
                    meeting.setAEndTime(DateUnti.dateToStr(
                            meeting.getEndTime(), 12));// 会议结束时间
                    meeting.setAStartTime(DateUnti.dateToStr(
                            meeting.getStartTime(), 12));// 会议开始时间
                    meeting.setASignStartTime(DateUnti.dateToStr(
                            meeting.getSignStartTime(), 12));// 签到开始时间
                    meeting.setASignEndTime(DateUnti.dateToStr(
                            meeting.getSignEndTime(), 12));// 签到结束时间
                    if (meeting.getEndTime().compareTo(new Date()) < 0) {// 判断是否已结束
                        meeting.setStatus("已结束");
                    } else {
                        meeting.setStatus("未结束");
                    }
                    list.add(meeting);
                }
            }
            int count = service.getPersonalCount(map);
            response = new MeetingVo(1, list, "获取成功");
            response.setCount(count);// 会议数量
        } else {
            response = new MeetingVo(0, new ArrayList(), "无数据");
        }
        return response;
    }

    /**
     * @param meetingFile
     * @param files
     * @param imgs
     * @param request
     * @return Description:上传大会附件图片
     * @throws ParseException
     * @throws IOException
     * @throws IllegalStateException
     * @author:HAO
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse uploadFileAndImg(MeetingFile meetingFile,
                                        @RequestParam("files") MultipartFile[] files,
                                        @RequestParam("imgs") MultipartFile[] imgs,
                                        HttpServletRequest request) throws ParseException,
            IllegalStateException, IOException {
        ApiResponse response = null;
        // 上传附件，图片
        meetingFile.setImg(uploadFiles(imgs, request));
        meetingFile.setFile(uploadFiles(files, request));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        meetingFile.setUploadtime(new Date());
        if (service.uploadFileAndImg(meetingFile) == 1) {
            response = new ApiResponse(1, new ArrayList(), "上传成功");
        } else {
            response = new ApiResponse(0, new ArrayList(), "上传失败");
        }
        return response;
    }

    // 上传图片或附件
    public String uploadFiles(MultipartFile[] files, HttpServletRequest request)
            throws IllegalStateException, IOException {
        // 上传路径
        String imgUploadUrl = "C:\\ZHDJ\\upload\\meetfile\\";
        StringBuilder sb = new StringBuilder();
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                saveFile(file, request);
                if (file == files[files.length - 1]) {
                    sb.append(imgUploadUrl + file.getOriginalFilename());
                } else {
                    sb.append(imgUploadUrl + file.getOriginalFilename() + ",");
                }
            }
        }
        return sb.toString();
    }

    /**
     * @param file
     * @return Description:保存文件
     * @throws IOException
     * @throws IllegalStateException
     * @author:HAO
     */
    public boolean saveFile(MultipartFile file, HttpServletRequest request)
            throws IllegalStateException, IOException {
        // 保存到服务器的路径

        String savedirpath = "C:\\ZHDJ\\upload\\meetfile";
        if (!file.isEmpty()) {
            File savedir = new File(savedirpath);
            if (!savedir.exists()) {
                savedir.mkdirs();
            }
            // 文件保存路径
            String filePath = savedirpath + File.separator
                    + "\\" + file.getOriginalFilename();
            // 转存文件
            file.transferTo(new File(filePath));
            return true;

        }
        return false;
    }

    /**
     * 从服务器中下载图片
     *
     * @param
     * @param response
     * @return
     */
    @RequestMapping(value = "/download")
    public void downloadMedia(HttpServletResponse response,
                              HttpServletRequest request, @RequestParam("url") String url) {
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            // 处理中文乱码
            request.setCharacterEncoding("UTF-8");
            String fileName = url;
            fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
            // 处理浏览器兼容
            response.setContentType("application/msexcel;charset=utf-8");// 定义输出类型
            Enumeration enumeration = request.getHeaders("User-Agent");
            String browserName = (String) enumeration.nextElement();
            boolean isMSIE = browserName.contains("MSIE");
            if (isMSIE) {
                response.addHeader(
                        "Content-Disposition",
                        "attachment;fileName="
                                + URLEncoder.encode(fileName, "UTF8"));
            } else {
                response.addHeader(
                        "Content-Disposition",
                        "attachment;fileName="
                                + new String(fileName.getBytes("gb2312"),
                                "ISO8859-1"));
            }
            // url地址如果存在空格，会导致报错！ 解决方法为：用+或者%20代替url参数中的空格。
            fileName = fileName.replace(" ", "%20");
            // 图片下载
            URL imageurl = new URL(fileName);
            URLConnection conn = imageurl.openConnection();
            outputStream = response.getOutputStream();
            inputStream = conn.getInputStream();
            IOUtils.copy(inputStream, outputStream);
        } catch (IOException e) {
            System.err.println(e);
        } finally {
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(outputStream);
        }
    }

    /**
     * @param meetingId
     * @param request
     * @return Description:app获取附件路径
     * @author:HAO
     */
    @RequestMapping(value = "getFileUrl", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse getMeetingFileAndImg(int meetingId,
                                            HttpServletRequest request) {
        ApiResponse response = null;
        Map<String, Object> map = new HashMap<>();
        map.put("meetingId", meetingId);
        // map.put("start", (start-1)*10);
        // 访问文件路径
        String basePath = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort() + "/zhdj/upload/files/meeting/";
        List<MeetingFile> list = service.getFileUrl(map);
        if (list.size() != 0) {
            for (MeetingFile file : list) {
                file.setFile(basePath + file.getFile().substring(24));// 文件路径
                file.setImg(basePath + file.getImg());// 图片路径
                file.setUploadTime(DateUnti.dateToStr(file.getUploadtime(), 12));// 上传时间
            }
            response = new ApiResponse(1, list, "获取成功");
        } else {
            response = new ApiResponse(0, new ArrayList(), "无数据");
        }
        return response;

    }

    /**
     * @param orgId
     * @return Description:获取已结束的会议
     * @author:HAO
     */
    @RequestMapping(value = "getEndMeeting", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getEndMeeting(int orgId, int page, int rows) {
        Map<String, Object> jo = new HashMap();
        Map<String, Object> map = new HashMap<>();
        map.put("orgId", orgId);
        map.put("start", (page - 1) * 10);
        map.put("pagesize", rows);
        List<PartyBranchMeeting> list = service.getEndMeeting(map);
        // 将date类型日期转换成字符串
        int listCount = list.size();
        for (int i = 0; i < listCount; i++) {
            PartyBranchMeeting meeting = list.get(i);
            meeting.setAStartTime(DateUnti.dateToStr(meeting.getStartTime(), 12));
            meeting.setAEndTime(DateUnti.dateToStr(meeting.getStartTime(), 12));
        }
        jo.put("total", list.size());
        jo.put("rows", list);
        return jo;
    }

    /**
     * @param id
     * @return Description:根据会议id获取会议
     * @author:HAO
     */
    @RequestMapping(value = "getMeetingById", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse getMeetingById(int id) {
        ApiResponse response = null;
        PartyBranchMeeting meeting = service.getMeetingById(id);
        if (meeting != null) {
            meeting.setAStartTime(DateUnti.dateToStr(meeting.getStartTime(), 12));// 把时间戳转化为特定格式给前端展示
            meeting.setAEndTime(DateUnti.dateToStr(meeting.getEndTime(), 12));
            meeting.setASignStartTime(DateUnti.dateToStr(
                    meeting.getSignStartTime(), 12));
            meeting.setASignEndTime(DateUnti.dateToStr(
                    meeting.getSignEndTime(), 12));

            response = new ApiResponse(1, meeting, "获取成功");
        } else {
            response = new ApiResponse(0, "无该会议");
        }
        return response;
    }

    @RequestMapping(value = "getSign", method = RequestMethod.GET)
    public void getMeetingQRSign(String url, HttpServletResponse response)
            throws IOException {
        if (url != null && !"".equals(url)) {
            // 图片大小
            int width = 300;
            int height = 300;
            ServletOutputStream stream = null;
            try {
                stream = response.getOutputStream();
                QRCodeWriter writer = new QRCodeWriter();
                BitMatrix m = writer.encode(url, BarcodeFormat.QR_CODE, height,
                        width);
                MatrixToImageWriter.writeToStream(m, "png", stream);

            } catch (WriterException e) {
                e.printStackTrace();
                System.out.println("生成二维码失败!");
            } finally {
                if (stream != null) {
                    stream.flush();
                    stream.close();
                }
            }
        }
    }

}
