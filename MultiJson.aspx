<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultiJson.aspx.cs" Inherits="MultiJson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Script/jquery-1.11.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       ID <input id="txtID" name="ID" type="text" /> Name <input id="txtName" name="Name" type="text" />Work <input id="txtWork" name="Work" type="text" />
        <input id="BtnSend" type="submit" value="submit" />
    </div>

        <div id="result1"></div>
    </form>

     <script type="text/javascript">
         $(function () {
            
             $('#form1').submit(function () {

                 var params = $(this).serialize();

                 $.ajax({
                    
                     type: 'post',
                     url: 'MultiJaon.ashx',
                     datatype: 'json',
                     data: params,
                     success: function (result) {
                         $("#result1").text(result);
                     },
                     error: function (ex) {
                         alert(ex.responseText);
                     }
                 });

                 return false;
             });



         })
     </script>
</body>
</html>
