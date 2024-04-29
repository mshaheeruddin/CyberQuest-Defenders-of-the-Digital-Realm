<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="TDITravel.EditUser" %>

<%@ Register src="Resources/controls/header.ascx" tagname="header" tagprefix="uc1" %>

<%@ Register src="Resources/controls/Menu.ascx" tagname="Menu" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <title>TDI eTRAVEL</title>
    <style type="text/css">
        .style6
        {
            width: 102px;
            height: 120px;
        }
        .style7
        {
            height: 40px;
            }
        .style9
        {
            height: 120px;
        }
        .style18
        {
            width: 102px;
            height: 29px;
        }
        .style19
        {
            height: 29px;
        }
        .style21
        {
            height: 120px;
            width: 636px;
        }
        .style25
        {
            width: 185px;
            height: 27px;
        }
        .style26
        {
            width: 579px;
            height: 27px;
        }
        .style27
        {
            width: 185px;
            height: 23px;
        }
        .style28
        {
            width: 579px;
            height: 23px;
        }
        .style29
        {
            width: 185px;
            height: 20px;
        }
        .style30
        {
            width: 579px;
            height: 20px;
        }
    </style>
    <link href="css/form.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager EnablePartialRendering="true"  ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <div>
    
        <uc1:header ID="header1" runat="server" />
    
    </div>
    <div id="divMain" runat="server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional"> 
    <ContentTemplate>
        <table width="100%">
            <tr>
            <td class="style18"></td>
                <td class="style19" colspan="2">
        <asp:Label ID="lblSuccess" runat="server" ForeColor=Green 
            style="font-size: small"></asp:Label>
                </td>
            </tr>
            <tr>
            <td class="style6" align="left" valign="top">
                <uc2:Menu ID="Menu1" runat="server" />
                </td>
                <td style="background-color:#e3e3e3" class="style21">
                    <table width="100%">
                        <tr>
                            <td style="background-color:#e3e3e3" class="style25">Users</td>
                <td style="background-color:#e3e3e3" class="style26"><asp:DropDownList 
                        ID="ddlUsers" runat="server" Height="21px" 
                Width="196px" AppendDataBoundItems="True" AutoPostBack="True" onselectedindexchanged="ddlUsers_SelectedIndexChanged" 
                 >
            </asp:DropDownList>
    
                </td>
                        </tr>
                     
                        <tr>
                            <td style="background-color:#e3e3e3" class="style27">Division</td>
                <td style="background-color:#e3e3e3" class="style28">
    
            <asp:DropDownList ID="ddlDivision" runat="server" Height="21px" 
                Width="196px" AutoPostBack="True" onselectedindexchanged="ddlDivision_SelectedIndexChanged" 
                 >
            </asp:DropDownList>
    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="ddlDivision" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
    
                </td>
                        </tr>
                     
                        <tr>
                            <td style="background-color:#e3e3e3" class="style29">Sub-Division</td>
                <td style="background-color:#e3e3e3" class="style30">
    
            <asp:DropDownList ID="ddlSubDivision" runat="server" Height="23px" 
                Width="196px"
                 >
            </asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddlSubDivision" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
    
                </td>
                        </tr>
                     
                        <tr>
                            <td style="background-color:#e3e3e3; text-align: center;" class="style7" 
                                colspan="2"><asp:Button ID="btnUpdate" runat="server" 
                        Text="Update" CssClass="formbutton" onclick="btnUpdate_Click" 
                        Width="90px" />
                            </td>
                        </tr>
                     
                    </table>
                </td>
                <td class="style9">
                    </td>
            </tr>
            </table>
         </ContentTemplate>
     </asp:UpdatePanel>   
    </div>
    </form>
</body>
</html>
