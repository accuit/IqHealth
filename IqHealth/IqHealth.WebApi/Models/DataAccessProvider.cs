using IqHealth.WebApi.Model.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IqHealth.WebApi.Model
{
    public class DataAccessProvider : IDataAccessProvider
    {
        private readonly IqHealthDBContext _context;

        public DataAccessProvider(IqHealthDBContext context)
        {
            _context = context;
        }

        public List<Login> GetLoginData()
        {
            return  _context.Login.ToList();
        }

        public User UserLogin(string username, string password)
        {
            var user = _context.User.Where(x => x.Email.Contains(username) && (x.Password == password)).FirstOrDefault();
            return  user == null? null: user;
        }
    }
}
