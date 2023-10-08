<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="book_management.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-4">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card bg-secondary-subtle">
                    <div class="card-body">

                        <div class="row mb-2">
                            <div class="col">
                                <center>
                                    <i class="fa-solid fa-user fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label">Member ID</label>
                                    <asp:TextBox CSSClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                                <div class="form-group mt-2">
                                    <label class="form-label">Password</label>
                                    <asp:TextBox CSSClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                
                                <div class="d-flex gap-5 justify-content-center mt-4">
                                    <div class="d-grid col-4">
                                        <asp:Button class="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click1" />
                                    </div>
                                    <div class="d-grid col-4">
                                        <asp:Button class="btn btn-success btn-lg" ID="Button2" runat="server" Text="Sign Up" OnClick="Button2_Click" />
                                    </div>
                                </div> 

                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>

</asp:Content>
