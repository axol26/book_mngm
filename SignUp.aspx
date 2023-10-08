<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="book_management.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-4">
        <div class="row">
            <div class="col-md-8 mx-auto">

                <div class="card bg-secondary-subtle">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <i class="fa-solid fa-address-card fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Email ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Country</label>
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Brunei" Value="Brunei" />
                                        <asp:ListItem Text="Cambodia" Value="Cambodia" />
                                        <asp:ListItem Text="Indonesia" Value="Indonesia" />
                                        <asp:ListItem Text="Laos" Value="Laos" />
                                        <asp:ListItem Text="Malaysia" Value="Malaysia" />
                                        <asp:ListItem Text="Myanmar (Burma)" Value="Myanmar" />
                                        <asp:ListItem Text="Philippines" Value="Philippines" />
                                        <asp:ListItem Text="Singapore" Value="Singapore" />
                                        <asp:ListItem Text="Thailand" Value="Thailand" />
                                        <asp:ListItem Text="Vietnam" Value="Vietnam" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge rounded-pill text-bg-primary">Login Credentials</span>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Member ID</label>
                                    <asp:TextBox Class="form-control" ID="TextBox8" runat="server" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Password</label>
                                    <asp:TextBox Class="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row d-flex justify-content-center mt-4">
                            <div class="d-grid col-4">
                                <asp:Button Class="btn btn-success btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>


</asp:Content>
