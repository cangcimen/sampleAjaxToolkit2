Imports System.Data.SqlClient
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports AjaxControlToolkit


Public Class _Default
    Inherits System.Web.UI.Page
    Dim cnString As String = "data source = .;uid = sa; pwd = biofree; initial catalog = northwind"

    Private Sub populateCategories()
        Using cn As New SqlConnection(cnString)
            cn.Open()
            Dim sql As String = "SELECT CategoryID, CategoryName, Description FROM Categories"
            Dim cmd As New SqlCommand(sql, cn)
            Dim reader As SqlDataReader = cmd.ExecuteReader
            Dim dt As New DataTable
            dt.Load(reader)
            categoryGrid.DataSource = dt
            categoryGrid.DataBind()
        End Using
    End Sub

    Private Sub populateData2()
        Using cn As New SqlConnection(cnString)
            cn.Open()
            Dim sql As String = "SELECT P.ProductID,P.ProductName,S.CompanyName, P.UnitPrice FROM Products P INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID"
            Dim cmd As New SqlCommand(sql, cn)

            Dim reader As SqlDataReader = cmd.ExecuteReader
            Dim dt As New DataTable
            dt.Load(reader)
            ProductGrid.DataSource = dt
            ProductGrid.DataBind()
        End Using
    End Sub

    Private Sub populateData2(ByVal catID As Integer)
        Using cn As New SqlConnection(cnString)
            cn.Open()
            Dim sql As String = "SELECT P.ProductID,P.ProductName,S.CompanyName, P.UnitPrice FROM Products P INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID WHERE P.CategoryID = @CategoryID"
            Dim cmd As New SqlCommand(sql, cn)
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@CategoryID", catID)
            Dim reader As SqlDataReader = cmd.ExecuteReader
            Dim dt As New DataTable
            dt.Load(reader)
            ProductGrid.DataSource = dt
            ProductGrid.DataBind()
        End Using
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            populateData2()
            populateCategories()
        End If
    End Sub

    Protected Sub imgbtn_click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        populateData2(gvrow.Cells(0).Text)
    End Sub

End Class