<%@ Page Title="Book Issuing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookIssuing.aspx.cs" Inherits="book_management.BookIssuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid my-4">

        <div class="row">
            <div class="col-md-5">

                <div class="card bg-secondary-subtle">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <i class="fa-solid fa-address-book fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Book Details</h3>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Member ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" Text="Go" OnClick="LinkButton4_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-group">Member Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-group">Book Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-group">Start Date</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="ID" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-group">End Date</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="ID" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-flex justify-content-center gap-4 mt-4">

                                <div class="d-grid col-5">
                                    <asp:Button Class="btn btn-dark btn-lg" ID="Button1" runat="server" Text="Issue Book" OnClick="Button1_Click" />
                                </div>

                                <div class="d-grid col-5">
                                    <asp:Button Class="btn btn-light btn-lg" ID="Button2" runat="server" Text="Return Book" OnClick="Button2_Click" />
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <div class="col-md-7">
                <div class="card bg-light">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <i class="fa-solid fa-receipt fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Books List</h4>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:book_man_dbConnectionString %>" SelectCommand="SELECT * FROM [books_issue]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>

                            </div>
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
