<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DepotSo.aspx.cs" Inherits="DepotSo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="Script/jquery-1.11.2.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="btnCreateSO" type="button" value="Server Create Data  (WebMethod)" />
         <input id="btnGetSO" type="button" value="Client Post Data (WebMethod)" />
          <input id="btnGetSOAshxPost" type="button" value="Client Post Data(ashx post)" />
          <input id="btnGetSOAshxGet" type="button" value="Client Post Data(ashx Get)" />
    </div>
    </form>


   <script type="text/javascript">
       $(function () {

           $('#btnCreateSO').click(function () {
               $.ajax(
                    {
                        type: "post",
                        url: 'DepotSo.aspx/CreateSO',
                        contentType: "application/json; charset=utf-8",
                        datatype: 'json',
                        success: function (response) {

                            console.log(response);

                            obj = JSON.parse(response.d);// 將JSON格式資料轉為物件
                            console.log(obj.so);
                            console.log(obj.GetInDate);
                            console.log(obj.Quantity);
                        },
                        failure: function (response) { alert(response.d); }

                    }
                   );
           });



           $('#btnGetSO').click(function () {

               var obj = [
   {
       'so': 'Product 1',
       'GetInDate': '2000-12-29T00:00Z',
       'Quantity': 99

   },
    {
        'so': 'Product 2',
        'GetInDate': '2015-12-29T00:00Z',
        'Quantity': 80

    }
               ];
               //var objData = '{ date: "2015-03-10", time: "09:55" }';
               //var str = $.stringify(objData);

               $.ajax(
                   {
                       type: "post",
                       url: 'DepotSo.aspx/ReadSO',
                       contentType: "application/json; charset=utf-8",
                       datatype: 'json',
                       data: JSON.stringify({ mySoData: obj }),//web method須傳入對應DepotSo.aspx/ReadSO參數名(參數名mySoData)
                       success: function (response) {
                           console.log(response.d);
                       }
                   }
                   );
           });



           $('#btnGetSOAshxPost').click(function () {

               var ary=[];

               var soData1 = new Object();
               soData1.so = "001";
               soData1.GetInDate = "2015-01-01";
               soData1.Quantity = 2;
               ary.push(soData1);

               var soData2 = new Object();
               soData2.so = "002";
               soData2.GetInDate = "2016-01-01";
               soData2.Quantity = 4;
               ary.push(soData2);

               $.ajax(
                   {
                       type: "post",
                       url: 'DepotSo.ashx',
                       data: JSON.stringify(ary),//寫法a  : ashx不須傳入參數名，直接以陣列轉成json，server以HttpContext.Current.Request.InputStream 取值
                       //data:{JsonData:JSON.stringify(ary)},
                       success: function (response) {
                           console.log(response);
                       }
                   }
                   );
           });


           $('#btnGetSOAshxGet').click(function () {

               var ary = [];

               var soData1 = new Object();
               soData1.so = "001";
               soData1.GetInDate = "2015-01-01";
               soData1.Quantity = 2;
               ary.push(soData1);

               var soData2 = new Object();
               soData2.so = "002";
               soData2.GetInDate = "2016-01-01";
               soData2.Quantity = 4;
               ary.push(soData2);

               $.ajax(
                   {
                       type: "get",
                       url: 'DepotSo.ashx',
                       data: { JsonData: JSON.stringify(ary) },//後端用Request.QueryString["JsonData"]接值
                       //data:{JsonData:JSON.stringify(ary)},
                       success: function (response) {
                           console.log(response);
                       }
                   }
                   );
           });


       })

   </script>
</body>

    
</html>
