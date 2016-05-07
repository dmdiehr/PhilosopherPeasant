using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using PhilosopherPeasant.Models;
using Microsoft.AspNet.Mvc.Rendering;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Authorization;

namespace PhilosopherPeasant.Controllers
{
    public class ContributorsController : Controller
    {
        private ApplicationDbContext _db;
        private readonly UserManager<ApplicationUser> _userManager;

        public ContributorsController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _db = context;
            _userManager = userManager;
        }
   
        [Authorize(Roles = "Editor in chief")]
        public IActionResult Index()
        {
            return View(_db.Contributors.ToList());
        }
        [Authorize(Roles = "Editor in chief")]
        public IActionResult CreateContributor()
        {
          return View();
        }
        [Authorize(Roles = "Editor in chief")]
        [HttpPost]
        public IActionResult CreateContributor (Contributor contributor)
        {
          _db.Contributors.Add(contributor);
          _db.SaveChanges();
          return RedirectToAction("Index");
        }
        [Authorize(Roles = "Editor in chief,Editor,Writer")]
        public IActionResult EditContributor(int id)
        {
            var contributor = _db.Contributors.FirstOrDefault(w => w.ContributorId == id);
            return View(contributor);
        }
        [Authorize(Roles = "Editor in chief,Editor,Writer")]
        [HttpPost]
        public IActionResult EditContributor(Contributor contributor)
        {
            _db.Entry(contributor).State = Microsoft.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult DeleteContributor(int id)
        {
            var thisContributor = _db.Contributors.FirstOrDefault(c => c.ContributorId == id);
            var thisApplicationUser = thisContributor.ApplicationUser;
            var thisApplicationUserRoles = _userManager.GetRolesAsync(thisApplicationUser).Result;
            _userManager.RemoveFromRolesAsync(thisContributor.ApplicationUser, thisApplicationUserRoles);
            _db.Contributors.Remove(thisContributor);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
