using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;

namespace PhilosopherPeasant.Models
{
    // Add profile data for application users by adding properties to the ApplicationUser class
    public class ApplicationUser : IdentityUser
    {
        public DateTime StartDate { get; set; }
        public bool IsContributor { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }

        public ApplicationUser()
        {
            Comments = new HashSet<Comment>();
            StartDate = DateTime.Today;
            IsContributor = false;
        }
    }
}
