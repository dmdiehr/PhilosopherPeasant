using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace PhilosopherPeasant.Models
{
    [Table("Tangents")]
    public class Tangent
    {
        [Key]
        public int TangentId { get; set; }
        public string Key { get; set; }
        public string Text { get; set; }
        [ForeignKey("Article")]
        public int ArticleId { get; set; }
        public virtual Article Article { get; set; }
    }
}
