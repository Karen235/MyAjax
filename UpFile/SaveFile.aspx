<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaveFile.aspx.cs" Inherits="SaveFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
   
    <script src="../Script/jquery-1.11.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="file" id="avatar" name="avatar" multiple>
            <button type="button">保存</button>


             <input type="file" id="avatar" name="avatar" multiple>
            <button type="button">保存</button>

        </div>
    </form>


    <script type="text/javascript">

        $(function () {

            $('button').click(function () {
                //var $input = $('#avatar');
                //// 相当于： $input[0].files, $input.get(0).files
                //var files = $input.prop('files');
                //console.log(files);


                var files = $('#avatar').prop('files');

                var data = new FormData();
                data.append('avatar', files[0]);


                $.ajax({
                    url: 'SaveFile.ashx',
                    type: 'POST',
                    data: data,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        alert(response)
                    }
                });


           
            })
        }
        )
    </script>
</body>
</html>
