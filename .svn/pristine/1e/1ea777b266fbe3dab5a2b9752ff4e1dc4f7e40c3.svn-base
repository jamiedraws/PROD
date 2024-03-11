using Dtm.Framework.ClientSites;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models.Ecommerce;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace PROD.Services
{
    public class InlineDataSystems
    {
        private const string LEAD_URL_FORMAT = "https://{0}/services/securerestservice.svc/{1}~{2}/ImportleadWebGet";
        private string _leadUrl;
        public string finalResponse = string.Empty;

        public InlineDataSystems()
        {
            _leadUrl = string.Format(LEAD_URL_FORMAT, "serviceprotectiondirect.inlinecrm.com",
                "0340f018-db27-4a6a-ac11-c0d73a077e67",
                "U000000000OQ"
                );
        }

        public bool SendLead(Order order)
        {
            var lead = new LeadObject(order);
            bool isSuccessful = false;
            var response = string.Empty;
            try
            {
                var properties = from p in lead.GetType().GetProperties()
                                 where p.GetValue(lead, null) != null
                                 select p.Name + "=" + HttpUtility.UrlEncode(p.GetValue(lead, null).ToString());
                string queryString = String.Join("&", properties.ToArray());
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(string.Format("{0}?{1}", _leadUrl, queryString));
                request.Method = "GET";
                using (HttpWebResponse webResponse = (HttpWebResponse)request.GetResponse())
                {
                    Stream dataStream = webResponse.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    response = reader.ReadToEnd();
                    reader.Close();
                    dataStream.Close();

                    if (response != null)
                    {
                        var strResponse = JsonConvert.DeserializeObject<string>(response);
                        var leadResponse = JObject.Parse(strResponse).ToObject<ResponseObject>();

                        if (string.Equals(leadResponse.ResponseMessage, "Import Complete", StringComparison.InvariantCultureIgnoreCase))
                        {
                            isSuccessful = true;
                            finalResponse = strResponse;
                        }
                        else
                        {
                            response = string.Format("Request Failed, Message: {0} . Response: {1}", leadResponse.ResponseMessage, strResponse);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                response = string.Format("Request Failed, Message: {0} Error: Error during lead transmission.", ex.Message);
            }

            return isSuccessful;
        }

        public void SaveMatchbackRecord(Order order)
        {
            var date = DateTime.Now;
            var user = "PROD";
            var fileName = "protection_direct_ordermatchbacks.csv";
            var matchBack = new 
            {
                Attended = true,
                AddDate = date,
                AddUser = user,
                ChangeDate = date,
                ChangeUser = user,
                Email = order.Email,
                FileName = fileName,
                OrderId = order.OrderID,
                OrderMatchBackTypeId = 1
            };

            var client = new Dtm.Framework.Services.DtmApi.DtmApiClient();
            var response = client.PostWorker("MatchBack", "Add", matchBack);
   
            if (response == null || response.StatusCode != HttpStatusCode.OK)
            {
                order.AddOrderCode("false", "OrderMatchBackLeadCreated");
            }
            else
            {
                order.AddOrderCode("true", "OrderMatchBackLeadCreated");
            }
       

        }
        private class ApiClient : WebClient
        {
            public ApiClient(string token)
            {
                Headers.Add("X-DtmApi", token);
            }

            public string PostJson(string url, string postdata)
            {
                Headers.Add("Content-Type", "application/json");
                var postBytes = Encoding.GetBytes(postdata);
                var bytes = UploadData(url, postBytes);
                var jsonString = Encoding.GetString(bytes);
                return jsonString;
            }

            public string PostJson(string url, object postdata)
            {
                var jsonData = new JavaScriptSerializer().Serialize(postdata);
                return PostJson(url, jsonData);
            }
        }
  
        private class LeadObject
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string CampaignCode { get; set; }
            public string PostalCode { get; set; }
            public string Phone1 { get; set; }
            public int VehicleOdometer { get; set; }
            public string Email { get; set; }
            public string VehicleMakeName { get; set; }
            public string VehicleModelName { get; set; }
            public int VehicleYear { get; set; }
            public string Identifier1 { get; set; }

            public LeadObject(Order order)
            {
                int vehicleYear;
                int vehicleOdometer;

                FirstName = order.BillingFirstName;
                LastName = order.BillingLastName;
                CampaignCode = "DTM01";
                Phone1 = order.Phone;
                Email = order.Email;
                PostalCode = order.BillingZip;
                Identifier1 = order.OrderID.ToString();
                VehicleMakeName = order.OrderCodes.FirstOrDefault(x => x.Label == "Make").Code ?? string.Empty;
                VehicleModelName = order.OrderCodes.FirstOrDefault(x => x.Label == "Model").Code ?? string.Empty;

                if (int.TryParse(order.OrderCodes.FirstOrDefault(x => x.Label == "Year").Code, out vehicleYear) && vehicleYear > 0)
                {
                    VehicleYear = vehicleYear;
                }
                if (int.TryParse(order.OrderCodes.FirstOrDefault(x => x.Label == "CurrentMileage").Code, out vehicleOdometer) && vehicleOdometer > 0)
                {
                    VehicleOdometer = vehicleOdometer;
                }
            }

        }
        private class ResponseObject
        {
            [JsonProperty("responseCode")]
            public string ResponseCode { get; set; }

            [JsonProperty("responseMessage")]
            public string ResponseMessage { get; set; }

            [JsonProperty("entityId")]
            public int? EntityId { get; set; }

            [JsonProperty("entityType")]
            public string EntityType { get; set; }

            [JsonProperty("vehicleId")]
            public object VehicleId { get; set; }

            [JsonProperty("campaignTargetId")]
            public int CampaignTargetId { get; set; }

            [JsonProperty("targetResponseId")]
            public int TargetResponseId { get; set; }

            [JsonProperty("quoteId")]
            public object QuoteId { get; set; }
        }
    }
}