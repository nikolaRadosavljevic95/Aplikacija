using System.Threading.Tasks;
using WordCounter.Domain;

namespace WordCounter.Application
{
    public interface IRepository
    {
        Task<RandomText> GetTextFromDatabaseAsync();
        int GetWordCount(string word);
    }
}
