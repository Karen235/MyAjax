<%@ WebHandler Language="C#" Class="GetTable" %>

using System;
using System.Web;

public class GetTable : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");


        SetTable_Xml(context);
        //SetTable(context);
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    private void SetTable(HttpContext context)
    {

        string table = @" <table>
        <tr>
           <th>標題</th>
       </tr>
       <tr>
           <td>資料</td>
       </tr>
   </table>  
";

        context.Response.Write(table);
        
    }


    private void SetTable_Xml(HttpContext context)
    {

        System.Xml.Linq.XElement table = new System.Xml.Linq.XElement("table");

        System.Xml.Linq.XElement tr = new System.Xml.Linq.XElement("tr");
        System.Xml.Linq.XElement th = new System.Xml.Linq.XElement("th", "標題");
        System.Xml.Linq.XElement td = new System.Xml.Linq.XElement("td", "資料");
        table.Add(tr);
        tr.Add(th);
        tr.Add(td);
        //context.Response.Write("<table><tr><th>title</th><td>data</td></tr></table>");
        context.Response.Write(table.ToString());

    }
    
}