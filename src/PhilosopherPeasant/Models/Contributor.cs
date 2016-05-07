using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace PhilosopherPeasant.Models
{
    [Table("Contributors")]
    public class Contributor
    {
        [Key]
        public int ContributorId { get; set; }

        public string Name { get; set; }
        public string ImageLink { get; set; }

        [DataType(DataType.MultilineText)]
        public string Bio { get; set; }

        [DataType(DataType.EmailAddress)]
        public string PublicEmail { get; set; }

        public virtual ICollection<Article> Articles { get; set; }
        public virtual ApplicationUser ApplicationUser {get; set;}

        public Contributor()
        {
            Articles = new HashSet<Article>();
        }
    }
}
