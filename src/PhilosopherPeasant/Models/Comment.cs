using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PhilosopherPeasant.Models
{
    [Table("Comments")]
    public class Comment
    {
        [Key]
        public int CommentId { get; set; }

        public string Text { get; set; }
        public DateTime PostDateTime { get; set; }
        public virtual ApplicationUser ApplicationUser { get; set; }
        public virtual Article Article { get; set; }
    }
}

