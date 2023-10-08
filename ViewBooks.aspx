<%@ Page Title="View Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="book_management.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-4">
        <div class="row">
            <div class="col-12">

                <div class="card  bg-light">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory</h4>
                                </center>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:book_man_dbConnectionString %>" SelectCommand="SELECT * FROM [books_inv]"></asp:SqlDataSource>
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                    <asp:TemplateField HeaderText="Book Information">
                                        <ItemTemplate>

                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Italic="False" Font-Size="Larger" Font-Underline="True"></asp:Label>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <b>Author</b> -
<asp:Label ID="Label2" runat="server" Text='<%# Eval("book_name") %>'></asp:Label>
&nbsp;| <b>Language</b> -
<asp:Label ID="Label3" runat="server" Text='<%# Eval("language") %>'></asp:Label>
&nbsp;| <b>Genre</b> -
<asp:Label ID="Label5" runat="server" Text='<%# Eval("genre") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <b>Current Stock</b> -
<asp:Label ID="Label4" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>
&nbsp;| <b>Issued Books</b> -
<asp:Label ID="Label6" runat="server" Text='<%# Eval("issued_books") %>'></asp:Label>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <b>Description</b> -
<asp:Label ID="Label7" runat="server" Text='<%# Eval("book_description") %>' Font-Italic="True"></asp:Label>
                                                            </div>
                                                            

                                                        </div>
                                                    </div>

                                                    <div class="col-lg-2 d-flex align-items-center justify-content-center">
                                                        <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("filename")%>' />
                                                    </div>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>



                    </div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
</asp:Content>
