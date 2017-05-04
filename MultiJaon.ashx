<%@ WebHandler Language="C#" Class="MultiJaon" %>

using System;
using System.Web;
using System.Runtime.Serialization.Json;
using System.Collections;
using System.Collections.Generic;
public class MultiJaon : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string id = context.Request["id"];
        string name = context.Request["name"];
        string work = context.Request["work"];
        result rlt = new result() { id = id, name = name, work = new List<work>() { new work {  work1=work} } } ;
        DataContractJsonSerializer json = new DataContractJsonSerializer(rlt.GetType());
        json.WriteObject(context.Response.OutputStream, rlt);

    }


    public class result {

        public string id { get; set; }
        public string name { get; set; }
        public List<work> work { get; set; }

    }

    public class work {
        public string work1 { get; set; }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}