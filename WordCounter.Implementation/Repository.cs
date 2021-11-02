using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using WordCounter.Application;
using WordCounter.DataAccess;
using WordCounter.Domain;
using WordCounter.Implementation.Helpers;

namespace WordCounter.Implementation
{
    public class Repository : IRepository
    {
        private readonly WordCounterContext _wordCounterContext;

        public Repository(WordCounterContext wordCounterContext)
        {
            _wordCounterContext = wordCounterContext;
        }

        public async Task<RandomText> GetTextFromDatabaseAsync()
        {
            return await _wordCounterContext.RandomTexts
                .OrderBy(x => Guid.NewGuid())
                .FirstAsync();
        }

        public int GetWordCount(string word)
        {
            if (StringExtensions.IsNullOrWhiteSpace(word))
            {
                return 0;
            }
            var delimiters = new char[] { ' ', '\r', '\n' };
            return word.Split(delimiters, StringSplitOptions.RemoveEmptyEntries).Length;
        }
    }
}
