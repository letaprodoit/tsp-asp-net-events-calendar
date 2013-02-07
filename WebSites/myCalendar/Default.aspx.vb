Imports System.Web.DynamicData

Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim visibleTables As IList = ASP.global_asax.DefaultModel.VisibleTables
        If visibleTables.Count = 0 Then
            Throw New InvalidOperationException("There are no accessible tables. " &
                "Make sure that at least one data model is registered in Global.asax " &
                "and scaffolding is enabled or implement custom pages.")
        End If
    End Sub

    Public Sub Create_Database(ByVal server As String)
        'CREATE TABLE mc_events
        '(
        '    id  smallint IDENTITY(1,1)PRIMARY KEY CLUSTERED,
        '    title varchar(50) NOT NULL,
        '    recurring_id int DEFAULT NULL,
        '    start_date datetime DEFAULT NULL,
        '    end_date datetime DEFAULT NULL,
        '    all_day int NOT NULL DEFAULT 0,
        '    url text DEFAULT NULL
        ')
    End Sub

    Public Sub Connect_Database(ByVal db_name As String)
    End Sub

End Class
