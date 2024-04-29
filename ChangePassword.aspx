<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="TDITravel.ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="Skaffold" Namespace="Skaffold.View.Web.Controls" TagPrefix="Tsd" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--[if IE 5]> <html class="ie5"> <![endif]-->
    <!--[if IE 7]> <html class="ie7"> <![endif]-->
    <!--[if IE 8]>     <html class="ie8"> <![endif]-->
    <title>Change Password</title>
    <meta http-equiv="Content-Type" content="text/html;">
    <link href="Resources/css/form.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <style type="text/css">
        .login, .login *{font-family: 'Open Sans', sans-serif; transition: all 0.3s ease-in-out;}
        .login{text-align:center;}
        #loader{
            position: absolute;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 1000;
            background: url('Resources/images/loading.gif') 50% 50% no-repeat rgb(255, 255, 255);
        }

        .login{
            background-color: #ececec;
        }

            .login * {
                box-sizing: border-box;
            }

        .login .content .form-actions .formbutton {
            background-color: #ff8034;
            border: 0;
            border-radius: 100px !important;
            font-size: 14px;
            padding: 8px 15px !important;
            margin: 15px auto 0;
            color: #fff;
            display: block;
            width: 100%;
            height: auto;
            line-height: normal;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 0.5px;
            cursor:pointer;
        }

        .login .content .form-actions .formbutton:hover, .login .content .form-actions .formbutton:focus{
            outline:none;
        }

        .login .content .rememberme span {
            border-color: #f9b79a !important;
            background: #f36d35 !important;
        }

        .login .forget-password-block a {
            color: #ffb48a !important;
        }

            .login .forget-password-block a:hover {
                color: #fbf2ee !important;
                text-decoration: none;
            }

        .login_Panel {
            margin: 50px auto;
            position: relative;
            float: none;
            width: 350px;
        }

        .login_bx {
            padding: 25px 20px 40px;
            background: #fff;
            border-radius: 0 !important;
            border: 0;
            box-shadow: 0 0 20px 5px rgba(0,0,0,0.1);
            -webkit-box-shadow: 0 0 20px 5px rgba(0,0,0,0.1);
        }

        .login .content .form-control {
            background-color: #edf4f5;
            border: 1px solid #cbdcde;
            height: 37px;
            color: #575e5f;
            padding: 5px 30px 5px 15px;
            border-radius: 100px;
            display: block;
            width: 100%;
        }

        .ie7 .login .content .form-control{width: 94%; height: 22px;}
        .ie5 .login .content .form-control{width:318px;}

        .login .content .form-control:focus {
            outline: none;
            background-color: #fff;
        }

        .container.body-content {
            background: #fff;
            padding: 15px 0;
            border: 0 solid #e0e0e0;
            box-shadow: 0 0 10px rgba(0,0,0,0.08);
            -webkit-box-shadow: 0 0 10px rgba(0,0,0,0.08);
        }

        .img-responsive {
            max-width: 100%;
            clear: both;
        }

        .login_bx .form-group .formlabel {
            position: absolute;
            top: 10px;
            right: 15px;
            width: auto;
        }

        .login_bx .form-group .formField {
            position: relative;
        }
        
        .login_bx .form-group {
            margin: 15px 0;
            text-align:left;
        }
        .forgetLnk {
            text-align: center;
        }
        .forgetLnk a, .forgetLnk a:hover, .forgetLnk a:focus {
            color: #f37021;
            display: block;
            margin: 20px auto 0;
            font-size: 13px;
            font-weight: 700;
            border-bottom: 1px solid #f37021;
            padding-bottom: 10px;
            text-decoration: none;
        }
        .alert.alert-danger p {
            margin: 15px 0 0;
        }

        .alert.alert-danger p span {
            font-size: 12px;
            font-weight: 600;
            color: #f37021;
            display: block;
            width: 100%;
            padding-bottom: 3px;
        }
        .cp_title h4 {
            font-size: 19px;
            font-weight: 300;
            color: #4e4e4e;
            border-bottom: 1px dotted #b5b7b7;
            padding: 0 0 20px;
            margin: 0;
            line-height: 28px;
        }
        .infotxt{
            font-size: 15px;
            color: #a5a1a1;
            line-height: 24px;
            margin-top: 30px;
            margin-bottom: 0;
        }
        .infotxt span{font-weight:700;}
        @media screen and (max-width:400){
            .login_Panel{width:100%;}
        }
    </style>
</head>
<body class="login">
    <form id="form1" class="login-form" runat="server">
    <div class="login_Panel">
        <div class="logo" style="margin-bottom: 30px;">
            <img class="img-responsive" src="Resources/images/TDI.jpg" alt="TPL Insurance" />
        </div>
        <div class="login_bx">
            <div class="cp_title">
                <h4>
                    Change Password (Assign / Apply)</h4>
            </div>
            <!-- BEGIN LOGIN -->
            <div class="content" style="padding: 15px 10px;">
                <!-- BEGIN LOGIN FORM -->
                <div class="alert alert-danger">
                    <p>
                        <Tsd:MessageLabel ID="MessageLabel1" runat="server"></Tsd:MessageLabel>
                        <Tsd:ErrorLabel ID="ErrorLabel1" runat="server"></Tsd:ErrorLabel>
                        <Tsd:ValidationSummary ID="ValidationSummary1" runat="server"></Tsd:ValidationSummary>
                    </p>
                </div>
                <div class="form-group">
                    <div class="formField">
                        <Tsd:TextBox ID="txtUserID" placeholder="User ID" runat="server" CssClass="form-control"></Tsd:TextBox>
                        <Tsd:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserID"
                            ErrorMessage="User ID Empty">*</Tsd:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="formField">
                        <Tsd:TextBox ID="txtOldPwd" placeholder="Old Password" runat="server" CssClass="form-control"
                            TextMode="Password" MaxLength="50"></Tsd:TextBox>
                        <Tsd:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPwd"
                            ErrorMessage="Old Password Empty">*</Tsd:RequiredFieldValidator></td>
                    </div>
                </div>
                <div class="form-group">
                    <div class="formField">
                        <Tsd:TextBox ID="txtNewPwd" placeholder="New Password" runat="server" CssClass="form-control"
                            TextMode="Password" MaxLength="50"></Tsd:TextBox>
                        <Tsd:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd"
                            ErrorMessage="New Password Empty">*</Tsd:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPwd"
                            ValidationExpression="^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z]).{8,20}$"
                            ErrorMessage="Password must be alphanumeric and atleast 8 characters long"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="formField">
                        <Tsd:TextBox ID="txtConfirmPwd" placeholder="Confirm New Password" runat="server"
                            CssClass="form-control" TextMode="Password" MaxLength="50"></Tsd:TextBox>&nbsp;
                        <Tsd:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPwd"
                            ErrorMessage="Confirm New Password Empty">*</Tsd:RequiredFieldValidator>
                        <Tsd:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPwd"
                            ControlToValidate="txtConfirmPwd" ErrorMessage="New Password does not match">*</Tsd:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtConfirmPwd"
                            ValidationExpression="^(?=.*[\d!@#$%\^*()_\-+=\[{\]};:|\./])(?=.*[a-z]).{8,20}$"
                            ErrorMessage="Password must be alphanumeric and atleast 8 characters long" Style="font-size: 8pt"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-actions">
                    <Tsd:Button ID="btnChangePwd" runat="server" CssClass="formbutton" Text="Change" OnClick="btnChangePwd_Click" />
                    <Tsd:Button ID="btnClose" runat="server" CssClass="formbutton"  Text="Go to Login"
                        OnClick="btnClose_Click" UseSubmitBehavior="False" CausesValidation="False" Visible="true" />
                </div>
                <!-- END LOGIN FORM -->
            </div>
        </div>
    </div>
    </form>
</body>
</html>


<%--
<html>
<head id="Head1" runat="server">
    <title>TDI eTRAVEL System - Change Password</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
   
    <link rel="stylesheet" href="css/components.min.css" type="text/css" />
    <link rel="stylesheet" href="css/plugins.min.css" type="text/css" />
    
    <link rel="stylesheet" href="css/login.min.css" type="text/css" />
    <link rel="stylesheet" href="css/layout.min.css" type="text/css" />
    <link rel="stylesheet" href="css/customize.css" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600" rel="stylesheet">
</head>
<body class="login">
        <div class="login_Panel">
            <div class="login_bx animated flipInY">
                <!-- BEGIN LOGO -->
                <div class="logo">
                    <a target="_blank" href="https://tplinsurance.com/">
                        <img class="img-responsive" src="Resources/images/tdi_b.png" alt="" /> </a>
                </div>
                <!-- END LOGO -->
                <div class="content">
                        <form id="form1" class="login-form" runat="server">
                                <asp:ScriptManager EnablePartialRendering="true"  ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                      <div class="alert alert-danger" style="background-color:transparent; border-color:transparent; padding:0;">
                                          <asp:Label ID="lblMessage" runat="server" style="color:#ff0000; font-size:13px; letter-spacing: 0.3px; text-align: center; display:block;" CssClass="formlabel" EnableViewState="False"></asp:Label>
                                          <asp:Label ID="lblError" runat="server"></asp:Label>
                                      </div>
                                      <div class="form-group">
                                          <label class="control-label">Old Password</label>
                                          <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" autocomplete="off"  CssClass="form-control"></asp:TextBox>
                                              <asp:RequiredFieldValidator cssClass="m_str" ID="rfvUserId" runat="server" Text="*" ControlToValidate="txtOldPassword"></asp:RequiredFieldValidator>    
                                      </div>
                                      <div class="form-group">
                                          <label class="control-label">New Password</label>
                                          <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="rfvPwd" cssClass="m_str" runat="server" Text="*" ControlToValidate="txtNewPassword"></asp:RequiredFieldValidator></asp:TextBox>    
                                      </div>

                                        <div class="form-group">
                                          <label class="control-label">Confirm Password</label>
                                          <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" cssClass="m_str" runat="server" Text="*" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator></asp:TextBox>    
                                      </div>

                                      <div class="form-actions">
                                        <asp:Button ID="btnChange" runat="server"  Text="Change Password" 
                                              CssClass="btn red btn-block uppercase" onclick="btnChange_Click" />  
                                      </div>
                                      <div class="form-actions">
                                        <asp:Button ID="btnLogin" runat="server"  Text="Go to Login" 
                                              CssClass="btn red btn-block uppercase" onclick="btnLogin_Click"  />  
                                      </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </form>
                </div>
            </div>
        </div>
    
     <!--[if lt IE 9]>
          <script src="../assets/global/plugins/respond.min.js"></script>
          <script src="../assets/global/plugins/excanvas.min.js"></script>
          <script src="../assets/global/plugins/ie8.fix.min.js"></script>
          <![endif]-->
</body>
</html>
--%>