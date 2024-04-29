<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TDITravel.Default" ValidateRequest="false" %>

<%@ Register src="Resources/controls/header.ascx" tagname="header" tagprefix="uc1" %>
<%@ Register src="Resources/controls/Menu.ascx" tagname="Menu" tagprefix="uc2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>TDI eTRAVEL System</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"/>
   
    <link rel="stylesheet" href="css/components.min.css" type="text/css" />
    <link rel="stylesheet" href="css/plugins.min.css" type="text/css" />
    
    <link rel="stylesheet" href="css/login.min.css" type="text/css" />
    <link rel="stylesheet" href="css/layout.min.css" type="text/css" />
    <link rel="stylesheet" href="css/customize.css" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600" rel="stylesheet">
</head>
<body class="page-header-fixed page-sidebar-fixed page-sidebar-closed-hide-logo page-content-white">
        <form id="form1" runat="server">
            <div class="page-wrapper">
                <!-- BEGIN HEADER -->
                <div class="page-header navbar navbar-fixed-top">
                    <!-- BEGIN HEADER INNER -->
                    <div class="page-header-inner ">
                        <div class="page-logo">
                            <a href="index.html">
                                <img src="Resources/images/tdi_b.png" alt="logo" class="logo-default img-responsive" />
                            </a>
                            <div class="menu-toggler sidebar-toggler">
                                <span></span>
                            </div>
                        </div>
                        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                            <span></span>
                        </a>
                        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".page-header-menu">
                            <span></span>
                        </a>
                        <asp:Label ID="Error" runat="server" Text=""></asp:Label>
                        <!-- END RESPONSIVE MENU TOGGLER -->
                        <!-- BEGIN TOP NAVIGATION MENU -->
                        <div class="top-menu">
                                <uc1:header ID="header1" runat="server" />
                        </div>
                        <!-- END TOP NAVIGATION MENU -->
                    </div>
                    <!-- END HEADER INNER -->
                </div>
                <!-- END HEADER -->
                <div class="clearfix"> </div>
                <div class="page-container">
                    <!-- BEGIN SIDEBAR -->
                    <div class="page-sidebar-wrapper">
                        <uc2:Menu ID="Menu1" runat="server" />
                    </div>
                    <!-- END SIDEBAR -->
                    <!-- BEGIN CONTENT -->
                    <div class="page-content-wrapper">
                        <!-- BEGIN CONTENT BODY -->
                        <div class="page-content body-content">

                        </div>
                        <!-- END CONTENT BODY -->
                    </div>
                    <!-- END CONTENT -->
                </div>
                <!-- BEGIN FOOTER -->
                <div class="page-footer">
                    <div class="page-footer-inner">
                        &copy;
                        <%=DateTime.Now.Year%> TPL Insurance eTRAVEL System &nbsp;|&nbsp; By
                        <a target="_blank" href="https://tplinsurance.com/">TPL Group</a>
                    </div>
                    <div class="scroll-to-top">
                        <i class="fa fa-arrow-up"></i>
                    </div>
                </div>
                <!-- END FOOTER -->
            </div>
        </form>
        
        <!--[if lt IE 9]>
        <script src="../assets/global/plugins/respond.min.js"></script>
        <script src="../assets/global/plugins/excanvas.min.js"></script>
        <script src="../assets/global/plugins/ie8.fix.min.js"></script>
        <![endif]-->
        
        <script src="Resources/javascript/jquery.min.js"></script>
        <script src="Resources/javascript/bootstrap.min.js"></script>
        <script src="Resources/javascript/js.cookie.min.js"></script>
        <script src="Resources/javascript/jquery.slimscroll.min.js"></script>
        <script src="Resources/javascript/app.min.js"></script>
        <script src="Resources/javascript/layout.min.js"></script>
        
</body>
</html>
