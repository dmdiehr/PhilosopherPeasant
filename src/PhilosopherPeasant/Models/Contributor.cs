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
        public virtual string Role { get; set; }
        public virtual DateTime StartDate { get; set; }

        public Contributor()
        {
            Articles = new HashSet<Article>();
            ImageLink = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g";
        }
    }
}
