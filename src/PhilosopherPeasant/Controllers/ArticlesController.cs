using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using Microsoft.Data.Entity;
using Microsoft.AspNet.Mvc.Rendering;
using PhilosopherPeasant.Models;



namespace PhilosopherPeasant.Controllers
{
    public class ArticlesController : Controller
    {
        private ApplicationDbContext _db;
        public ArticlesController(ApplicationDbContext context)
        {
            _db = context;
        }
        public IActionResult Index(int id)
        {
          var articles = _db.Articles.Where(x => x.ContributorId == id).Include(x => x.Contributor).ToList();

          if(articles.Count >= 1)
          {
              return View(articles);
          }
          else
          {
              return View();
          }
        }
        public IActionResult CreateArticle()
        {
           return View();
        }

        [HttpPost]
        public IActionResult CreateArticle(Article article)
        {
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
    }
}
