using Leela.PresentationLayer.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Leela.PresentationLayer.WebApp.ViewModels
{
    public class ServicesViewModel
    {
        public List<HealthServiceMaster> services { get; set; }
        public HealthServiceMaster service { get; set; }
    }
}