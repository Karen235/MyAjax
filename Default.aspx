<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
        <input id="Button4" type="button" value="button" />
    </div>
    </form>


    <script type="text/javascript">


        $('#Button4').click(function () {

            var objData = '{ date: "2015-03-10", time: "09:55" }';


            $.ajax(
                 {
                     type: "post",
                     url: 'Default.aspx/GetTime_Param',
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
    </script>
</body>
</html>
