using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using PhilosopherPeasant.Models;
using Microsoft.AspNet.Mvc.Rendering;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace PhilosopherPeasant.Controllers
{
    public class WritersController : Controller
    {
        private ApplicationDbContext db;
        public WritersController(ApplicationDbContext context)
        {
            db = context;
        }

        public IActionResult Index()
        {
            return View(db.Writers.ToList());
        }
        public IActionResult Create()
        {
          return View();
        }
        [HttpPost]
        public IActionResult Create (Writer writer)
        {
          db.Writers.Add(writer);
          db.SaveChanges();
          return RedirectToAction("Index");
        }
        public IActionResult Edit(int id)
        {
            var writer = db.Writers.FirstOrDefault(w => w.WriterId == id);
            return View(writer);
        }
        [HttpPost]
        public IActionResult Edit(Writer writer)
        {
            db.Entry(writer).State = Microsoft.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
          var thisWriter = db.Writers.FirstOrDefault(w => w.WriterId == id);
          db.Writers.Remove(thisWriter);
          db.SaveChanges();
          return RedirectToAction("Index");
        }
    }
}
