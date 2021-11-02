using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Threading.Tasks;
using WordCounter.Application;
using WordCounter.Application.DataTransfer;

namespace WordCounter.App.Controllers
{
    [Route("api/word-count")]
    [ApiController]
    public class WordCounterController : ControllerBase
    {
        private readonly IRepository _repository;

        public WordCounterController(IRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        [HttpGet(Name = "GetWordCount")]
        public IActionResult GetWordCount([FromQuery] string word)
        {
            var wordCount = _repository.GetWordCount(word);

            return Ok(wordCount);
        }

        [HttpGet("from-database", Name = "GetWordCountFromDatabase")]
        public async Task<IActionResult> GetWordCountFromDatabase()
        {
            var randomTextObj = await _repository.GetTextFromDatabaseAsync();

            if (randomTextObj is null)
            {
                throw new Exception($"Greska prilikom dohvatanja teksta iz baze");
            }

            var wordCount = _repository.GetWordCount(randomTextObj.Text);

            TextDto textDto = new()
            {
                Text = randomTextObj.Text,
                WordCount = wordCount
            };

            return Ok(textDto);
        }

        [HttpPost("from-file", Name = "GetWordCountFromFile")]
        public async Task<IActionResult> GetWordCountFromFile([FromForm] IFormFile file)
        {
            string text;
            using (var stream = file.OpenReadStream())
            using (var reader = new StreamReader(stream))
            {
                text = await reader.ReadToEndAsync();
            }

            var wordCount = _repository.GetWordCount(text);

            TextDto textDto = new()
            {
                Text = text,
                WordCount = wordCount
            };

            return Ok(textDto);
        }
    }
}
