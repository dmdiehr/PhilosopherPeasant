using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.Entity;


namespace PhilosopherPeasant.Models
{

    public class TestDbContext : ApplicationDbContext
    {
        public override DbSet<Contributor> Contributors { get; set; }
        public override DbSet<Article> Articles { get; set; }
        public override DbSet<Comment> Comments { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=PhilosopherPeasantTest;integrated security = True");
        }
    }

}