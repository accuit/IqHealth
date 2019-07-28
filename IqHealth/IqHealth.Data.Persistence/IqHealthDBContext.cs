﻿using IqHealth.Persistence.Models;
using MySql.Data.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence
{
    [DbConfigurationType(typeof(MySqlEFConfiguration))]
    public class IqHealthDBContext: DbContext
    {
        public DbSet<User> User { get; set; }

        public IqHealthDBContext()
            : base("IqHealthConnection")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}
