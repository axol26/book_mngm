<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="book_management.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid my-4">
        <div class="row">

            <div class="col-md-5">

                <div class="card bg-secondary-subtle">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <i class="fa-regular fa-id-badge fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col">
                                <center>
                                    <span class="badge text-bg-primary">Member</span>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Email ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Country</label>
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Brunei" Value="Brunei" />
                                        <asp:ListItem Text="Cambodia" Value="Cambodia" />
                                        <asp:ListItem Text="Indonesia" Value="Indonesia" />
                                        <asp:ListItem Text="Laos" Value="Laos" />
                                        <asp:ListItem Text="Malaysia" Value="Malaysia" />
                                        <asp:ListItem Text="Myanmar" Value="Myanmar" />
                                        <asp:ListItem Text="Philippines" Value="Philippines" />
                                        <asp:ListItem Text="Singapore" Value="Singapore" />
                                        <asp:ListItem Text="Thailand" Value="Thailand" />
                                        <asp:ListItem Text="Vietnam" Value="Vietnam" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col">
                                <center>
                                    <span class="badge rounded-pill text-bg-success">Change Login Credentials</span>
                                </center>
                            </div>

                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Member ID</label>
                                    <asp:TextBox Class="form-control" ID="TextBox15" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Password</label>
                                    <asp:TextBox Class="form-control" ID="TextBox16" runat="server" placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-flex justify-content-center gap-4 mt-4">

                                <div class="d-grid col-5">
                                    <asp:Button Class="btn btn-warning btn-lg" ID="Button2" runat="server" Text="Update Account" OnClick="Button2_Click" />
                                </div>
                                <div class="d-grid col-5">
                                    <asp:Button Class="btn btn-danger btn-lg" ID="Button1" runat="server" Text="Delete Account" OnClick="Button1_Click" />
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
                                    <i class="fa-solid fa-book-open fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Issued Books</h4>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:book_man_dbConnectionString %>" SelectCommand="SELECT * FROM [books_issue] WHERE member_id = @username">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="username" SessionField="username" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView class="table table-stripped table-bordere" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issued Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
