<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetTable.aspx.cs" Inherits="GetTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="Script/jquery-1.11.2.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        
        <input id="Button2" type="button" value="ahsx" />
         <input id="Button3" type="button" value="ahsx 傳參數" />
        <input id="Button1" type="button" value="web service" />
         

    <div id="Container">
    
    </div>
    </form>

    <script  type="text/javascript">

        $('#Button2').click(function () {
            $.get('GetTable.ashx', function (response) {
                //console.log(response);
                $('#Container').empty();
                $('#Container').html(response);
            });
        });

        $('#Button2').click(function () {
            $.get('GetTable.ashx', function (response) {
                //console.log(response);
                $('#Container').empty();
                $('#Container').html(response);
            });
        });

       
        //web sservice --> post +json 
        $('#Button1').click(function () {
            $.ajax({
                type: "post",
                url: "GetTable.aspx/SetTable",
                contentType: "application/json; charset=utf-8",
                dataType: "json",  
                success: function (response) {
                    $('#Container').empty();
                    $('#Container').html(response.d);
                },
                failure: function (response) { alert(response.d); }
            });
        });


     


    </script>


    

</body>
</html>
