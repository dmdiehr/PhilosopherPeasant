using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.AspNet.Authorization;


namespace PhilosopherPeasant.Controllers
{
    //[Authorize(Roles="Admin, Editor in chief, Editor, Writer")]
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
