﻿<%@ Page Title="Books Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="book_management._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container-fluid">
        <div class="row overflow-hidden">
            <div class="col" style="background-image: url('images/library_3.png'); background-repeat: no-repeat; background-size: cover; background-position: center; width: 100%; height: 200px;">
            </div>
        </div>
        <div class="row d-flex justify-content-center py-4 text-uppercase fw-bolder fs-1 text-dark-emphasis">
            Books Library App
        </div>
        <div class="row overflow-hidden">
            <div class="col" style="background-image: url('images/library_2.png'); background-repeat: no-repeat; background-size: cover; background-position: center; width: 101%; height: 200px;">
            </div>
        </div>

        <div class="container mt-4">
            <div class="row">
                <h1 class="fs-2 text-uppercase text-center fw-bold text-dark-emphasis">Features</h1>
            </div>
            <div class="row d-flex px-4 my-4 gap-4 flex-row flex-wrap justify-content-center align-items-center">

                <div class="card overflow-hidden p-0" style="width: 320px;">
                    <img src="images/borrow_book.png" class="card-img-top" style="width: 320px; height: 183px;" />
                    <div class="card-body">
                        <h5 class="card-title text-center">Borrow Books</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit cras aliquet felis purus, non auctor ligula tristique sit amet.</p>
                    </div>
                </div>
                <div class="card overflow-hidden p-0" style="width: 320px;">
                    <img src="images/read_book.png" class="card-img-top" style="width: 320px; height: 183px;" />
                    <div class="card-body">
                        <h5 class="card-title text-center">Read Books</h5>
                        <p class="card-text">Morbi placerat, tellus pellentesque egestas vestibulum, metus dolor gravida justo, sed varius velit purus eget risus.</p>
                    </div>
                </div>
                <div class="card overflow-hidden p-0" style="width: 320px;">
                    <img src="images/fast_transac.png" class="card-img-top" style="width: 320px; height: 183px;" />
                    <div class="card-body">
                        <h5 class="card-title text-center">Fast Transactions</h5>
                        <p class="card-text">Curabitur cursus vel tellus ac consequat, morbi vitae quam eleifend, fermentum augue aliquet, lacinia eros.</p>
                    </div>
                </div>

            </div>

            <div class="row">
                <h1 class="fs-2 text-uppercase text-center fw-bold text-dark-emphasis">Simple Process</h1>
            </div>






            <div class="row d-flex justify-content-center align-items-center">

                <div id="carouselExampleRide" class="carousel slide mt-4 mb-5 rounded overflow-hidden p-0" data-bs-ride="carousel" style="width: 630px;">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/1_request.png" class="d-block w-100" style="height: 480px;" />
                        </div>
                        <div class="carousel-item">
                            <img src="images/2_approved.png" class="d-block w-100" style="height: 480px;" />
                        </div>
                        <div class="carousel-item">
                            <img src="images/3_approved.png" class="d-block w-100" style="height: 480px;" />
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>


        </div>



    </div>

</asp:Content>
