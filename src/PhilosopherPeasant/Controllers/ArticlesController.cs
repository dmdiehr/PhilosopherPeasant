using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using Microsoft.AspNet.Mvc.Rendering;
using PhilosopherPeasant.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Authorization;
using System.Diagnostics;

namespace PhilosopherPeasant.Controllers
{
    [Authorize(Roles = "Editor in chief,Editor,Writer")]
    public class ArticlesController : Controller
    {
        private ApplicationDbContext _db;
        private readonly UserManager<ApplicationUser> _userManager;
        public ArticlesController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _db = context;
            _userManager = userManager;
        }
        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult CreateArticle()
        {
           return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateArticle(Article article)
        {
            ApplicationUser currentUser = await _userManager.FindByNameAsync(User.Identity.Name);
            Contributor thisContributor = _db.Contributors.Where(c => c.ApplicationUserId == currentUser.Id).FirstOrDefault();
            article.Contributor = thisContributor;
            article.SubmitDate = DateTime.Today;
            article.Reviewed = false;
            article.Approved = false;

            _db.Articles.Add(article);
            _db.SaveChanges();
            return RedirectToAction("Portal", "Home");
        }
        public IActionResult EditArticle(int id)
        {
            var thisArticle = _db.Articles.FirstOrDefault(x => x.ArticleId == id);
            return View(thisArticle);
        }

        [HttpPost]
        public IActionResult EditArticle(Article article)
        {
            _db.Entry(article).State = EntityState.Modified;
            _db.SaveChanges();
            return RedirectToAction("Portal", "Home");
        }

        [HttpPost]
        public IActionResult DeleteArticle(int id)
        {
            var thisArticle = _db.Articles.FirstOrDefault(x => x.ArticleId == id);
            _db.Articles.Remove(thisArticle);
            _db.SaveChanges();
            return RedirectToAction("Portal", "Home");
        }
        public IActionResult DisplayArticle(int id)
        {
            var thisArticle = _db.Articles
                .Where(a => a.ArticleId == id)
                .Include(a => a.Contributor)
                .FirstOrDefault();
            return View(thisArticle);
        }


        ////////////////////////////////////
        //public IActionResult WikiLookup()
        //{
        //    var entry = Request.Form["Body"];

        //    var client = new RestClient("https://en.wikipedia.org/w/api.php");

        //    var request = new RestRequest("https://en.wikipedia.org/w/api.php", Method.GET);

        //    request.AddParameter("action", "query");
        //    request.AddParameter("titles", entry);
        //    request.AddParameter("prop", "extracts");
        //    request.AddParameter("format", "json");
        //    request.AddParameter("exchars", 200);

        //    var response = client.Execute(request);

        //    JObject jsonResponse = (JObject)JsonConvert.DeserializeObject(response.Content);

        //    Console.WriteLine(jsonResponse["extract"]);
        //    //var newResponse = jsonResponse["extract"];

        //    //ViewBag.Response = newResponse;


        //    //var result = newWiki.WikiCall(entry);

        //    ViewBag.result = response.Content.ToString();
        //    return View("WikiResult");
        //}
    }
}
