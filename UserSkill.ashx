<%@ WebHandler Language="C#" Class="UserSkill" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
public class UserSkill : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");


        string arrary = context.Request.QueryString["arrary"];

        List<User> _User = JsonConvert.DeserializeObject<List<User>>(arrary);

        context.Response.Write(_User[0].UserName + "" + _User[0].Skill[0]);
    }



    public class User {

        public string UserName { get; set; }
        public List<string> Skill { get; set; }


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}