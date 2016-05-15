using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using PhilosopherPeasant.Models;

namespace PhilosopherPeasant.Controllers
{
    public class HomeController : Controller
    {
        private ApplicationDbContext _db;
        public HomeController(ApplicationDbContext context)
        {
            _db = context;
        }
        public IActionResult Index()
        {
            ICollection<Article> articleList = _db.Articles.Include(a => a.Contributor).ToList();
            return View(_db.Articles.ToList());
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }
        
        public IActionResult Portal()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
