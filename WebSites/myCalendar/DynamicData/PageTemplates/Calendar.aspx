<%@ Page Language="VB" MasterPageFile="~/Site.master" CodeFile="Calendar.aspx.vb" Inherits="Calendar" %>


<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
    <link rel='stylesheet' type='text/css' href='../Styles/cupertino/theme.css' />
    <link rel='stylesheet' type='text/css' href='../Styles/fullcalendar.css' />
    <link rel='stylesheet' type='text/css' href='../Styles/fullcalendar.print.css' media='print' />
    <script type='text/javascript' src='../Scripts/jquery-1.8.1.min.js'></script>
    <script type='text/javascript' src='../Scripts/jquery-ui-1.8.23.custom.min.js'></script>
    <script type='text/javascript' src='../Scripts/fullcalendar.min.js'></script>
    <style type="text/css">
        body {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LinqDataSource ID="LinqDataSource1" ContextTypeName="myCalendarDBModelDataContext" 
        TableName="Events" 
        runat="server">     
    </asp:LinqDataSource>     
    <div id='calendar'></div>
    <script type='text/javascript'>
        $(document).ready(function () {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({
                theme: true,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: true,
                events: [
                    <asp:ListView 
                        DataSourceID="LinqDataSource1" 
                        ID="ListView1" runat="server">
                        <ItemTemplate>
                            {
                                id: '<%# Eval("recurring_id") %>',
                                title: '<%# Eval("title") %>',
                                start: '<%# Eval("start_date") %>',
                                end: '<%# Eval("end_date") %>',
                                allDay: '<%# Eval("all_day") %>',
                                url: '<%# Eval("url") %>',
                            },
                        </ItemTemplate>
                    </asp:ListView>
 			    ]
            });

        });
    </script>
</asp:Content>

