using Microsoft.EntityFrameworkCore;
using WordCounter.DataAccess.Configurations;
using WordCounter.Domain;

namespace WordCounter.DataAccess
{
    public class WordCounterContext: DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new RandomTextConfiguration());
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=DESKTOP-O83J4P3;Initial Catalog=WordCounter;Integrated Security=True");
            base.OnConfiguring(optionsBuilder);
        }

        public virtual DbSet<RandomText> RandomTexts { get; set; }
    }
}
