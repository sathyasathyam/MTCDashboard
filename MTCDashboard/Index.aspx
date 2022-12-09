<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MTCDashboard.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>TNSTC Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <style>
        .table-full-width {
            margin-left: 0px;
            margin-right: 0px;
        }

        .table th {
            background-color: rgb(217, 231, 255);
            border: none;
            text-align: left;
            font-weight: bold;
            font-size: 15px;
            padding: 4px;
            color: Black;
            text-align: center;
        }

        .table > tbody > tr > td {
            padding: 5px 8px !important;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="wrapper">
            <div class="sidebar">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <img alt="Logo" src="assets/img/tnstc.png" class="img-thumbnail" />
                        <a href="Index.aspx" class="simple-text">TNSTC Dashboard
                    </a>
                    </div>
                    <ul class="nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="Index.aspx">
                                <i class="nc-icon nc-notes"></i>
                                <p>General</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="Compliants.aspx">
                                <i class="nc-icon nc-paper-2"></i>
                                <p>Complaint</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                    <div class="container-fluid">
                        <%--<a class="navbar-brand" href="#pablo"> General Dashboard </a>--%>
                        <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar burger-lines"></span>
                            <span class="navbar-toggler-bar burger-lines"></span>
                            <span class="navbar-toggler-bar burger-lines"></span>
                        </button>
                    </div>
                </nav>
                <!-- End Navbar -->
                <div class="content" style="padding: 15px;">
                    <div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card  card-tasks">
                                    <div class="card-header ">
                                        <h4 class="card-title">General Dashboard</h4>
                                    </div>
                                    <div class="card-body ">
                                        <div class="table-full-width">
                                            <asp:GridView ID="grdGeneral" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="false" AllowPaging="true"
                                                OnPageIndexChanging="OnPageIndexChanging" OnRowCommand="grdGeneral_RowCommand" PageSize="10">
                                                <Columns>
                                                    <asp:BoundField DataField="VAR_CALLER_ID" HeaderText="Caller ID" />
                                                    <asp:BoundField DataField="VAR_CALLED_DATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date" />
                                                    <%--<asp:BoundField DataField="VAR_START_TIME" HeaderText="Start Time" />--%>
                                                    <%--<asp:BoundField DataField="VAR_END_TIME" HeaderText="End Time" />--%>
                                                    <%--<asp:BoundField DataField="VAR_DURATION" HeaderText="Duration" />--%>
                                                    <%--<asp:BoundField DataField="VAR_DNIS" HeaderText="DNIS" />--%>
                                                    <asp:BoundField DataField="VAR_DIVISION" HeaderText="Devision" />
                                                    <asp:BoundField DataField="VAR_OPTION" ItemStyle-Width="150px" HeaderText="Option" />
                                                    <asp:BoundField DataField="VAR_SUB_OPTION" HeaderText="Sub Option" />
                                                    <asp:TemplateField HeaderText="File">
                                                        <ItemTemplate>
                                                            <audio controls>
                                                                <source src="http://Kaizenvoiz.net//TNSTC_RECORDINGS//<%#Eval("VAR_FILENAME") %>" type="audio/mpeg">
                                                            </audio>
                                                        </ItemTemplate>
                                                        <ItemStyle Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtRemarks" runat="server" Visible='<%# Eval("VAR_REMARKS").ToString() == ""? true : false %>' CssClass="form-control"></asp:TextBox>
                                                            <asp:Label ID="Label1" Visible='<%# Eval("VAR_REMARKS").ToString() != ""? true : false %>' Text='<%# Eval("VAR_REMARKS") %>' runat="server" />
                                                            <asp:Label ID="lblSNO" Visible='false' Text='<%# Eval("SNO") %>' runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <button runat="server" id="btnSave" CommandName="Save" CommandArgument="<%# Container.DataItemIndex %>" style="margin-top: 9px;" visible='<%# Eval("VAR_REMARKS").ToString() == ""? true : false %>' class="btn btn-info"><i class="fa fa-check-circle pr-2"></i>Save</button>
                                                            <%--<asp:Label Text='<%# Eval("finalamount") %>' runat="server" />--%>
                                                        </ItemTemplate>
                                                        <ItemStyle Wrap="True" />
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="VAR_STATUS" HeaderText="Status" />--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="card-footer ">
                                        <%--<hr>
                                    <div class="stats">
                                        <i class="now-ui-icons loader_refresh spin"></i> Updated 3 minutes ago
                                    </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav>
                            <p class="copyright text-center">
                                ©
                           
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                                Developed By <a href="https://kaizenvoiz.com/" target="_blank">Kaizen Secure Voiz</a>
                            </p>
                        </nav>
                    </div>
                </footer>
            </div>
        </div>
    </form>
</body>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //// Javascript method's body can be found in assets/js/demos.js
        //demo.initDashboardPageCharts();

        //demo.showNotification();

    });

    $(function () {
        $("[id*=grdGeneral]").find("[id*=btnSave]").click(function () {
            var row = $(this).closest("tr");
            var remarks = row.find("td").eq(6).find("input").eq(0).val();
            if (remarks == "") {
                alert("Please enter remarks to save.");
                return false;
            }
        });
    });


</script>

</html>
