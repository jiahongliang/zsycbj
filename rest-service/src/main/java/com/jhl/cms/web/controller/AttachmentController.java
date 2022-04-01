package com.jhl.cms.web.controller;

import com.jhl.cms.entity.CmsAttachment;
import com.jhl.cms.repository.CmsAttachmentRepository;
import com.jhl.cms.web.msg.WebResp;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;
import java.util.UUID;

/**
 * 附件管理控制类
 *
 * @author
 */
@Slf4j
@RestController
@RequestMapping(value = "attachment")
public class AttachmentController {
    @Value("${attachment.upload.path}")
    private String storePath;

    @Autowired
    private CmsAttachmentRepository attachmentRepository;

    @RequestMapping(value = "upload", method = {RequestMethod.POST})
    public WebResp<CmsAttachment, Object> upload(HttpServletRequest req) throws IOException {
        WebResp<CmsAttachment, Object> result = new WebResp<>();
        MultipartHttpServletRequest request = (MultipartHttpServletRequest) req;
        String fileName = request.getFileNames().next();
        MultipartFile mFile = request.getFile(fileName);
        if (null == mFile || mFile.isEmpty()) {
            result.setCode(10004);
            result.setMsg("文件上传参数不能为空");
            return result;
        }

        //文件名称
        String randomName = System.currentTimeMillis() + "_" + UUID.randomUUID().toString();
        //文件原名称
        String originalFilename = mFile.getOriginalFilename();
        //原文件名
        String aloneName = originalFilename.substring(0, originalFilename.lastIndexOf("."));
        //文件后缀
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1, originalFilename.length());
        //存储文件名称
        String newFileName = randomName + "." + suffix;
        //Content-Type
        String contentType = mFile.getContentType();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String path = sdf.format(Calendar.getInstance().getTime());

        Map<String, String[]> params = request.getParameterMap();
        String[] nameArr = params.get("name");
        String name = aloneName;
        if (null != nameArr && nameArr.length > 0 && StringUtils.isNotBlank(nameArr[0])) {
            name = nameArr[0];
        }

        CmsAttachment attachment = new CmsAttachment();
        attachment.setFileName(newFileName);
        attachment.setOriginName(originalFilename);
        attachment.setContentType(contentType);
        attachment.setExtName(suffix);
        attachment.setFilePath(path);
        attachmentRepository.save(attachment);

        String separator = File.separator;
        //打开FileOutStrean流
        FileOutputStream fos = FileUtils.openOutputStream(new File(storePath + separator + path + separator + newFileName));
        IOUtils.copy(mFile.getInputStream(), fos);
        fos.close();

        result.getRows().add(attachment);

        return result;
    }

    @GetMapping("get/{id}")
    public void getResourceById(@PathVariable(value = "id") String id, HttpServletResponse res) {
        if (StringUtils.isNotBlank(id)) {
            CmsAttachment attachement = attachmentRepository.getById(Long.valueOf(id));
            String downLoadName = attachement.getOriginName();
            outStream(res, attachement.getFilePath(), attachement.getFileName(), downLoadName);
        }
    }

    /**
     * 下载资源文件
     *
     * @param res          response
     * @param storeName    文件系统文件名
     * @param downLoadName 要下载的文件名称
     */
    private void outStream(HttpServletResponse res, String path, String storeName, String downLoadName) {
        File file = new File(storePath + File.separator + path + File.separator + storeName);
        if (file.exists()) {
            res.setHeader("content-type", "application/octet-stream");
            res.setContentType("application/octet-stream");
            try {
                res.setHeader("Content-Length", String.valueOf(new FileInputStream(file).available()));
                res.setHeader("Content-Disposition", "attachment;filename=" + new String(downLoadName.getBytes("UTF-8"), "iso-8859-1"));
            } catch (UnsupportedEncodingException e1) {
                log.error("编码错误");
                e1.printStackTrace();
            } catch (FileNotFoundException e) {
                log.error("未找到文件");
                e.printStackTrace();
            } catch (IOException e) {
                log.error("其他错误");
                e.printStackTrace();
            }
            byte[] buff = new byte[1024];
            BufferedInputStream bis = null;
            OutputStream os = null;
            try {
                os = res.getOutputStream();
                bis = new BufferedInputStream(new FileInputStream(file));
                int i = bis.read(buff);
                while (i != -1) {
                    os.write(buff, 0, buff.length);
                    os.flush();
                    i = bis.read(buff);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
