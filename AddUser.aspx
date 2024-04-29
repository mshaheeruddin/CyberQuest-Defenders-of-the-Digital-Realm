<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="TDITravel.AddUser" %>

<%@ Register Assembly="Skaffold" Namespace="Skaffold.View.Web.Controls" TagPrefix="Skaffold" %>

<%@ Register src="Resources/controls/header.ascx" tagname="header" tagprefix="uc1" %>

<%@ Register src="Resources/controls/Menu.ascx" tagname="Menu" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>TDI eTRAVEL</title>
 <link href="css/form.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">

        function ScrollToTop() {
            window.scrollTo(0, 0);
        }




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
    <style type="text/css">
        .style1
        {
            height: 11px;
        }
        .style3
        {
            height: 16px;
        }
        .style5
        {
            height: 36px;
        }
        .style6
        {
            height: 13px;
        }
        .style7
        {
            height: 11px;
            width: 7px;
            text-align: center;
        }
        .style12
        {
            height: 11px;
            width: 91px;
        }
        .style13
        {
            height: 16px;
            width: 91px;
        }
        .style15
        {
            height: 36px;
            width: 91px;
        }
        .style16
        {
            height: 13px;
            width: 91px;
        }
        .style17
        {
            height: 36px;
            width: 7px;
        }
        .style18
        {
            height: 15px;
            width: 7px;
        }
        .style19
        {
            height: 15px;
            width: 91px;
        }
        .style20
        {
            height: 15px;
        }
        .style21
        {
            height: 11px;
            width: auto;
            font-weight: bold;
            font-size: medium;
        }
        .style22
        {
            height: 13px;
            width: auto;
            font-size: medium;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager EnablePartialRendering="true" AsyncPostBackTimeOut="3600"  ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager> 
     
     <script language="javascript" type="text/javascript">

         Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function(sender, args) {
             if (args.get_error() && args.get_error().name ===
                'Sys.WebForms.PageRequestManagerTimeoutException') {
                 var lblError = document.getElementById('<%=lblError.ClientID%>');
                 lblError.innerText = "Page request timed out. Please Try again.";
                 args.set_errorHandled(true);
             }
         });
         
         
         function validateLogin() {
             var txtLoginId = document.getElementById('<%=txtLoginId.ClientID%>');
             PageMethods.ValidateLogin(txtLoginId.value, OnCallComplete);
         }

         function OnCallComplete(result) {
             var label = document.getElementById('<%=lblLoginError.ClientID%>');
             var hdnLogin = document.getElementById('<%=hdnLogin.ClientID%>');
            
             if (result == true) {
                 hdnLogin.value = 1;
                 label.innerHTML = "! Login Id already exists"; ;
                 label.style.display = "";
             }
             else {
                 hdnLogin.value = 0;
                 label.innerHTML = "";
                 label.style.display = "none";                 
             }
         }
        
    
     </script>
    <div>        
            <uc1:header ID="header1" runat="server" />
        </div>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional">
    <ContentTemplate>
    <div id="divMain" runat="server">
    <table width="100%">
        <tr>
            <td align="left" valign="top" >
                <uc2:Menu ID="Menu1" runat="server" />
            </td>
            <td align="left" valign="top" >             
            
       
   
    <table style="border-left: none; border-right: none; border-top: none; border-bottom: 1px solid black; width: 80%; background-color:#e3e3e3;" 
                         cellspacing="0" cellpadding="5" align="center" >
   
         <tr>
    <td class="style1" colspan="5" >
             <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" 
                 style="font-size: small"></asp:Label>
             <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                 style="font-size: small"></asp:Label>
             <br />
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                 ValidationGroup="user" Width="410px" />
             </td>
   
    </tr>
         <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style21" colspan="4">
                 Contact Detail</td>
         </tr>
         <tr>
             <td class="style7">
             </td>
             <td class="style12">
                 Salutation</td>
             <td class="style1">
                 <asp:DropDownList ID="ddlSalutation" runat="server" Height="20px" Width="97px">
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                     ControlToValidate="ddlSalutation" Display="None" 
                     ErrorMessage="* Salutation required" InitialValue="0" ValidationGroup="user"></asp:RequiredFieldValidator>
             </td>
             <td class="style1">
                 Name</td>
             <td class="style1">
                 <asp:TextBox ID="txtCustName" runat="server" Width="295px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="txtCustName" Display="None" ErrorMessage="* Name Required" 
                     ValidationGroup="user"></asp:RequiredFieldValidator>
             </td>
         </tr>
    <tr>
    <td class="style7" >
        </td>
    <td class="style13" >
        Date of Birth
    </td>
        <td class="style3" >
    
             <asp:TextBox ID="inpCustDOB" runat="server" Width="155px" AutoPostBack="true"></asp:TextBox>
                            <asp:ImageButton ID="imgbtnDOBClndr" runat="server" ImageUrl="~/Resources/images/calendar.png" />
                            <div id="divDOBCalendar" runat="server" style="position:absolute">
                                <asp:Calendar ID="cldrDOB" runat="server" BackColor="White" OnVisibleMonthChanged="cldrDOB_MonthChange" onselectionchanged="cldrDOB_SelectionChanged"></asp:Calendar>
                            </div>  
    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                Display="None"  ErrorMessage="Date of Birth Required" ControlToValidate="inpCustDOB"></asp:RequiredFieldValidator>
    
             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                 ControlToValidate="inpCustDOB" Display="None" 
                 ErrorMessage="* Date of Birth required" ValidationGroup="user"></asp:RequiredFieldValidator>
    
    </td>
        <td class="style3" >
    
            Country</td>
        <td class="style3">
    
            <asp:DropDownList ID="ddlCustCountry" runat="server" AutoPostBack="True" 
                Height="20px" onselectedindexchanged="ddlCustCountry_SelectedIndexChanged" 
                Width="164px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="ddlCustCountry" Display="None" 
                ErrorMessage="* Country Required" InitialValue="0" ValidationGroup="user"></asp:RequiredFieldValidator>
    
    </td>
    </tr>
    <tr>
    <td class="style18" >
        </td>
    <td  valign="top" class="style19">
        City</td>
        <td class="style20" >
    
            <asp:DropDownList ID="ddlCustCity" runat="server" AutoPostBack="true" 
                Height="20px" onselectedindexchanged="ddlCustCity_SelectedIndexChanged" 
                Width="164px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="ddlCustCity" Display="None" ErrorMessage="* City Required" 
                InitialValue="0" ValidationGroup="user"></asp:RequiredFieldValidator>
    
        </td>
        <td  valign="top" class="style20">
    
            Area</td>
        <td  valign="top" class="style20">
    
            <asp:DropDownList ID="ddlCustArea" runat="server" Height="20px" Width="295px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="ddlCustArea" Display="None" ErrorMessage="* Area Required" 
                InitialValue="0" ValidationGroup="user"></asp:RequiredFieldValidator>
    
        </td>
    </tr>
    <tr>
    <td class="style17" >
    
            </td>
    <td class="style15" >
    
            Address</td>
        <td class="style5" >
    
            <asp:TextBox ID="txtCustAddress" runat="server" Font-Names="Arial" 
                Height="39px" TextMode="MultiLine" Width="295px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCustAddress" Display="None" 
                ErrorMessage="* Address Required" ValidationGroup="user"></asp:RequiredFieldValidator>
    
        </td>
        <td class="style5" >
    
            </td>
        <td class="style5">
    
        </td>
    </tr>
    <tr>
    <td class="style7" >
        </td>
    <td class="style16" >
        Phone No.</td>
        <td class="style6">
    
    <asp:TextBox ID="txtCustPhone" runat="server" Width="295px" MaxLength="8"></asp:TextBox>
    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ErrorMessage="* Phone No Required" Display="None"   
                ControlToValidate="txtCustPhone" ValidationGroup="user"></asp:RequiredFieldValidator>
    <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Invalid Phone No." ControlToValidate="txtCustPhone" 
                validationexpression="^[0-9]{8}$"  Display="None" ValidationGroup="user"></asp:RegularExpressionValidator>
    
        </td>
        <td class="style6" >
    
        Mobile No.</td>
        <td class="style6">
    
    <asp:TextBox ID="txtCustMobile" runat="server" Width="295px" MaxLength=11></asp:TextBox>
    
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ErrorMessage="* Mobile No Required" Display="None"   
                ControlToValidate="txtCustMobile" ValidationGroup="user"></asp:RequiredFieldValidator>
    
            <asp:RegularExpressionValidator ID="RegularExpressionValidator362" runat="server" 
                ErrorMessage="Invalid Mobile No." ControlToValidate="txtCustMobile" 
                validationexpression="^[0-9]{11}$"  Display="None" ValidationGroup="user"></asp:RegularExpressionValidator>
    
        </td>
    </tr>
         <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style16">
                 &nbsp;</td>
             <td class="style6">
                 &nbsp;</td>
             <td class="style6">
                 &nbsp;</td>
             <td class="style6">
                 &nbsp;</td>
         </tr>
         <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style22" colspan="4">
                 User Detail</td>
           
         </tr>
          <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style16">
                 Login Id</td>
             <td class="style6">
                 <asp:TextBox ID="txtLoginId" runat="server" Width="295px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                     ControlToValidate="txtLoginId" Display="None" 
                     ErrorMessage="* Login Id required" ValidationGroup="user"></asp:RequiredFieldValidator>
                     <br />
                     <asp:Label ID="lblLoginError" runat="server" style="display: none;" ForeColor=Red></asp:Label>
              </td>
             <td class="style6">
                 </td>
             <td class="style6">
                 &nbsp;</td>
         </tr>
         <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style16">
                 Password</td>
             <td class="style6">
                 <asp:TextBox ID="txtPwd" runat="server" MaxLength="10" TextMode="Password" 
                     Width="295px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                     ControlToValidate="txtPwd" Display="None" ErrorMessage="* Password Required" 
                     ValidationGroup="user"></asp:RequiredFieldValidator>
             </td>
             <td class="style6">
                 &nbsp;</td>
             <td class="style6">
                 &nbsp;</td>
         </tr>
         <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style16">
                 Confirm Password</td>
             <td class="style6">
                 <asp:TextBox ID="txtConfirmPwd" runat="server" MaxLength="10" 
                     TextMode="Password" Width="295px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                     ControlToValidate="txtConfirmPwd" Display="None" 
                     ErrorMessage="* Confirm Password required" ValidationGroup="user"></asp:RequiredFieldValidator>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                     ControlToCompare="txtPwd" ControlToValidate="txtConfirmPwd" Display="None" 
                     ErrorMessage="* Password doesnot match" ValidationGroup="user"></asp:CompareValidator>
             </td>
             <td class="style6">
                 &nbsp;</td>
             <td class="style6">
                 &nbsp;</td>
         </tr>
         <tr>
             <td class="style7">
                 &nbsp;</td>
             <td class="style16">
                 Branch</td>
             <td class="style6">
                 <asp:DropDownList ID="ddlbranch" runat="server" 
                     Height="20px" Width="164px" 
                     >
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                     ControlToValidate="ddlbranch" Display="None" ErrorMessage="* Branch Required" 
                     InitialValue="0" ValidationGroup="user"></asp:RequiredFieldValidator>
             </td>
             <td class="style6">
                 &nbsp;</td>
             <td class="style6">
                 &nbsp;</td>
         </tr>
         <tr>
             <td colspan="5" align="center">
                 <asp:Button ID="btnSave" runat="server" CssClass="formbutton" 
                     onclick="btnSave_Click" Text="Save" ValidationGroup="user" Width="78px" 
                     Height="23px" />
             </td>         </tr>
         <tr>
             <td align="center" colspan="5">
                 &nbsp;</td>
         </tr>
    </table>   
    
    
        <br />
         
        <br />
   
  
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
     <asp:HiddenField ID="hdnLogin" runat="server" />
    </ContentTemplate>
    </asp:UpdatePanel>  
     
      <asp:UpdateProgress id="updateProgress" runat="server"> 
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: Silver; opacity: 0.7;"> 
                      <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;"><img src="Resources/images/UpdateProgress.gif" /> Please wait</span> 
                </div> 
        </ProgressTemplate>
</asp:UpdateProgress>

    </form>
</body>
</html>