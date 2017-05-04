using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;

public partial class DepotSo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod]
    public static string CreateSO()
    {
        SoData mySoData = new SoData();
        mySoData.so = "001";
        mySoData.GetInDate =  DateTime.Parse("2015-01-01");
        mySoData.Quantity = 2;


        string jsonformat = JsonConvert.SerializeObject(mySoData);

        return jsonformat;
    }


    [WebMethod]
    public static string ReadSO( List<SoData> mySoData)
    {
//        string json = @"[
//   {
//     'so': 'Product 1',
//     'GetInDate': '2000-12-29T00:00Z',
//     'Quantity': 99
//     
//   },
//    {
//     'so': 'Product 1',
//     'GetInDate': '2000-12-29T00:00Z',
//     'Quantity': 99
//     
//   }
//        ]";


        //List<SoData> mySoData = JsonConvert.DeserializeObject<List<SoData>>(json);
        //string jsonformat = JsonConvert.SerializeObject(mySoData);
        
        //return mySoData.Count.ToString();

        return mySoData[1].so.ToString();
    }

}