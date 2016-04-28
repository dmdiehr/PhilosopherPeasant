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
        private ApplicationDbContext db;
        public ArticlesController(ApplicationDbContext context)
        {
            db = context;
        }
        public IActionResult Index(int id)
        {
          var articles = db.Articles.Where(x => x.WriterId == id).Include(x => x.Writer).ToList();

          if(articles.Count >= 1)
          {
              return View(articles);
          }
          else
          {
              return View();
          }
        }
        public IActionResult Create()
        {
            ViewBag.WriterId = new SelectList(db.Writers, "WriterId", "Name");

            return View();
        }

        [HttpPost]
        public IActionResult Create(Article article)
        {
            db.Articles.Add(article);
            db.SaveChanges();
            return RedirectToAction("Index", "Writers");
        }
        public IActionResult Edit(int id)
        {
            var thisArticle = db.Articles.FirstOrDefault(x => x.ArticleId == id);

            ViewBag.WriterId = new SelectList(db.Writers, "WriterId", "Name");

            return View(thisArticle);
        }

        [HttpPost]
        public IActionResult Edit(Article article)
        {
            db.Entry(article).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "Writers");
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var thisArticle = db.Articles.FirstOrDefault(x => x.ArticleId == id);
            db.Articles.Remove(thisArticle);
            db.SaveChanges();
            return RedirectToAction("Index", "Writers");
        }
    }
}
