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
                if (user.UserName == "admin" || user.IsContributor)
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
            if(contributor.ImageLink == null)
            {
                contributor.ImageLink = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g";
            }
            contributor.ApplicationUser = thisUser;
            contributor.StartDate = thisUser.StartDate;
            contributor.Role = role;
            thisUser.IsContributor = true;
            _db.Contributors.Add(contributor);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        //EDIT
        [Authorize(Roles = "Editor in chief")]
        public IActionResult EditContributor(int id)
        {
            var contributor = _db.Contributors.FirstOrDefault(c => c.ContributorId == id);
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
            return View(contributor);
        }

        [Authorize(Roles = "Editor in chief")]
        [HttpPost]
        public async Task<IActionResult> EditContributor(Contributor contributor, string user, string role)
        {
            //First Clear Roles from old user
            ApplicationUser oldUser = await _userManager.FindByIdAsync(contributor.ApplicationUserId);
            var oldUserRoles = _userManager.GetRolesAsync(oldUser).Result;
            await _userManager.RemoveFromRolesAsync(oldUser, oldUserRoles);
            //Reset Roles for new user
            ApplicationUser newUser = _userManager.Users.FirstOrDefault(m => m.UserName == user);
            var newUserOldRoles = _userManager.GetRolesAsync(newUser).Result;
            //Attach new user and new user roles to contributor object
            contributor.ApplicationUser = newUser;
            await _userManager.AddToRoleAsync(newUser, role);
            _db.Entry(contributor).State = EntityState.Modified;
            _db.SaveChanges();
            return RedirectToAction("Index");
        }


        [Authorize(Roles = "Editor in chief,Editor,Writer")]
        public async Task<IActionResult> EditProfile()
        {
            ApplicationUser currentUser = await _userManager.FindByNameAsync(User.Identity.Name);
            Contributor thisContributor = _db.Contributors.Where(c => c.ApplicationUserId == currentUser.Id).FirstOrDefault();
            return View(thisContributor);
        }
        [Authorize(Roles = "Editor in chief,Editor,Writer")]
        [HttpPost]
        public IActionResult EditProfile(Contributor contributor)
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
