﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        public Nullable<int> laddcityid { get; set; }
        public string laddpincode { get; set; }
        public string cbilladdstreet1 { get; set; }
        public string cbilladdstreet2 { get; set; }
        public Nullable<int> lbilladdcityid { get; set; }
        public string lbillpincode { get; set; }
        public string ccontactno { get; set; }
        public Nullable<int> lhearaboutid { get; set; }
        public Nullable<byte> bstatus { get; set; }
        public Nullable<int> ladminid { get; set; }
        public Nullable<int> llasteditadminid { get; set; }
        public Nullable<System.DateTime> dentrydatetime { get; set; }
        public Nullable<System.DateTime> dlasteditdate { get; set; }
        public string clastipaddress { get; set; }
        public Nullable<byte> bdeleteflag { get; set; }
        public Nullable<byte> bemailstatus { get; set; }
        public Nullable<byte> bnewsletterstatus { get; set; }
        public Nullable<int> laddstateid { get; set; }
        public Nullable<int> laddcountryid { get; set; }
        public string caddcityname { get; set; }
        public Nullable<int> lbilladdstateid { get; set; }
        public Nullable<int> lbilladdcountryid { get; set; }
        public string cbilladdcityname { get; set; }
        public Nullable<decimal> WalletAmount { get; set; }

    }
}