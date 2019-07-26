using IqHealth.WebApi.Model.DataModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace IqHealth.WebApi.Model
{
    [Table("tbl_Login")]
    public class Login
    {
        [Key]
        public int Id { get; set; }

        public int UserID { get; set; }

        public string Password { get; set; }

        public int LastLoginStatus { get; set; }

        public DateTime LoginDate { get; set; }
    }
}
