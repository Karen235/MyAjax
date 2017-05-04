<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxGet.aspx.cs" Inherits="Script_AjaxGet" %>

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
        <input id="Button1" type="button" value="Get ashx(1)" />
         <input id="Button3" type="button" value="Get ashx(2)" />
         <input id="Button2" type="button" value="web service" />
           <input id="Button4" type="button" value="web service 傳參數" />
    </div>
    </form>


    <script type="text/javascript">

        $(function () {


            //寫法一
            ////$.get字串 傳參數
           

            $('#Button3').click(function () {

                $.get('AjaxGet.ashx', { date: '2015/03/11' },
                     function (response) {
                         console.log(response);
                     }

                 );
            });


            //寫法二
            //$.ajax 字串 傳參數
            $('#Button1').click(function () {

                $.ajax({
                    type: "get",
                    url: 'AjaxGet.ashx',
                    data: { date: '2015/03/10',time:'09:55' },
                    success: function (response) {
                        console.log(response);
                    }
                });
            });

         
            //字串
            $('#Button2').click(function () {

                $.ajax(
                     {
                         type: "post",
                         url: 'AjaxGet.aspx/GetTime',
                         contentType: "application/json; charset=utf-8",
                         datatype: 'json',
                         success: function (response) {
                             console.log(response.d);
                         },
                         failure: function (response) { alert(response.d); }
                         
                     }
                    );

            });

                //web service +json+post+parameter
            $('#Button4').click(function () {

                var objData ='{ date: "2015-03-10", time: "09:55" }';
             
            
                $.ajax(
                     {
                         type: "post",
                         url: 'AjaxGet.aspx/GetTime_Param',
                         contentType: "application/json; charset=utf-8",
                         datatype: 'json',
                         data: objData,
                         success: function (response) {
                             console.log(response.d);
                         },
                         failure: function (response) { alert(response.d); }
                         
                     }
                    );

            });

        });
    </script>
</body>
</html>
