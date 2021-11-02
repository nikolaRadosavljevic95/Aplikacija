using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WordCounter.Domain;

namespace WordCounter.DataAccess.Configurations
{
    public class RandomTextConfiguration : IEntityTypeConfiguration<RandomText>
    {
        public void Configure(EntityTypeBuilder<RandomText> builder)
        {
            builder.Property(x => x.Text)
                .IsRequired()
                .HasMaxLength(500);
        }
    }
}
