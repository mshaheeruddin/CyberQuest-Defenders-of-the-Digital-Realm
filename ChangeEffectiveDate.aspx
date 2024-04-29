<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeEffectiveDate.aspx.cs" Inherits="TDITravel.ChangeEffectiveDate" %>
<%@ Register src="Resources/controls/header.ascx" tagname="header" tagprefix="uc1" %>
<%@ Register src="Resources/controls/Menu.ascx" tagname="Menu" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
 <title>TDI eTRAVEL</title>
    <style type="text/css">
        .style6
        {
            width: 189px;
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
            width: 189px;
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
            width: 138px;
            height: 27px;
        }
        .style26
        {
            width: 579px;
            height: 27px;
        }
        .style27
        {
            width: 138px;
            height: 23px;
        }
        .style28
        {
            width: 579px;
            height: 23px;
        }
        </style>
        <script language="javascript" type="text/javascript">

            function showhideCalendar(div) {

                var divCalendar = document.getElementById(div);
                if (divCalendar != null) {
                    if (divCalendar.style.visibility == "" || divCalendar.style.visibility == "hidden") {
                        divCalendar.style.visibility = "visible";
                    }
                    else
                    { divCalendar.style.visibility = "hidden"; }
                  
                    return false;
                }
            }
        
        </script>
    <link href="css/form.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager EnablePartialRendering="true" AsyncPostBackTimeout="3600"  ID="ScriptManager1" runat="server"></asp:ScriptManager> 
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
                    <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                        style="font-size: small"></asp:Label>
                </td>
            </tr>
            <tr>
            <td class="style6" align="left" valign="top">
                <uc2:Menu ID="Menu1" runat="server" />
                </td>
                <td style="background-color:#e3e3e3" class="style21">
                    <table id="tblMain" runat="server" width="100%" style="width: 94%">
                        <tr>
                            <td style="background-color:#e3e3e3" class="style25">Policy No.</td>
                <td style="background-color:#e3e3e3" class="style26">
                    <asp:TextBox ID="txtPolicyNo" runat="server" Height="21px" Width="192px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPolicyNo" Display="Dynamic" ErrorMessage="* Required"></asp:RequiredFieldValidator>
    
                </td>
                        </tr>
                     
                        <tr>
                            <td style="background-color:#e3e3e3" class="style27">Effective Date</td>
                <td style="background-color:#e3e3e3" class="style28">
    
                    <asp:TextBox ID="txtEffectiveDate" runat="server" Height="21px" Width="192px"></asp:TextBox>
    
                    &nbsp;<asp:ImageButton ID="imgbtnEffectiveDateClndr" runat="server" 
                        ImageUrl="~/Resources/images/calendar.png" CausesValidation="False" />
                         <div id="divEffectiveDateCalendar" runat="server" style="position:absolute">
                    <asp:Calendar ID="cldrEffectiveDate" runat="server" BackColor="White" 
                        onselectionchanged="cldrEffectiveDate_SelectionChanged" 
                        ></asp:Calendar>
                        </div>
    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtEffectiveDate" ErrorMessage="* Value required" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
    
                </td>
                        </tr>
                     
                        <tr>
                            <td style="background-color:#e3e3e3; text-align: left;" class="style7" 
                                colspan="2">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="formbutton" 
                                    onclick="btnUpdate_Click" Text="SAVE" Width="90px" />
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
     
      <asp:UpdateProgress id="updateProgress" runat="server"> 
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;"> 
                      <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;"><img src="Resources/images/UpdateProgress.gif" /> Please wait</span> 
                </div> 
        </ProgressTemplate>
</asp:UpdateProgress>
    </div>
    </form>
</body>
</html>
