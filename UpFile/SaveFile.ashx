<%@ WebHandler Language="C#" Class="SaveFile" %>


using System;
using System.Web;
using System.IO;

public class SaveFile : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string[] fileNameSplit;
        string fileName="";
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                fileNameSplit = file.FileName.Split('\\');
                fileName =fileNameSplit [ fileNameSplit.Length - 1];
                string filePath = context.Server.MapPath("~/Upload/" + fileName);
                file.SaveAs(filePath);
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(fileName+"上傳成功");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}