<%@ WebHandler Language="C#" Class="ResponseJson" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Collections.Generic;

public class ResponseJson : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        CreateSo();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }



    private void CreateSo() {

        List<SoData> soData = new List<SoData>();
        
        SoData SoData1 = new SoData();
        SoData1.so = "001";
        SoData1.GetInDate = DateTime.Parse("2015-01-01");
        SoData1.Quantity = 2;

        SoData SoData2 = new SoData();
        SoData2.so = "002";
        SoData2.GetInDate = DateTime.Parse("2015-03-01");
        SoData2.Quantity = 20;


        soData.Add(SoData1);
        soData.Add(SoData2);


        string jsonformat = JsonConvert.SerializeObject(soData);
        //HttpContext.Current.Response.ContentType = "application/json";
        //HttpContext.Current.Response.Write(jsonformat);
         string callback =  HttpContext.Current.Request["callback"];

         HttpContext.Current.Response.Write(callback +"(" +  jsonformat + ")");


    }

}