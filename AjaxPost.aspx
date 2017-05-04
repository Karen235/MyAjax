<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxPost.aspx.cs" Inherits="AjaxPost" %>

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
    
    </div>
    </form>
    <script type="text/javascript">
        $(function () {

            $.post('AjaxPost.ashx', { time: '2015/03/11' },
                 function (response) {
                     console.log(response);
                 }

             );

        });

    </script>

</body>
</html>
