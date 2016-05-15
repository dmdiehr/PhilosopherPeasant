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
using System.Text.RegularExpressions;
using RestSharp;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

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
        [AllowAnonymous]
        public IActionResult DisplayArticle(int id)
        {
            Article thisArticle = _db.Articles
                .Where(a => a.ArticleId == id)
                .Include(a => a.Contributor).FirstOrDefault();
            string pattern = "\\{\\w+\\}\\(\\w+\\)";
            Regex rgx = new Regex(pattern);

            while(true)
            {
                Match match = rgx.Match(thisArticle.Body);
                if(!match.Success)
                {
                    break;
                }
                string matchString = match.Value;
                int matchIndex = match.Index;

                int firstTermLength = matchString.IndexOf('}');
                int secondTermLength = matchString.IndexOf(')') - firstTermLength;

                string firstTerm = matchString.Substring(1, firstTermLength - 1);
                string secondTerm = matchString.Substring(firstTermLength + 2, secondTermLength - 2);

                string secondTermSafe = secondTerm.Replace(" ", "_");

                string replacementHtml = "<span class='clickable' id='" + secondTermSafe + "-button" + matchIndex + "'>" + firstTerm + "</span><div id='" + secondTermSafe + "-output" + matchIndex + "'></div>";

                thisArticle.Body = thisArticle.Body.Remove(matchIndex, matchString.Length);
                thisArticle.Body = thisArticle.Body.Insert(matchIndex, replacementHtml);
            }
            thisArticle.Body = thisArticle.Body.Replace("\n", "</p><p>");
            thisArticle.Body = thisArticle.Body.Replace("<p>\r</p>", "");


            return View(thisArticle);
        }

        [AllowAnonymous]
        public IActionResult Wiki(string entry)
        {

            var client = new RestClient("https://en.wikipedia.org/w/api.php");
            var request = new RestRequest("https://en.wikipedia.org/w/api.php", Method.GET);

            request.AddParameter("action", "query");
            request.AddParameter("titles", entry);
            request.AddParameter("prop", "extracts");
            request.AddParameter("format", "json");
            request.AddParameter("exintro", 1);

            var response = client.Execute(request);

            JObject jsonResponse = (JObject)JsonConvert.DeserializeObject(response.Content);

            string extract = null;
            var jTokenList = jsonResponse.Descendants();
            foreach (var token in jTokenList)
            {
                try
                {
                    extract = token.Value<string>("extract");
                    if (extract != null)
                    {
                        break;
                    }
                }
                catch { }

            }
            if (extract == null)
            {
                ViewBag.result = "Oops, we seem to have misplaced our notes. Read on, this was just filler anyway.";
            }
            else
            {
                ViewBag.result = extract;
            }
            return View();
        }
    }
}
