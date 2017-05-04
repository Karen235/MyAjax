<%@ WebHandler Language="C#" Class="WebCientJson" %>

using System;
using System.Web;
using System.Net;
using System.Text;
using Newtonsoft.Json;
using System.Collections.Generic;

public class WebCientJson : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
    //    context.Response.ContentType = "text/plain";
    //    context.Response.Write("Hello World");

        GetData();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    
    private void GetData (){

        WebClient client = new WebClient();
        client.Encoding = Encoding.UTF8;
        client.Headers.Add(HttpRequestHeader.ContentType, "application/json");
        var body = client.DownloadString("http://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindAllTypeJ");
        //List<Art> myart = new List<Art>();
        //var ArtData = JsonConvert.DeserializeObject<List<Art>>(body.ToString());

        //HttpContext.Current.Response.ContentType = "text/plain";
        HttpContext.Current.Response.Write(body);
        
    }
    
}