using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class GetTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


  [WebMethod]
    public static string SetTable(){

        System.Xml.Linq.XElement table = new System.Xml.Linq.XElement("table");

        System.Xml.Linq.XElement tr = new System.Xml.Linq.XElement("tr");
        System.Xml.Linq.XElement th = new System.Xml.Linq.XElement("th", "Title");
        System.Xml.Linq.XElement td = new System.Xml.Linq.XElement("td", "Data");
        table.Add(tr);
        tr.Add(th);
        tr.Add(td);
        //context.Response.Write("<table><tr><th>title</th><td>data</td></tr></table>");
        return table.ToString();
  }


  //[WebMethod]
  //public static string SetTable_Param()
  //{

  //    System.Xml.Linq.XElement table = new System.Xml.Linq.XElement("table");

  //    System.Xml.Linq.XElement tr = new System.Xml.Linq.XElement("tr");
  //    System.Xml.Linq.XElement th = new System.Xml.Linq.XElement("th", "a");
  //    System.Xml.Linq.XElement td = new System.Xml.Linq.XElement("td", "b");
  //    table.Add(tr);
  //    tr.Add(th);
  //    tr.Add(td);
  //    //context.Response.Write("<table><tr><th>title</th><td>data</td></tr></table>");
  //    return table.ToString();
  //}
}