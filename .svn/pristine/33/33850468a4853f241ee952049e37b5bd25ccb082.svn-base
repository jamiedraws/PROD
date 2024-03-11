using System;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using System.Text.RegularExpressions;
using PROD.Services;
using System.Linq;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using PROD.PhoneNumbers;
using Dtm.Framework.Models.Ecommerce;
using Dtm.Framework.Services.DtmApi;

namespace PROD.PageHandlers
{
    public class GlobalPageHandler : PageHandler
    {
        public override void PostValidate(ModelStateDictionary modelState)
        {

            if (DtmContext.Page.IsStartPageType)
            {

                var make = Form["Make"] ?? string.Empty;
                ViewData["Make"] = make;

                var year = Form["Year"] ?? string.Empty;
                ViewData["Year"] = year;

                var modelCar = Form["ModelCar"] ?? string.Empty;
                ViewData["ModelCar"] = modelCar;

                var mileage = Form["Mileage"] ?? string.Empty;
                ViewData["Mileage"] = mileage;

                var billingFirstName = Form["BillingFirstName"] ?? string.Empty;
                var billingLastName = Form["BillingLastName"] ?? string.Empty;
                var billingZip = Form["BillingZip"] ?? string.Empty;
                var phone = Form["Phone"] ?? string.Empty;
                var email = Form["Email"] ?? string.Empty;
                var usaZipFormat = @"^\d{5}([\-]?\d{4})?$";
                var emailRegex = "^(?:[A-z0-9%&+-]+[.])*[A-z0-9%&+-]+@[A-z0-9.-]+\\.[A-z]{2,6}$";
                var zeroesOnlyRegex = "^[0]+$";
                var terms = Form["terms"];

                string cbxChecked;
                if (((object)(terms)) == null)
                    cbxChecked = "false";
                else
                    cbxChecked = "true";

                if (make == "0")
                {
                    modelState.AddModelError("Make", "Please select an option for the Make field.");
                }
                if (year == "0")
                {
                    modelState.AddModelError("Year", "Please select an option for the Year field.");
                }
                if (String.IsNullOrEmpty(modelCar) || modelCar == "0")
                {
                    modelState.AddModelError("ModelCar", "Please select an option for the Model field.");
                }
                if (String.IsNullOrEmpty(billingFirstName))
                {
                    modelState.AddModelError("BillingFirstName", "First Name is required");
                }
                if (String.IsNullOrEmpty(billingLastName))
                {
                    modelState.AddModelError("BillingLastName", "Last Name is required");
                }
                if (String.IsNullOrEmpty(billingZip))
                {
                    modelState.AddModelError("BillingZip", "Zip Code is required");
                }
                if (!Regex.IsMatch(billingZip, usaZipFormat))
                {
                    modelState.AddModelError("BillingZip", "Please enter a valid US Zip Code.");
                }
                if (String.IsNullOrEmpty(email))
                {
                    modelState.AddModelError("Email", "Email is required.");
                }
                else if (!Regex.IsMatch(email, emailRegex, RegexOptions.IgnoreCase))
                {
                    modelState.AddModelError("Email", "Email is invalid.");
                }
                if (String.IsNullOrEmpty(phone))
                {
                    modelState.AddModelError("Phone", "Phone is Required.");
                }
                else if (Regex.IsMatch(phone, zeroesOnlyRegex, RegexOptions.IgnoreCase))
                {
                    modelState.AddModelError("Phone", "Please enter a valid phone number");
                }
                if (!bool.Parse(cbxChecked))
                {
                    modelState.AddModelError("Terms", "Terms is required.");
                }
                if (String.IsNullOrEmpty(mileage))
                {
                    modelState.AddModelError("Mileage", "Please enter the current mileage the vehicle has.");
                }
            }
        }
        public override void PostSetOrderStatus()
        {
            base.PostSetOrderStatus();
            Order.OrderStatusId = 1;
        }
        public override void PostProcessPageActions()
        {
            //Checking for the pages code based on the main order pages array on line ten.
            if (DtmContext.Page.IsStartPageType)
            {

                var make = Form["Make"] ?? string.Empty;
                Order.AddOrderCode(make, "Make");

                var year = Form["Year"] ?? string.Empty;
                Order.AddOrderCode(year, "Year");

                var modelCar = Form["ModelCar"] ?? string.Empty;
                Order.AddOrderCode(modelCar, "Model");

                var mileage = Form["Mileage"] ?? string.Empty;
                Order.AddOrderCode(mileage, "CurrentMileage");

                var terms = Form["terms"] ?? string.Empty;

                string cbxChecked;
                if (((object)(terms)) == null)
                    cbxChecked = "false";
                else
                    cbxChecked = "true";

                Order.AddOrderCode(cbxChecked, "Terms");

                //Send order to CRM 
                if (Order.IsTestOrder)
                {
                    Order.AddOrderCode("TEST", "CRM_RESPONSE");
                    return;
                }

                try
                {
                    var _engine = new InlineDataSystems();
                    var isSuccessful = _engine.SendLead(Order);
                    var responseOrderCode = isSuccessful ? _engine.finalResponse : "FAILED";
                    Order.AddOrderCode(responseOrderCode, "CRM_RESPONSE");

                    _engine.SaveMatchbackRecord(Order);  
                }
                catch (Exception ex)
                {
                    new SiteExceptionHandler(ex);
                }         
                
                //send sms to customer
                var phoneNumbers = new MediaTollFreeNumbers();
                var phoneNumber = phoneNumbers.GetPhoneNumber();
                SendSMS(phoneNumber);
            }
        }
        private void SendSMS(string agentPhoneNumber)
        {
            try
            {
                var smsSent = Order.Codes["SmsSent"].Code;
                var wasSmsSent = false;

                if ((!string.IsNullOrWhiteSpace(smsSent) && bool.TryParse(smsSent, out wasSmsSent) && wasSmsSent))
                {
                    //Text Message was already sent
                    return;
                }


                var fromNumber = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Twilio.From", "+18889981499"];
                var sid = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Twilio.SID", "ACe4a0caa3f35dd7557ccd9dc8a16e95fb"];
                var version = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Twilio.ApiVersion", "2010-04-01"];
                var authtoken = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Twilio.AuthToken", "e5f49e8ba150e7fa86ab16dba4375815"];
                var endpoint = string.Format("https://api.twilio.com/{0}/Accounts/{1}/Messages.json", version, sid);
                var response = string.Empty;

                var body = string.Format("Thank you for your interest in Protection Direct Auto Protection! " +
                    "Please call {0} if you prefer to speak to one of our agents for a quote!", agentPhoneNumber);

                var request = new NameValueCollection { { "To", Order.Phone }, { "From", fromNumber }, { "Body", body } };
                using (var client = new WebClient())
                {
                    client.Headers[HttpRequestHeader.Authorization] = "Basic " + Convert.ToBase64String(Encoding.ASCII.GetBytes(sid + ":" + authtoken));

                    var bytes = client.UploadValues(endpoint, request);
                    response = Encoding.UTF8.GetString(bytes);
                }


                OrderManager.AddOrderCode(Regex.IsMatch(response, @"""status"": ""queued""", RegexOptions.IgnoreCase).ToString(), "SmsSent");
                OrderManager.AddOrderCode(string.Join(" & ", request.AllKeys.Select(k => k + " = " + request[k])), "SmsRequest");
                OrderManager.AddOrderCode(response, string.Format("SMSResponse{0:MMddyyyyHHmmss}", DateTime.Now));

            }
            catch (WebException we)
            {
                var response = we.Response;
                if (response != null)
                {
                    var stream = response.GetResponseStream();
                    if (stream != null)
                    {
                        using (var reader = new System.IO.StreamReader(stream))
                        {
                            var errorMessage = reader.ReadToEnd();
                            new SiteExceptionHandler(errorMessage);
                        }
                    }
                    else
                    {
                        new SiteExceptionHandler(we);
                    }
                }
                else
                {
                    new SiteExceptionHandler(we);
                }
            }
            catch (Exception ex)
            {
                new SiteExceptionHandler(ex);
            }
        }

    }
}