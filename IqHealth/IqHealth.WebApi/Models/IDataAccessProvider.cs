using IqHealth.WebApi.Model.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IqHealth.WebApi.Model
{
    public interface IDataAccessProvider
    {
        List<Login> GetLoginData();
        User UserLogin(string username, string password);
    }
}
