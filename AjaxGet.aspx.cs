using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class Script_AjaxGet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetTime() 
    {

        return DateTime.Now.ToString();
    }

    [WebMethod]
    public static string GetTime_Param(string date, string time)
    {

        return date + '/' + time;
    }
}