using System;

namespace HealthIQ.BusinessLayer.Services.BO
{
    public  class UserMasterBO
    {
        public int UserID { get; set; }
        public string cfirstname { get; set; }
        public string clastname { get; set; }
        public string cemailaddress { get; set; }
        public string cpassword { get; set; }
        public string caddstreet1 { get; set; }
        public string caddstreet2 { get; set; }
        public int? laddcityid { get; set; }
        public string laddpincode { get; set; }
        public string cbilladdstreet1 { get; set; }
        public string cbilladdstreet2 { get; set; }
        public int? lbilladdcityid { get; set; }
        public string lbillpincode { get; set; }
        public string ccontactno { get; set; }
        public int? lhearaboutid { get; set; }
        public byte? bstatus { get; set; }
        public int? ladminid { get; set; }
        public int? llasteditadminid { get; set; }
        public DateTime? dentrydatetime { get; set; }
        public DateTime? dlasteditdate { get; set; }
        public string clastipaddress { get; set; }
        public byte? bdeleteflag { get; set; }
        public byte? bemailstatus { get; set; }
        public byte? bnewsletterstatus { get; set; }
        public int? laddstateid { get; set; }
        public int? laddcountryid { get; set; }
        public string caddcityname { get; set; }
        public int? lbilladdstateid { get; set; }
        public int? lbilladdcountryid { get; set; }
        public string cbilladdcityname { get; set; }
        public decimal? WalletAmount { get; set; }

    }
}