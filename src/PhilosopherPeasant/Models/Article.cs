using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace PhilosopherPeasant.Models
{
    [Table("Articles")]
    public class Article
    {
        [Key]
        public int ArticleId { get; set; }

        public string Title { get; set; }

        [DataType(DataType.MultilineText)]
        public string Body { get; set; }

        public DateTime PublishDate { get; set; }

        [ForeignKey("Contributor")]
        public int ContributorId { get; set; }
        [NotMapped]
        public Contributor Contributor { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }

    }
}
