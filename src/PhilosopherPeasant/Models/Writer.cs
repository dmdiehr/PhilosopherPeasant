﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace PhilosopherPeasant.Models
{
    [Table("Writers")]
    public class Writer
    {
        [Key]
        public int WriterId { get; set; }

        public string Name { get; set; }
        public string ImageLink { get; set; }

        [DataType(DataType.MultilineText)]
        public string Bio { get; set; }

        [DataType(DataType.EmailAddress)]
        public string PublicEmail { get; set; }

        public virtual ICollection<Article> Articles { get; set; }

        [ForeignKey("ApplicationUser")]
        public int ApplicationUserId { get; set; }
        [NotMapped]
        public virtual ApplicationUser ApplicationUser {get; set;}

        public Writer()
        {
            Articles = new HashSet<Article>();
        }
    }
}
