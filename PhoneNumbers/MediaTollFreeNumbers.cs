using System;
using System.Collections.Generic;
using Dtm.Framework.ClientSites.Web;

namespace PROD.PhoneNumbers
{
    public class MediaTollFreeNumbers
    {
        public List<Tuple<string, string, string>> TrafficCodesPhoneNumbers;
        private const string _defaultPhoneNumber = "1-888-909-5035";

        public MediaTollFreeNumbers()
        {
            TrafficCodesPhoneNumbers = new List<Tuple<string, string, string>>() {

                new Tuple<string, string, string>("IONAME", "Facebook_Prospecting", "1-866-886-0174"),
                new Tuple<string, string, string>("IONAME", "Facebook_Lookalikes", "1-866-886-0175"),
                new Tuple<string, string, string>("IONAME", "Facebook_Retargeting", "1-866-886-0177"),
                new Tuple<string, string, string>("VENDOR", "YahooStream", "1-866-886-0178" ),
                new Tuple<string, string, string>("VENDOR","Bing", "1-866-888-9070" ),
                new Tuple<string, string, string>("VENDOR", "Criteo", "1-866-888-2545"),
                new Tuple<string, string, string>("VENDOR", "AimTell", "1-888-909-5035" ),
                new Tuple<string, string, string>("PARTIALMATCH", "-01", "1-866-888-2011"),
                new Tuple<string, string, string>("PARTIALMATCH","-02", "1-866-888-2011"),
                new Tuple<string, string, string>("PARTIALMATCH","-03", "1-866-888-1925"),
                new Tuple<string, string, string>("PARTIALMATCH", "-04", "1-866-888-2007"),
                new Tuple<string, string, string>("PARTIALMATCH", "-05", "1-866-888-2006")

            };

        }

        public string GetPhoneNumber()
        {
            var vendor = DtmContext.Traffic.VendorCode;
            var ioName = DtmContext.Traffic.InsertionOrderCode;

            foreach (var number in TrafficCodesPhoneNumbers)
            {
                var type = number.Item1;
                var name = number.Item2;
                var phone = number.Item3;

                if (vendor == name)
                {
                    return phone;
                }
                else if (ioName == name)
                {
                    return phone;
                }
                else if (type == "PARTIALMATCH" && vendor == "Google" && ioName.Contains(name))
                {
                    return phone;
                }

            }
            return _defaultPhoneNumber;
        }
    }
}