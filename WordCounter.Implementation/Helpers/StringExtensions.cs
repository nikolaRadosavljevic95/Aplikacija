namespace WordCounter.Implementation.Helpers
{
    public static class StringExtensions
    {
        public static bool IsNullOrWhiteSpace(this string value)
        {
            return value == null || value == "null" || value == "undefined" || value == "";
        }
    }
}
