<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestJson.aspx.cs" Inherits="RequestJson" %>

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
        <input id="Button1" type="button" value="ashx" /><input id="Button2" type="button" value="aspx" />
      
        <div>
            <ul id="reslut"></ul>

        </div>
    </div>
    </form>

    <script type="text/javascript">

       

        $(function () {
         
            $('#Button1').click(function () {
                $.ajax({
                    type: "POST",
                    url: "http://localhost:2359/MyAjax/ResponseJson.ashx", //使用JSONP務必在結尾使用 GET 的 callback=?
                    dataType: "jsonp",
                    success: function (data) {
                        console.log(data)
                        $.each(data,function(i,item){
                            var li = "<li> id : " + i + "  so: " + item.so + "  GetInDate : " + item.GetInDate + "  Quantity : " + item.Quantity;
                            $('#reslut').append(li);
                        });
                    },
                    error: function (data) {
                        console.log(data);
                    }

                })

            }
            );

         $('#Button2').click( function(){
            
             $.ajax({
                 data: { "name": "zemus" },
                 dataType: 'jsonp',
                 url: "http://localhost:2359/MyAjax/ResponseJson.aspx?callback=?",

                 success: function (json) {
                     console.log(json.so);

                 },
                 error: function (xmlHttpRequest, error, throwError) {
                     //alert(throwError);
                 }
             });
     });


                

        


           

      

        })

    
    </script>

</body>
</html>
