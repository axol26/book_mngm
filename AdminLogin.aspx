<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="book_management.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-4">
        <div class="col-md-6 mx-auto">

            <div class="card bg-secondary-subtle">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>
                                <i class="fa-solid fa-lock fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Admin Login</h3>
                                <hr />
                            </center>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="form-label">Admin ID</label>
                                <asp:TextBox CSSClass="form-control" ID="TextBox1" runat="server" placeholder="Admin ID"></asp:TextBox>
                            </div>
                            <div class="form-group mt-2">
                                <label class="form-label">Password</label>
                                <asp:TextBox CSSClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            
                            <div class="d-flex justify-content-center mt-4">
                                <div class="d-grid col-4">
                                    <asp:Button class="btn btn-success primary btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

</div>

</asp:Content>
