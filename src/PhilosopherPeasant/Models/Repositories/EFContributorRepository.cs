using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.Entity;

namespace PhilosopherPeasant.Models
{
    public class EFContributorRepository : IContributorRepository
    {
        ApplicationDbContext db = new ApplicationDbContext();
        public EFContributorRepository(ApplicationDbContext connection = null)
        {
            if (connection == null)
            {
                this.db = new ApplicationDbContext();
            }
            else
            {
                this.db = connection;
            }
        }

        public IQueryable<Contributor> Contributors
        { get { return db.Contributors; } }

        public Contributor Save(Contributor contributor)
        {
            db.Contributors.Add(contributor);
            db.SaveChanges();
            return contributor;
        }

        public Contributor Edit(Contributor contributor)
        {
            db.Entry(contributor).State = EntityState.Modified;
            db.SaveChanges();
            return contributor;
        }

        public void Remove(Contributor contributor)
        {
            db.Contributors.Remove(contributor);
            db.SaveChanges();
        }
        public void DeleteAll()
        {
            foreach(Contributor contributor in db.Contributors)
            {
                db.Contributors.Remove(contributor);
            }
            db.SaveChanges();
        }
    }
}