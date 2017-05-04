<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyTime.aspx.cs" Inherits="MyTime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

            //$.get字串  //不傳參數
            //$.get('MyTime.ashx',
            //      function(response){
            //          console.log(response);
            //      }

            //  );

            //{foo:["bar1", "bar2"]}--> '&foo=bar1&foo=bar2'

            //$.get字串 傳參數
            //$.get('MyTime.ashx', { time: '2015/03/11' },
            //     function (response) {
            //         console.log(response);
            //     }

            // );


            //$.ajax 字串 傳參數
            //$.ajax({
            //    type:"get",
            //    url:'MyTime.ashx',
            //    data:{time:'2015/03/10'},
            //    success: function (response) {
            //        console.log(response);
            //    }
            //});

             //call web service，web service只能用 josn回傳，若要回傳的是string，則會回傳物件並自行加上key name=d  ,ex {d:'2015/01/01'}
            $.ajax({
                type: "post",
                url: "MyTime.aspx/GetTime",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data.d);
                    //alert(data.d);
                },
                failure: function (response) { alert(response.d); }
            });


        });

    </script>
</body>



</html>
