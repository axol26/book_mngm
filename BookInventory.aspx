<%@ Page Title="Book Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookInventory.aspx.cs" Inherits="book_management.BookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid my-4">
        <div class="row">
            <div class="col-md-5">

                <div class="card bg-secondary-subtle">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" src="images/books1.png" width="100px" height="150px" />
                                </center>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col">
                                <center>
                                    <asp:FileUpload onchange="readURL(this)" class="form-control" ID="FileUpload1" runat="server" />
                                </center>
                            </div>
                        </div>

                        <div class="row mt-2">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" Text="Go" OnClick="LinkButton4_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <div class="form-group">
                                    <label class="form-label">Book Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-2">
                            <div class="col-md-4">
                                
                                <div class="form-group">
                                    <label class="form-label">Language</label>
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Tagalog" Value="Tagalog" />
                                    </asp:DropDownList>
                                </div>


                                
                                <div class="form-group mt-2">
                                    <label class="form-label">Current Stock</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>





                            </div>

                            <div class="col-md-4">
                                
                                <div class="form-group">
                                    <label class="form-label">Author Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>

                                
                                <div class="form-group mt-2">
                                    <label class="form-label">Issued Books</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">Genre</label>
                                    <asp:ListBox class="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="4" Height="115px">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-label">Book Description</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-flex justify-content-center gap-3 mt-4">
                                <div class="d-grid col-3">
                                    <asp:Button class="btn btn-lg btn-block btn-success" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
                                </div>
                                <div class="d-grid col-3">
                                    <asp:Button class="btn btn-lg btn-block btn-warning" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                                </div>
                                <div class="d-grid col-3">
                                    <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
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
                                    <i class="fa-solid fa-book fa-beat" style="color: #0854d9; font-size: 90px;"></i>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory</h4>
                                    <hr />
                                </center>
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
                                                    <div class="col-lg-9">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Larger" Font-Underline="True"></asp:Label>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <b>Author</b> -
<asp:Label ID="Label2" runat="server" Text='<%# Eval("author") %>'></asp:Label>
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

                                                    <div class="col-lg-3 d-flex align-items-center justify-content-center">
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
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $("#imgview").attr("src", e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


</asp:Content>
