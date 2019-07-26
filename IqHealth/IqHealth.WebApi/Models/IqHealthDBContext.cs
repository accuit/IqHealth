using IqHealth.WebApi.Model.DataModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace IqHealth.WebApi.Model
{
    public class IqHealthDBContext : DbContext
    {

        public IqHealthDBContext() : base("name=IqHealthConnection")
        {
            this.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);
        }
        public DbSet<Login> Login { get; set; }
        public DbSet<User> User { get; set; }

        //protected override void OnModelCreating(ModuleBuilder builder)
        //{
        //    builder.Entity<Login>().HasKey(m => m.Id);


        //    builder.Entity<Login>().Property<DateTime>("LoginDate");

            

        //    base.OnModelCreating(builder);
        //}

        public override int SaveChanges()
        {
            ChangeTracker.DetectChanges();

            updateUpdatedProperty<Login>();
            updateUpdatedProperty<User>();


            return base.SaveChanges();
        }

        private void updateUpdatedProperty<T>() where T : class
        {
            var modifiedSourceInfo =
                ChangeTracker.Entries<T>()
                    .Where(e => e.State == EntityState.Added || e.State == EntityState.Modified);

            foreach (var entry in modifiedSourceInfo)
            {
                entry.Property("UpdatedDate").CurrentValue = DateTime.UtcNow;
            }
        }
    }
}
