using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using PhilosopherPeasant.Models;
using Microsoft.AspNet.Mvc.Rendering;

namespace PhilosopherPeasant.Controllers
{
    public class ContributorsController : Controller
    {
        private ApplicationDbContext db;
        public ContributorsController(ApplicationDbContext context)
        {
            db = context;
        }

        public IActionResult Index()
        {
            return View(db.Contributors.ToList());
        }
        public IActionResult Create()
        {
          return View();
        }
        [HttpPost]
        public IActionResult Create (Contributor contributor)
        {
          db.Contributors.Add(contributor);
          db.SaveChanges();
          return RedirectToAction("Index");
        }
        public IActionResult Edit(int id)
        {
            var contributor = db.Contributors.FirstOrDefault(w => w.ContributorId == id);
            return View(contributor);
        }
        [HttpPost]
        public IActionResult Edit(Contributor contributor)
        {
            db.Entry(contributor).State = Microsoft.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
          var thisContributor = db.Contributors.FirstOrDefault(w => w.ContributorId == id);
          db.Contributors.Remove(thisContributor);
          db.SaveChanges();
          return RedirectToAction("Index");
        }
    }
}
