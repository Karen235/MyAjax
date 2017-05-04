<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSkill.aspx.cs" Inherits="UserSkill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  
    <script src="packages/jQuery.2.1.0/Content/Scripts/jquery-2.1.0.min.js"></script>
    <%--<script src="packages/jQuery-vsdoc.2.1.0/content/Scripts/jquery-2.1.0-vsdoc.js"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div class="UserTemplate"  style="display:none;">
    <fieldset>
        <legend>UserName  </legend>
        <input id="chkA" type="checkbox"   value="Asp.Net" />Asp.Net<input id="chkB" type="checkbox" value="Java" />Java<input id="chkC" type="checkbox" value="PHP" />PHP

      

    </fieldset>
    </div>


        <input id="UserName" type="text" /><input id="Add" type="button" value="Add" /><input id="Save" type="button" value="Save" />
        <div id="UserList">

        </div>
    </form>

    
    
    <script  type="text/javascript">
        $(function () {
           
            $('#Add').click(function () {
              
                var Template = $('.UserTemplate').html().replace("UserName", $('#UserName').val());
                console.log(Template);
                $('#UserList').append(Template);
            });

            $('#Save').click(function () {
                var Users = new Array();

                $('#UserList').find('fieldset').each(function () {
                    var self = $(this);
                    var user = new Object();
                    user.username = self.find('legend').html();
                    user.skill = new Array();

                    $(self).find('input[type=checkbox]:checked').each(function () {
                        user.skill.push($(this).val());
                    });

                    Users.push(user);
                });

                console.log(JSON.stringify(Users));

                $.ajax({
                    
                    type: 'GET',
                    url: 'UserSkill.ashx',
                    contenttype:'application/json; charset=utf-8',
                    datatype: 'json',
                    data: { arrary: JSON.stringify(Users) },
                    success: function (data) {
                        alert(data);
                    },
                    error: function (ex) {
                        alert(ex.responseText);
                    }
                });

            });

        });


    </script>

</body>
</html>
