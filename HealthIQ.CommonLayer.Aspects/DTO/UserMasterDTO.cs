﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class UserMasterDTO
    {
        public int UserID { get; set; }

        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        public string Image { get; set; }
        public string ImagePath { get; set; }

        [StringLength(50)]
        public string UserCode { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        public string LoginName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        [StringLength(500)]
        public string Address { get; set; }
        public int? City { get; set; }
        public int? State { get; set; }
        public int? Country { get; set; }
        public string Pin { get; set; }
        public int? UserStatus { get; set; }

        public DateTime CreatedDate { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public bool IsDeleted { get; set; }
        public bool IsEmployee { get; set; }
        public bool IsCustomer { get; set; }
        public bool IsStudent { get; set; }
        public bool IsAdmin { get; set; }

        [StringLength(20)]
        public string Password { get; set; }

        public string ConfirmPassword { get; set; }

        public string GUID { get; set; }

        [StringLength(15)]
        public string Mobile { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CompanyID { get; set; }

        public string[] Roles { get; set; }
    }
}
