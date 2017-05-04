using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class ResponseJson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CreateSo();

        Response.Charset = "utf-8";
        Response.ContentType = "application/json";

        string callback = Request.QueryString["callback"];
        SoData mySoData = new SoData();
        mySoData.so = "001";
        mySoData.GetInDate = DateTime.Parse("2015-01-01");
        mySoData.Quantity = 2;


        string json = JsonConvert.SerializeObject(mySoData);

        //string json = "{'name': '" + Request.QueryString["name"] + "','msg':'hello world!'}";
        //Request.QueryString["callback"] (我的json格式資料)
        string result = string.Format("{0}({1})", callback, json);
        Response.Write(result);
        Response.Flush();
        Response.End();
    }

 
}