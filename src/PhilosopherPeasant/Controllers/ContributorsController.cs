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
using System.Diagnostics;

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

        //CREATE
        [Authorize(Roles = "Editor in chief")]
        public IActionResult CreateContributor()
        {
            List<ApplicationUser> userList = _userManager.Users.ToList();
            List<ApplicationUser> userListClone = userList.ToList();
            foreach (var user in userListClone)
            {
                if (user.UserName == "admin")
                {
                    userList.Remove(user);
                }
            }

            List<IdentityRole> roleList = _db.Roles.ToList();
            List<IdentityRole> roleListClone = roleList.ToList();
            foreach (var role in roleListClone)
            {
                if (role.Name == "Admin")
                {
                    roleList.Remove(role);
                }
            }
            ViewBag.Users = userList;
            ViewBag.Roles = roleList;
            return View();
        }
        [Authorize(Roles = "Editor in chief")]
        [HttpPost]
        public async Task<IActionResult> CreateContributor (Contributor contributor, string user, string role)
        {
            ApplicationUser thisUser = _userManager.Users.FirstOrDefault(m => m.UserName == user);
            await _userManager.AddToRoleAsync(thisUser, role);
            
            contributor.ApplicationUser = thisUser;
            contributor.StartDate = thisUser.StartDate;
            contributor.Role = role;
            _db.Contributors.Add(contributor);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        //EDIT
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

        //DELETE
        [Authorize(Roles = "Editor in chief")]
        public async Task<IActionResult> DeleteContributor(int id)
        {
            var thisContributor = _db.Contributors
                    .Where(c => c.ContributorId == id)
                    .Include(c => c.ApplicationUser)
                    .FirstOrDefault();


            var thisApplicationUser = thisContributor.ApplicationUser;

            var thisApplicationUserRoles = _userManager.GetRolesAsync(thisApplicationUser).Result;

            await _userManager.RemoveFromRolesAsync(thisApplicationUser, thisApplicationUserRoles);

            _db.Contributors.Remove(thisContributor);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
