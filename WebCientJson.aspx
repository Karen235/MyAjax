<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebCientJson.aspx.cs" Inherits="WebCientJson" %>

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
    <ul id="reslut"></ul>
    </div>
    </form>


   <script type="text/javascript">

       $(function () {

           $.ajax({
               type: "POST",
               url: "http://localhost:2359/WebCientJson.ashx", //使用JSONP務必在結尾使用 GET 的 callback=?
               dataType: "json",
               success: function (data) {
                   console.log(data)
                   $.each(data, function (i, item) {
                       var li = "<li>" + item.categoryName + " </li>";
                       $('#reslut').append(li);
                   });
               },
               error: function (data) {
                   console.log(data);
               }

           })

       })

   </script> 
</body>
   
</html>
