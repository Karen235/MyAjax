<%@ WebHandler Language="C#" Class="MyTime" %>

using System;
using System.Web;

public class MyTime : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //context.Response.Write( DateTime.Now.ToString());
        context.Response.Write(GetTime());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }



    private string GetTime() {

        string time = HttpContext.Current.Request.QueryString["time"];

        return time;
    } 

}