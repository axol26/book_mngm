<%@ Page Title="Member Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberManagement.aspx.cs" Inherits="book_management.MemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-4">

        <div class="col">

            <div class="card bg-light">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>
                                <i class="fa-solid fa-rectangle-list fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Member List</h4>
                                <hr />
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:book_man_dbConnectionString %>" ProviderName="<%$ ConnectionStrings:book_man_dbConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [member]"></asp:SqlDataSource>
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                    <asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
                                    <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="province" HeaderText="Country" SortExpression="province" />
                                    <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                    <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />

                                    <asp:TemplateField HeaderText="Delete?">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="d-flex justify-content-center">
                                                    <div class="d-grid col-10">
                                                        <asp:Button runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger btn-sm" OnClick="btnDelete_Click" CommandArgument='<%# Eval("member_id") %>' />
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
