<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>

<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="PROD.PhoneNumbers" %>
<%@ Import Namespace="PROD.Navigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
<%   
    var phoneNumbers = new MediaTollFreeNumbers();
    var phoneNumber = phoneNumbers.GetPhoneNumber();

    var sitemap = new Sitemap();
    var registerLink = sitemap.SitemapList.GetItemById("register");
%>
    <main aria-labelledby="main-title" class="view content content--text">
        <div id="main" class="view__anchor"></div>
        <article class="view__in section__in">
            <div class="section__block content__text">
                <% 
                    var title = Model.UpsellTitle ?? string.Empty;
                    var text = Model.UpsellText ?? string.Empty;
                    var hasTitle = !String.IsNullOrEmpty(title);
                    var hasText = !String.IsNullOrEmpty(text);

                    if (hasTitle)
                    {
                %>
                <h1 class="content__title" id="main-title"><%= title %></h1>
                <%
                    }
                    else
                    {
                        Html.RenderSnippet("SUBPAGE-TITLE-" + DtmContext.PageCode);
                    }

                    if (hasText)
                    {
                        text = text.Replace("[#optout#]", DtmContext.OptOutLink);
                        text = text.Replace("[#support#]", DtmContext.SupportEmail);
                        text = text.Replace("[#ext#]", DtmContext.ApplicationExtension);
                        text = text.Replace("[@@PHONENUMBER@@]", phoneNumber);
                        text = text.Replace("[@@REGISTERLINK@@]", registerLink.Page);
                %>
                <%= text %>
                <%
                    }
                    else if (DtmContext.PageCode == "Sitemap")
                    {
                %>
                <nav aria-label="Sitemap">
                    <ul class="list">
                        <%
                            var navFilterIdList = new string[] { "sitemap" };
                            var navList = sitemap.SitemapList.Entries.Where(e => !navFilterIdList.Contains(e.Id));

                            foreach (var navLink in navList)
                            {
                        %>
                        <li>
                            <a
                                id="sitemap-<%= navLink.Id %>"
                                href="<%= navLink.Page %>"
                                aria-label="<%= navLink.Label %>"
                                title="<%= navLink.Label %>"><%= navLink.Name %></a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </nav>
                <%
                    }
                    else
                    {
                        Html.RenderSubPageContent(DtmContext.PageCode);
                    }
        %>
        </article>
    </main>

</asp:Content>
