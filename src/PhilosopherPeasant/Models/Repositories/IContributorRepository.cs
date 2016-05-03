using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PhilosopherPeasant.Models
{
    public interface IContributorRepository
    {
        IQueryable<Contributor> Contributors { get; }
        Contributor Save(Contributor contributor);
        Contributor Edit(Contributor contributor);
        void Remove(Contributor contributor);

    }
}
