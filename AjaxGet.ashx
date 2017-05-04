<%@ WebHandler Language="C#" Class="AjaxGet" %>

using System;
using System.Web;

public class AjaxGet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //Get 方式需要使用 Request.QueryString 来取得变量的值；而 Post 方式通过 Request.Form 来访问提交的内容
        //用get傳值
        context.Response.Write(context.Request.QueryString["date"]+"/"+context.Request.QueryString["time"] );
      

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}