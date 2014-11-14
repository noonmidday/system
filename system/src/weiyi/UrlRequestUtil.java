package weiyi;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;

public class UrlRequestUtil
{
  String result = "";
  String end = "\r\n";
  String twoHyphens = "--";
  String boundary = "*****";
  URL submit = null;
  JSONObject json = null;

  public JSON uploadmedia(String fileType, String access_token, String filename, File file, String content_type, String filePath)
  {
    String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=" + access_token + "&type=" + 
      fileType;
    try {
      this.submit = new URL(requestUrl);
      HttpURLConnection conn = (HttpURLConnection)this.submit
        .openConnection();
      conn.setDoInput(true);
      conn.setDoOutput(true);
      conn.setUseCaches(false);

      conn.setRequestMethod("POST");
      conn.setRequestProperty("Connection", "Keep-Alive");
      conn.setRequestProperty("Content-Type", 
        "multipart/form-data;boundary=" + this.boundary);

      DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
      dos.writeBytes(this.twoHyphens + this.boundary + this.end);
      dos.writeBytes("Content-Disposition: form-data; name=\"" + file + 
        "\";filename=\"" + filename + ";filelength=\"" + filePath + 
        ";Content-Type=\"" + content_type + this.end);
      dos.writeBytes(this.end);

      FileInputStream fis = new FileInputStream(file);
      byte[] buffer = new byte[14336];
      int count = 0;
      while ((count = fis.read(buffer)) != -1) {
        dos.write(buffer, 0, count);
      }
      fis.close();

      dos.writeBytes(this.end);
      dos.writeBytes(this.twoHyphens + this.boundary + this.twoHyphens + this.end);
      dos.flush();

      InputStream is = conn.getInputStream();
      InputStreamReader isr = new InputStreamReader(is, "utf-8");
      BufferedReader br = new BufferedReader(isr);
      this.result = br.readLine();
      dos.close();
      is.close();
    }
    catch (Exception e) {
      e.printStackTrace();
      System.out.println("与服务器连接发生异常错误:" + e.toString());
      System.out.println("连接地址是:" + requestUrl);
    }
    System.out.println("result:" + this.result);

    return this.json;
  }

  public String Post_JSON() {
    String value = "";
    JSONObject json_caidan1 = new JSONObject();
    JSONObject json_caidan2 = new JSONObject();
    JSONObject json_caidan3 = new JSONObject();
    JSONObject json_all = new JSONObject();
    json_caidan1.put("type", "view");
    json_caidan1.put("name", "百度");
    json_caidan1.put("url", "http://www.baidu.com");
    JSONArray json_array = new JSONArray();
    json_array.add(json_caidan1);
    json_caidan2.put("type", "view");
    json_caidan2.put("name", "谷歌");
    json_caidan2.put("url", "http://www.google.com.hk");
    json_array.add(json_caidan2);
    json_caidan3.put("type", "view");
    json_caidan3.put("name", "涛的射区");
    json_caidan3.put("url", "http://wx.wsq.qq.com/234286020");
    json_array.add(json_caidan3);
    json_all.put("button", json_array);
    System.out.println(json_all);
    String url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=eVZ36-xeQ2WWprBO2HUeD0b6ONtqxEQ6fYJisqjhfB8kAzElx4BfYDg3MXoW0dHhR7Xt2a5rKtbZRM6-s5tX1w";
    HttpClient httpClient = new HttpClient();

    PostMethod postMethod = new PostMethod(url);

    postMethod.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
    postMethod.setRequestHeader("Accept-Language", 
      "zh-CN,zh;q=0.8;charset=utf-8");
    postMethod.setRequestHeader("Connection", 
      "keep-alive");
    postMethod.setRequestHeader("User-Agent", 
      "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.132 Safari/537.36 OPR/21.0.1432.67");
    try
    {
      postMethod.setRequestEntity(new StringRequestEntity(json_all.toString(), 
        "text/xml", "UTF-8"));

      httpClient.executeMethod(postMethod);

      InputStream inputStream = postMethod.getResponseBodyAsStream();
      BufferedReader bufferedReader = new BufferedReader(
        new InputStreamReader(inputStream, "utf-8"));
      StringBuffer stringBuffer = new StringBuffer();
      String s = "";
      while ((s = bufferedReader.readLine()) != null) {
        stringBuffer.append(s + "\n");
      }
      value = stringBuffer.toString();

      inputStream.close();
      bufferedReader.close();

      postMethod.releaseConnection();
    }
    catch (HttpException e) {
      e.printStackTrace();
    }
    catch (IOException e) {
      e.printStackTrace();
    }

    return value;
  }

  public static void main(String[] args)
  {
    UrlRequestUtil requestUtil = new UrlRequestUtil();
    System.out.println("content:\n" + requestUtil.Post_JSON());
  }
}