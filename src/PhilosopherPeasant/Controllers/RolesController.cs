﻿using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet.Authorization;
using Microsoft.AspNet.Http.Internal;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Mvc;
using Microsoft.AspNet.Mvc.Rendering;
using PhilosopherPeasant.Models;

namespace PhilosopherPeasant.Controllers
{
    [Authorize(Roles = "Admin,Editor in chief")]
    public class RolesController : Controller
    {
        private readonly ApplicationDbContext _db;
        private readonly UserManager<ApplicationUser> _userManager;

        public RolesController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
            _db = context;
        }

        public IActionResult Index()
        {
            List<IdentityRole> roleList = _db.Roles.ToList();
            List<IdentityRole> cloneRoleList = roleList.ToList();
            foreach(var role in cloneRoleList)
            {
                if (role.Name == "Admin")
                {
                    roleList.Remove(role);
                }
            }

            return View("Index", roleList);
        }

        [Authorize(Roles = "Admin")]
        public IActionResult CreateRole()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateRole(FormCollection collection)
        {
            _db.Roles.Add(new IdentityRole(Request.Form["RoleName"]));
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult DeleteRole(string roleName)
        {
            var role = _db.Roles.FirstOrDefault(m => m.Name == roleName);
            if (role != null)
            {
                try
                {
                    _db.Roles.Remove(role);
                    _db.SaveChanges();
                }
                catch
                {
                    ViewData["message"] = "Users still in role " + roleName;
                    return Index();
                }
            }
            return RedirectToAction("Index");
        }

        public IActionResult Assign()
        {
            List<ApplicationUser> userList = _userManager.Users.ToList();
            List<ApplicationUser> userListClone = userList.ToList();
            foreach(var user in userListClone)
            {
                if (user.UserName == "admin")
                {
                    userList.Remove(user);
                }
            }
            ViewBag.Users = new SelectList(userList);
            return View("AssignRole");
        }

        public IActionResult AssignRole(string username, string roleName)
        {
            var user = GetUser(username);
            var thing = _userManager.AddToRoleAsync(user, roleName).Result;
            return GetRoles(username);
        }

        [HttpPost]
        public IActionResult RemoveRole(string username, string roleName)
        {
            var thing = _userManager.RemoveFromRoleAsync(GetUser(username), roleName).Result;
            return GetRoles(username);
        }


        [HttpGet]
        public IActionResult EditRole(string roleName)
        {
            ViewData["roleName"] = roleName;
            return View("EditRoleName");
        }

        [HttpPost]
        public IActionResult EditRole()
        {
            var role = _db.Roles.FirstOrDefault(m => m.Name == Request.Form["role-name"]);
            role.Name = Request.Form["edit-role"];
            _db.Roles.Update(role);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        //////////////////////////////Helper Methods//////////////////////

        public ApplicationUser GetUser(string username)
        {
            return _userManager.Users.FirstOrDefault(m => m.UserName == username);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult GetRoles(string user)
        {
            var usera = GetUser(user);
            ViewBag.User = usera;
            var userRoles = _userManager.GetRolesAsync(usera).Result;
            ViewBag.RolesForThisUser = userRoles;
            var preroles = _db.Roles.ToList();
            var roles = new List<string>();
            foreach (var r in preroles)
            {
                var add = true;
                foreach (var userRole in userRoles)
                {
                    if (userRole == r.Name)
                    {
                        add = false;
                    }
                }
                if (add && r.Name!="Admin")
                {
                    roles.Add(r.Name);
                }
            }
            ViewBag.Users = new SelectList(_userManager.Users.ToList());
            ViewBag.Roles = roles;
            return View("AssignRole");
        }
    }
}