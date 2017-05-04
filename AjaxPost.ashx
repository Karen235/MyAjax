<%@ WebHandler Language="C#" Class="AjaxPost" %>

using System;
using System.Web;

public class AjaxPost : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //Get獲取方式需要使用的Request.QueryString來取得變量的值;而Post通過的Request.Form來訪問提交的內容
        //用post傳值
        context.Response.Write( context.Request.Form["time"]);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}