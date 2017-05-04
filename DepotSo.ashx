<%@ WebHandler Language="C#" Class="DepotSo" %>

using System;
using System.Web;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;

public class DepotSo : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       
        //context.Response.Write("Hello World");
          //context.Response.Write(GetSo(context));
        //GetSo();

        GetSO2();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }



    //寫法一
    private void GetSo()
    {

        string strData= string.Empty;
        string count="0";
        string value = "";


        try
        {

       
        using (var reader= new StreamReader(HttpContext.Current.Request.InputStream))
        {
            strData=reader.ReadToEnd();
        }

        if (! string.IsNullOrEmpty(strData))
        {
           List<SoData>   mysoData = JsonConvert.DeserializeObject<List<SoData>>(strData);
           count = mysoData.Count.ToString();
           value = mysoData[0].so;
        }

        HttpContext.Current.Response.ContentType = "text/plain";
        HttpContext.Current.Response.Write(value);
        //return value;

        }
        catch (Exception ex)
        {

            HttpContext.Current.Response.Write(ex.Message);
        }
        
    }





    private void GetSO2() {

        string count = "0";
        string value = "";

        string strData = HttpContext.Current.Request.QueryString["JsonData"];
      if (!string.IsNullOrEmpty(strData))
      {
          List<SoData> mysoData = JsonConvert.DeserializeObject<List<SoData>>(strData);
          count = mysoData.Count.ToString();
          value = mysoData[0].so;
      }

      HttpContext.Current.Response.ContentType = "text/plain";
      HttpContext.Current.Response.Write(value);
    }
    
}