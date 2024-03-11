<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content content--text">
    <div id="main" class="view__anchor"></div>
    <article class="view__in section__in">
        <div class="section__block content__text">
            <div class="content__logo">
                <img src="/images/logo.svg" alt="Protection Direct for your peace of mind" width="300" height="55"/>
            </div>
            <h1 class="content__title" id="main-title">Thank You! We will contact your shortly.</h1>
		    <div>Your Confirmation Number Is: <b><%= Model.Order.OrderID %></b></div>

            <% using (Html.BeginForm()) { %>
                <button type="submit" class="button" name="createOrder">
                    <span>Back to Home Page</span>
                </button>
   	        <% } %>
        </div>
    </article>
</main>

</asp:Content>