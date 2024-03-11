<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="PROD.Navigation" %>
<%@ Import Namespace="PROD.PhoneNumbers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    var sitemap = new Sitemap();
    var registerLink = sitemap.SitemapList.GetItemById("register");
    var phoneNumbers = new MediaTollFreeNumbers();
    var phoneNumber = phoneNumbers.GetPhoneNumber();
%>

    <main class="view content content--text-video-form section section--main">
        <div id="main" class="view__anchor"></div>
        <div class="view__in section__in">
            <div class="content__group">
                <div class="content__text">
                    <h1 class="tagline content__title">You are PROTECTED wherever life takes you
                </h1>
                    <p>
                        <b>
                            <u>PROTECT YOUR CAR, </u>
                            <u>YOUR BUDGET </u>&

                            <u>YOUR PEACE OF MIND!</u>
                        </b>
                    </p>
                    <div class="contain contain--video">
                        <iframe loading="lazy" src="https://player.vimeo.com/video/573068730?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="Video"></iframe>
                    </div>
                    <div class="content__contain-text content__text">
                        <h2 class="content__header">We help you personalize the best options for your
                        vehicle and budget
                    </h2>
                        <p>
                            One of our

                            <b class="content__highlight">vehicle protection specialists</b>
                            will help you work up a

                            <b class="content__highlight">personalized plan for your vehicle.</b>
                            Together we’ll

                            <b class="content__highlight">create a custom Protection Direct service
                            plan</b>
                            that fits your needs. The perfect service plan is one
                        you write yourself.
                        </p>
                    </div>
                </div>
                <div class="content__form">
                    <form action="/<%= DtmContext.OfferCode %>/<%= DtmContext.Version %>/<%= DtmContext.PageCode %><%= DtmContext.ApplicationExtension %>" method="post" class="view form message">
                        <div id="register" class="view__anchor"></div>

                        <fieldset class="form__fieldset">
<%--                            <div class="vse"><%= Html.ValidationSummary("The following errors have occurred:") %></div>
                            <div class="hide" data-vse></div>--%>

                            <h2 class="form__title">Get a <b class="form__highlight">FREE</b> Quote!</h2>
                            <a href="tel:<%=phoneNumber %>" class="form__callout">
                                <svg
                                    class="icon form__icon"
                                    aria-hidden="true"
                                    role="presentation"
                                    focusable="false">
                                    <use href="#icon-phone">
                                </svg>
                                TALK TO AN AGENT &bull; <%=phoneNumber %>
                            </a>

                            <div class="form__group">
                                
                                <!-- Year -->
                                <%
                                    var yearMessage = Html.ValidationMessage("Year");
                                    var yearMessageIsInvalid = yearMessage != null;
                                %>
                                <div class="form message">
                                    <div class="form__field-label">
                                        <div class="form form--select <%= yearMessageIsInvalid ? "message__is-invalid" : string.Empty %>">
                                            <div class="form__contain">
                                                <select
                                                    name="Year"
                                                    id="Year"
                                                    class="form__field"
                                                    required>
                                                    <option value="0" hidden>Select Year</option>
                                                        <option value="2001">2001</option>
                                                        <option value="2002">2002</option>
                                                        <option value="2003">2003</option>
                                                        <option value="2004">2004</option>
                                                        <option value="2005">2005</option>
                                                        <option value="2006">2006</option>
                                                        <option value="2007">2007</option>
                                                        <option value="2008">2008</option>
                                                        <option value="2009">2009</option>
                                                        <option value="2010">2010</option>
                                                        <option value="2011">2011</option>
                                                        <option value="2012">2012</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2015">2015</option>
                                                        <option value="2016">2016</option>
                                                        <option value="2017">2017</option>
                                                        <option value="2018">2018</option>
                                                        <option value="2019">2019</option>
                                                        <option value="2020">2020</option>
                                                        <option value="2021">2021</option>
                                                        <option value="2022">2022</option>
                                                </select>
                                                <span
                                                    class="
                                                    form__field form__button
                                                ">
                                                    <svg
                                                        class="
                                                        icon icon--combobox
                                                    "
                                                        role="presentation"
                                                        focusable="false"
                                                        aria-hidden="true">
                                                        <use
                                                            href="#icon-arrows" />
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                        <label
                                            class="message__group"
                                            for="Year">
                                            <span class="message__label">
                                                <span class="form__error">* </span>Year
                                            </span>
                                        </label>
                                        <div class="message__group" role="alert">
                                            <span class="message__invalid">
                                                <% if (yearMessageIsInvalid) { %>
                                                    <%= yearMessage %>
                                                <% } else { %>
                                                    Please select an option for the Year field.
                                                <% } %>
                                            </span>
                                        </div>
                                    </div>
                                </div>


                                <!-- Make -->
                                <%
                                    var makeMessage = Html.ValidationMessage("Make");
                                    var makeMessageIsInvalid = makeMessage != null;
                                %>
                                <div class="form message">
                                    <div class="form__field-label">
                                        <div class="form form--select <%= makeMessageIsInvalid ? "message__is-invalid" : string.Empty %>">
                                            <div class="form__contain">
                                                <select
                                                    name="Make"
                                                    id="Make"
                                                    class="form__field"
                                                    required>
                                                    <option value="0" hidden>Select Make</option>
                                                </select>
                                                <span
                                                    class="
                                                    form__field form__button
                                                ">
                                                    <svg
                                                        class="
                                                        icon icon--combobox
                                                    "
                                                        role="presentation"
                                                        focusable="false"
                                                        aria-hidden="true">
                                                        <use
                                                            href="#icon-arrows" />
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                        <label
                                            class="message__group"
                                            for="Make">
                                            <span class="message__label">
                                                <span class="form__error">* </span>Make
                                            </span>
                                        </label>
                                        <div class="message__group" role="alert">
                                            <span class="message__invalid">
                                                <% if (makeMessageIsInvalid) { %>
                                                    <%= makeMessage %>
                                                <% } else { %>
                                                    Please select an option for the Make field.
                                                <% } %>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Model -->
                                <%
                                    var modelMessage = Html.ValidationMessage("ModelCar");
                                    var modelMessageIsInvalid = modelMessage != null;
                                %>
                                <div class="form message">
                                    <div class="form__field-label">
                                        <div class="form form--select <%= modelMessageIsInvalid ? "message__is-invalid" : string.Empty %>">
                                            <div class="form__contain">
                                                <select
                                                    name="ModelCar"
                                                    id="ModelCar"
                                                    class="form__field"
                                                    required>
                                                    <option value="0" hidden>Select Model</option>
                                                </select>
                                                <span
                                                    class="
                                                    form__field form__button
                                                ">
                                                    <svg
                                                        class="
                                                        icon icon--combobox
                                                    "
                                                        role="presentation"
                                                        focusable="false"
                                                        aria-hidden="true">
                                                        <use
                                                            href="#icon-arrows" />
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                        <label
                                            class="message__group"
                                            for="ModelCar">
                                            <span class="message__label">
                                                <span class="form__error">* </span>Model
                                            </span>
                                        </label>
                                        <div class="message__group" role="alert">
                                            <span class="message__invalid">
                                                <% if (modelMessageIsInvalid) { %>
                                                    <%= modelMessage %>
                                                <% } else { %>
                                                    Please select an option for the Model field.
                                                <% } %>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Current Mileage -->
                                <%
                                    var mileageMessage = Html.ValidationMessage("Mileage");
                                    var mileageMessageIsInvalid = mileageMessage != null;
                                %>
                                <div class="form message form__span-row">
                                   <div class="form__field-label">
                                        <input
                                            type="tel"
                                            maxlength="7"
                                            name="Mileage"
                                            id="Mileage"
                                            placeholder="Enter Current Mileage"
                                            required
                                            class="form__field <%= mileageMessageIsInvalid ? "message__is-invalid" : string.Empty %>" />
                                        <label
                                            class="message__group"
                                            for="Mileage">
                                            <span class="message__label">
                                                <span class="form__error">* </span>Current Mileage
                                            </span>
                                        </label>
                                        <div class="message__group" role="alert">
                                            <span class="message__invalid">
                                                <% if (mileageMessageIsInvalid) { %>
                                                    <%= mileageMessage %>
                                                <% } else { %>
                                                    Please enter the current mileage the vehicle has.
                                                <% } %>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- First Name -->
                                <div class="form message">
                                        <%
                                            var billingFirstNameMessage = Html.ValidationMessageFor(m => m.BillingFirstName);
                                            var billingFirstNameIsInvalid = billingFirstNameMessage != null;
                                        %>
                                        <div class="form__field-label">
                                            <input type="text" name="BillingFirstName" id="BillingFirstName" placeholder="First Name" required class="form__field <%= billingFirstNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingFirstName"] %>">
                                            <label class="message__group" for="BillingFirstName">
                                                <span class="message__label">
                                                    <span class="form__error">* </span>First Name
                                                </span>
                                            </label>
                                            <div class="message__group" role="alert">
                                                <span class="message__invalid">
                                                    <% if (billingFirstNameIsInvalid) { %>
                                                        <%= billingFirstNameMessage %>
                                                    <% } else { %>
                                                        Please enter a First Name.
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                <!-- Last Name -->
                                <div class="form message">
                                        <%
                                            var billingLastNameMessage = Html.ValidationMessageFor(m => m.BillingLastName);
                                            var billingLastNameIsInvalid = billingLastNameMessage != null;
                                        %>
                                        <div class="form__field-label">
                                            <input type="text" name="BillingLastName" id="BillingLastName" placeholder="Billing Last Name" required class="form__field <%= billingLastNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingLastName"] %>">
                                            <label class="message__group" for="BillingLastName">
                                                <span class="message__label">
                                                    <span class="form__error">* </span>Last Name
                                                </span>
                                            </label>
                                            <div class="message__group" role="alert">
                                                <span class="message__invalid">
                                                    <% if (billingLastNameIsInvalid) { %>
                                                        <%= billingLastNameMessage %>
                                                    <% } else { %>
                                                        Please enter a last name.
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                <!-- Phone -->
                                <div class="form message">
                                        <%
                                            var phoneMessage = Html.ValidationMessageFor(m => m.Phone);
                                            var phoneIsInvalid = phoneMessage != null;
                                        %>
                                        <div class="form__field-label">
                                            <input type="tel" name="Phone" id="Phone" placeholder="Phone Number" required class="form__field <%= phoneIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Phone"] %>">
                                            <label class="message__group" for="Phone">
                                                <span class="message__label">
                                                    <span class="form__error">* </span>Phone Number
                                                </span>
                                            </label>
                                            <div class="message__group" role="alert">
                                                <span class="message__invalid">
                                                    <% if (phoneIsInvalid) { %>
                                                        <%= phoneMessage %>
                                                    <% } else { %>
                                                        Please enter a Phone Number.
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>  

                                <!-- Email -->
                                <div class="form message">
                                        <%
                                            var emailMessage = Html.ValidationMessageFor(m => m.Email);
                                            var emailIsInvalid = emailMessage != null;
                                        %>
                                        <div class="form__field-label">
                                            <input type="text" name="Email" id="Email" placeholder="Email Address" required class="form__field <%= emailIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Email"] %>">
                                            <label class="message__group" for="Email">
                                                <span class="message__label">
                                                    <span class="form__error">* </span>Email Address
                                                </span>
                                            </label>
                                            <div class="message__group" role="alert">
                                                <span class="message__invalid">
                                                    <% if (emailIsInvalid) { %>
                                                        <%= emailMessage %>
                                                    <% } else { %>
                                                        Please enter an Email Address.
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                <!-- Zip Code -->
                                <div class="form message">
                                        <%
                                            var billingZipMessage = Html.ValidationMessageFor(m => m.BillingZip);
                                            var billingZipIsInvalid = billingZipMessage != null;
                                        %>
                                        <div class="form__field-label">
                                            <input type="text" name="BillingZip" id="BillingZip" placeholder="Zip Code" required class="form__field <%= billingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingZip"] %>">
                                            <label class="message__group" for="BillingZip">
                                                <span class="message__label">
                                                    <span class="form__error">* </span>Zip Code
                                                </span>
                                            </label>
                                            <div class="message__group" role="alert">
                                                <span class="message__invalid">
                                                    <% if (billingZipIsInvalid) { %>
                                                        <%= billingZipMessage %>
                                                    <% } else { %>
                                                        Please enter a Zip Code.
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                <!-- Terms -->
                                <%
                                    var termsMessage = Html.ValidationMessage("Terms");
                                    var termsIsInvalid = termsMessage != null;
                                %>
                                <div class="form__span-row form__text">
                                    <p id="terms-desc">
                                        I am completing and submitting this form
                                    so that Protection Direct will contact
                                    me quickly by phone, text, and/or or
                                    e-mail to discuss my vehicle.
                                    </p>

                                    <div class="form__checkbox-label">
                                        <input
                                            type="checkbox"
                                            value="true"
                                            id="terms"
                                            name="terms"
                                            required
                                            aria-labelledby="terms-label" />
                                        <label
                                            for="terms"
                                            class="form__label">
                                            <span class="form__checkbox"></span>
                                            <span id="terms-label">I agree</span>
                                        </label>
                                        <div class="message__group form__span-row" role="alert">
                                            <span class="message__invalid">
                                                <% if (termsIsInvalid) { %>
                                                    <%= termsMessage %>
                                                <% } else { %>
                                                    Please accept the terms.
                                                <% } %>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                
                                <input type="hidden" name="OrderType" value="none"/>
                                 <input type="hidden" name="PaymentType" value="card"/>

                                <div class="form__span-row form__button">
                                    <button
                                        type="submit"
                                        class="button button--callout">
                                        Submit
                                    </button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <section
        class="view content content--title-list-image section"
        aria-label="How it works">
        <div id="how-it-works" class="view__anchor"></div>
        <div class="view__in section__in">
            <div class="content__group">
                <h2 class="content__title">We have made it simple for you to start your protection
                today.
            </h2>
                <div class="content__list content__text">
                    <h3 class="content__header">How it works</h3>
                    <p>
                        It’s your car. We get it. We want you to have
                    complete confidence in Protection Direct, and that
                    is why we are giving you all the information you
                    need to get the right coverage. This video will
                    explain why you should choose Protection Direct, to
                    protect your cars and your budget from expensive
                    repairs.
                    </p>
                    <ul class="content__header">
                        <li>Review plans online</li>
                        <li>Personalize your coverage</li>
                        <li>Choose your plan</li>
                        <li>Relax and drive on</li>
                    </ul>
                </div>
                <div class="content__picture content__text content__button">
                    <img
                        src="/images/couple-driving.jpg"
                        width="572"
                        height="382"
                        loading="lazy"
                        alt="A couple driving together and smiling while wearing sun glasses" />
                    <a href="HowItWorks<%= DtmContext.ApplicationExtension %>" class="button" id="how-it-works-button">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <section
        class="view section bg--light content--choose-coverage"
        aria-labelledby="protection-plans-title">
        <div id="protection-plans" class="view__anchor"></div>
        <div class="view__in section__in">
            <div class="content__group">
                <div class="content__text">
                    <h2 class="content__title" id="protection-plans-title">Select the <b>Best Coverage</b>
                    </h2>
                    <p>
                        Protection Direct provides continued mechanical
                    breakdown protection on the enrolled vehicle(s) for
                    one low monthly fee. The coverage terminates only if
                    the fee is not paid.
                    </p>
                </div>
                <div class="card">
                    <h3 class="card__title">EZ Guard</h3>
                    <div class="card__content">
                        <h4 class="card__header">1-100,000

                            <span class="card__orphan">miles</span>
                        </h4>
                        <p class="card__text">
                            This vehicle service contract is most similar to
                        the manufacturers' new car warranty. It covers
                        everything from engine and transmission failure
                        to high tech electrical and sensors.
                        </p>
                        <a
                            href="<%= registerLink.Page %>"
                            class="button button--callout card__button"
                            id="ez-guard-button">Start Coverage</a>
                    </div>
                </div>
                <div class="card card--primary">
                    <h3 class="card__title">EZ Elite</h3>
                    <div class="card__content">
                        <h4 class="card__header">100,000-150,000

                            <span class="card__orphan">miles</span>
                        </h4>
                        <p class="card__text">
                            This vehicle service contract is the best
                        coverage option for a vehicle with higher miles
                        on it, it protects your vehicle's engine,
                        transmission, AC, electrical system, starter,
                        water pump, fuel pump & more.
                        </p>
                        <a
                            href="<%= registerLink.Page %>"
                            class="button button--callout card__button"
                            id="ez-elite-button">Start Coverage</a>
                    </div>
                </div>
                <div class="card card--primary-dark">
                    <h3 class="card__title">EZ Select</h3>
                    <div class="card__content">
                        <h4 class="card__header">150,000+<span class="card__orphan">
                            miles</span>
                        </h4>
                        <p class="card__text">
                            Just the coverage you need for vehicles with over 150,000 miles. Protection for the engine, transmission, transfer case and other components to keep your high mileage vehicle on the road.
                    </p>
                    <a
                        href="<%= registerLink.Page %>"
                        class="button button--callout card__button"
                        id="ez-select-button"
                        >Start Coverage</a
                    >
                </div>
            </div>
        </div>
    </div>
</section>

<section
    class="view content content--text-bg-image section"
    aria-labelledby="coverage-benefits-title"
>
<div id="coverage-benefits" class="view__anchor"></div>
    <img
        class="content__bg-image"
        src="/images/girl-driving.jpg"
        loading="lazy"
        alt="A girl driving in a car"
    />

    <div class="view__in section__in">
        <div class="content__text">
            <h2 class="content__title" id="coverage-benefits-title">
                Additional Benefits
            </h2>
            <p>
                Coverage well beyond the life of the manufacturers
                warranty
            </p>
            <ul>
                <li>24 hour roadside</li>
                <li>Towing</li>
                <li>Rental Car</li>
                <li>Your choice of mechanic</li>
                <li>Easier on your budget</li>
                <li>Flexible payment plans</li>
            </ul>
            <a href="AdditionalBenefits<%=DtmContext.ApplicationExtension %>" class="button" id="benefits-button"
                >Learn More</a
            >
        </div>
    </div>
</section>

<section class="section view" aria-labelledby="repairs-title">
        <div id="repairs" class="view__anchor"></div>
    <div class="section__in view__in">
        <div class="content--repairs">
            <h2 class="content__title" id="repairs-title">Protect yourself against the expensive cost of repairs</h2>
            <p>Average repair costs (without coverage)</p>
            <div class="horizon">
                <dl class="horizon__list">
                    <div class="horizon__item price-count">
                        <dt>Oil Pump</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$1,295</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="1295">0</span>
                        </dd>
                    </div>
                    <div class="horizon__item price-count">
                        <dt>Transmission</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$5,263</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="5263">0</span>
                        </dd>
                    </div>
                    <div class="horizon__item price-count">
                        <dt>Radiator</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$891</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="891">0</span>
                        </dd>
                    </div>
                    <div class="horizon__item price-count">
                        <dt>Air Conditioning Compressor</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$1,044</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="1044">0</span>
                        </dd>
                    </div>
                    <div class="horizon__item price-count">
                        <dt>Starter</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$610</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="610">0</span>
                        </dd>
                    </div>
                    <div class="horizon__item price-count">
                        <dt>Alternator</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$758</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="758">0</span>
                        </dd>
                    </div>
                    <div class="horizon__item price-count">
                        <dt>Rack &amp; Pinion</dt>
                        <dd class="horizon__detail sr">
                            <span class="sr__text">$1,840</span>
                            <span aria-hidden="true" role="presentation" data-count-price-up="1840">0</span>
                        </dd>
                    </div>
                </dl>
                <figure class="horizon__figure">
                    <img
                        src="/images/car.jpg"
                        width="709"
                        height="332"
                        loading="lazy"
                        alt="Side view of a blue hatchback car"
                        class="horizon__picture"
                    />
                    <figcaption>
                        <b>We have made it simple for you to start your protection today.</b><br>
                        <small>Repair costs displayed are estimates provided by repairpal.com/estimator</small>
                    </figcaption>
                </figure>
            </div>
            <a href="<%= registerLink.Page %>" class="button button--callout" id="repairs-btn">Click Here To Start Your Coverage Today</a>
        </div>
    </div>
</section>

<!-- Testimonials -->
<section class="view section content--testimonials" aria-label="Customer Reviews">
    <div id="customer-reviews" class="view__anchor"></div>
    <img class="content__bg-image" loading="lazy" src="/images/testimonials_background.svg"/>
    <div class="view__in section__in content__testimonials">
        <h2 class="content__title">People are saying</h2>
        <div class="slide slide--carousel">
            <div class="slide__js">
                <nav class="slide__nav">
                    <button
                        aria-label="Select the previous slide"
                        class="slide__prev slide__button"
                        type="button"
                    >
                        <svg aria-hidden="true" role="presentation" class="icon slide__icon">
                            <use href="#icon-chevron-thin-left"></use>
                        </svg>
                    </button>
                        
                    <button
                        aria-label="Select the next slide"
                        class="slide__next slide__button"
                        type="button"
                    >
                        <svg aria-hidden="true" role="presentation" class="icon slide__icon">
                            <use href="#icon-chevron-thin-right"></use>
                        </svg>
                    </button>
                </nav>
            </div>
            <div id="alpha" class="slide__into">
                <div class="slide__item" id="alpha-0">
                    <figure class="content__text">
                        <blockquote>“I am very satisfied with Protection Direct! As an owner of multiple vehicles, we receive numerous vehicle warranty offers, and have been disappointed in the past. Protection Direct was not only professional and affordable, the membership information was clearly explained and truly provided our family peace of mind…”</blockquote>
                        <figcaption class="content__caption">Bethany, OH</figcaption>
                        <a href="Reviews<%= DtmContext.ApplicationExtension %>" class="button content__button">
                            <span>Read More Reviews</span>
                        </a>
                    </figure>
                </div>
                <div class="slide__item" id="alpha-1">
                    <figure class="content__text">
                        <blockquote>"I had a very positive experience with this company. A little over a year ago, my factory warranty had expired, and I was nervous about purchasing a contract for new coverage. Protection Direct was able to answer all of my questions and concerns, and got me a payment plan that worked for my budget. Last week my AC went out. Protection Direct took care of everything with the service facility, and was able to get my vehicle repaired and back to me quickly. This was definitely a positive experience for me."</blockquote>
                        <figcaption class="content__caption">Brittany R.</figcaption>
                        <a href="Reviews<%= DtmContext.ApplicationExtension %>" class="button content__button">
                            <span>Read More Reviews</span>
                        </a>
                    </figure>
                </div>
            </div>
        </div>
        </div>
</section>

<!-- Who we are -->
<section
    class="view content content--image-text section"
    aria-labelledby="why-protection-direct-title"
>
    <div id="why-protection-direct" class="view__anchor"></div>
    <div class="view__in section__in">
        <div class="content__group">
            <picture class="content__picture">
                <img
                    src="/images/thumbs-up.jpg"
                    width="455"
                    height="455"
                    loading="lazy"
                    alt="Young woman and a young man sitting in a car and giving thumbs up"
                />
            </picture>
            <div class="content__text">
                <h2 id="why-protection-direct-title" class="content__title">
                    Who we are
                </h2>
                <p>
                    We come together each day to fulfill the promise we
                    have to consumers in offering the single most
                    comprehensive home and auto protection. In short, we
                    find consumers the best coverage with the best rated
                    administrators, at the best price. To that end, we
                    keep customers at the center of everything we do.
                    </p>
                    <a href="<%= registerLink.Page %>" class="button button--callout">Start Your Coverage Today</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>