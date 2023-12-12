import 'extract_platform_interface.dart';

class Extract {
  Future<String?> getPlatformVersion() {
    return ExtractPlatform.instance.getPlatformVersion();
  }

  /// Extracts phone numbers from the provided [text].
  ///
  /// This function uses a regular expression to identify and extract phone numbers
  /// from the input [text].
  ///
  /// Example:
  /// ```dart
  /// String text = 'Contact us at +1234567890 for assistance.';
  /// List<String> extractedPhoneNumbers = Extract.phoneNumbers(text);
  /// ```
  ///
  /// The [text] parameter represents the text in which phone numbers are to be identified
  /// and extracted.
  ///
  /// Returns a [List<String>] containing the identified phone numbers extracted from the input [text].
  ///
  /// Note:
  /// - The regular expression pattern used captures phone numbers consisting of digits and hyphens,
  ///   allowing variations in phone number formats.
  /// - It may capture phone numbers that include country codes (e.g., '+1' for the United States)
  ///   followed by the number digits and optional spaces or hyphens.
  ///
  /// Considerations:
  /// - Validate the extracted phone numbers based on specific formatting or country code requirements.
  /// - This method doesn't verify the existence or correctness of the identified phone numbers; it solely extracts patterns matching the defined regular expression.
  static List<String> phoneNumbers(String text) {
    RegExp phoneRegex = RegExp(r'(\+?\d{1,2}\s?)?[\d-]{8,}');
    Iterable<Match> matches = phoneRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts URLs from the provided [text].
  ///
  /// This function uses a regular expression to identify and extract URLs
  /// from the input [text].
  ///
  /// Example:
  /// ```dart
  /// String text = 'Check out https://example.com for more information.';
  /// List<String> extractedURLs = Extract.urls(text);
  /// ```
  ///
  /// The [text] parameter represents the text in which URLs are to be identified
  /// and extracted.
  ///
  /// Returns a [List<String>] containing the identified URLs extracted from the input [text].
  ///
  /// Note:
  /// - This method uses a regular expression pattern to capture URLs adhering to common formats
  ///   (e.g., 'http://', 'https://').
  /// - It might not cover all URL patterns and specialized cases.
  ///
  /// Considerations:
  /// - Validate the URL extraction based on specific use cases if specialized URL formats are involved.
  /// - The method doesn't perform validation for the existence or accessibility of the URLs.
  static List<String> urls(String text) {
    RegExp urlRegex = RegExp(r'https?://(?:[-\w.]|(?:%[\da-fA-F]{2}))+');
    Iterable<Match> matches = urlRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts dates in various formats from the provided [text].
  ///
  /// This function identifies and extracts dates in different formats, such as:
  /// - DD/MM/YYYY or DD-MM-YYYY
  /// - MM/DD/YYYY or MM-DD-YYYY
  /// - Day Mon YYYY or Mon Day, YYYY
  /// - YYYY-MM-DD or YYYY/MM/DD
  /// - DD Mon YY or Mon DD, YY
  /// - DD.MM.YYYY
  /// - DD Mon YYYY
  /// - Mon DD, YYYY
  /// - Mon DD, YY
  /// - DD-Mon-YY or DD Mon YY
  /// - DD Mon YYYY
  /// - Mon DD YYYY
  /// - Mon-DD-YYYY
  ///
  /// The [text] parameter represents the text from which dates are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing the identified dates in various formats extracted from the input [text].
  ///
  /// Note:
  /// - The function uses a predefined list of regular expressions for various date formats.
  /// - It collects dates matching the defined patterns, potentially capturing a wide range of date representations.
  ///
  /// Considerations:
  /// - Validate the extracted dates based on specific formatting or context requirements.
  /// - This method doesn't verify the correctness of the identified dates; it solely extracts patterns matching the defined regular expressions.
  static List<String> allDates(String text) {
    List<String> dateFormats = [
      r'\b\d{1,2}/\d{1,2}/\d{2,4}\b',
      // 12/31/2023
      r'\b\d{1,2}-\d{1,2}-\d{2,4}\b',
      // 12-31-2023
      r'\b\d{1,2}\s(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{2,4}\b',
      // 31 Dec 2023
      r'\b(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{1,2},?\s\d{2,4}\b',
      // Dec 31, 2023
      r'\b\d{4}[-/]\d{1,2}[-/]\d{1,2}\b',
      // 2023-12-31 or 2023/12/31
      r'\b\d{1,2}\s(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{4}\b',
      // 31 Dec 2023
      r'\b(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{1,2},?\s\d{4}\b',
      // Dec 31, 2023
      r'\b\d{1,2}/\d{1,2}/\d{2}\b',
      // 12/31/23
      r'\b\d{1,2}-\d{1,2}-\d{2}\b',
      // 12-31-23
      r'\b\d{1,2}\s(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{2}\b',
      // 31 Dec 23
      r'\b(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{1,2},?\s\d{2}\b',
      // Dec 31, 23
      r'\b\d{4}[-/]\d{1,2}[-/]\d{2}\b',
      // 2023-12-31 or 2023/12/31
      r'\b\d{1,2}\.\d{1,2}\.\d{2,4}\b',
      // 12.31.2023
      r'\b\d{1,2}\s(?:January|February|March|April|May|June|July|August|September|October|November|December)\s\d{2,4}\b',
      // 31 December 2023
      r'\b(?:January|February|March|April|May|June|July|August|September|October|November|December)\s\d{1,2},?\s\d{2,4}\b',
      // December 31, 2023
      r'\b\d{1,2}\s(?:January|February|March|April|May|June|July|August|September|October|November|December)\s\d{4}\b',
      // 31 December 2023
      r'\b(?:January|February|March|April|May|June|July|August|September|October|November|December)\s\d{1,2},?\s\d{4}\b',
      // December 31, 2023
      r'\b\d{1,2}-\w{3}-\d{2}\b',
      // 31-Dec-23
      r'\b\d{1,2}\s\w{3}\s\d{2,4}\b',
      // 31 Dec 2023
      r'\b\w{3}\s\d{1,2},?\s\d{2,4}\b',
      // Dec 31, 2023
      r'\b\d{1,2}-\w{3}-\d{4}\b',
      // 31-Dec-2023
    ];

    List<String> extractedDates = [];

    for (String format in dateFormats) {
      RegExp dateRegex = RegExp(format);
      Iterable<Match> matches = dateRegex.allMatches(text);
      extractedDates.addAll(matches.map((match) => match.group(0)!).toList());
    }

    return extractedDates;
  }

  /// Extracts occurrences of a specific [word] from the provided [text].
  ///
  /// This function identifies and extracts occurrences of the specified [word] in the input [text].
  ///
  /// The [text] parameter represents the text in which occurrences of [word] are to be identified and extracted.
  /// The [word] parameter represents the specific word to search for in the input [text].
  ///
  /// Returns a [List<String>] containing instances of the specified [word] extracted from the input [text].
  ///
  /// Note:
  /// - The function uses a regular expression pattern to identify the [word] in the [text].
  /// - It collects instances where the [word] appears as a standalone word, ignoring case sensitivity.
  static List<String> specificWords(String text, String word) {
    RegExp wordRegex = RegExp(r'\b' + word + r'\b', caseSensitive: false);
    Iterable<Match> matches = wordRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts addresses from the provided [text].
  ///
  /// This function identifies and extracts addresses from the input [text].
  /// Addresses are expected to follow the format: [Street Address, City, State ZIPCode].
  ///
  /// The [text] parameter represents the text in which addresses are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified addresses extracted from the input [text].
  ///
  /// Note:
  /// - The function uses a regular expression pattern to capture address structures adhering to a predefined format.
  /// - It aims to extract addresses following a specific pattern and might not cover all possible address variations.
  static List<String> addresses(String text) {
    RegExp addressRegex = RegExp(
        r'\d{1,5}\s\w+\s\w+,\s?\w+,\s\w+\s\d{5}|\d{1,5}\s\w+\s\w+\s\w+,\s\w+,\s\w+\s\d{5}');
    Iterable<Match> matches = addressRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts numeric values from the provided [text].
  ///
  /// This function identifies and extracts numeric values from the input [text].
  ///
  /// The [text] parameter represents the text in which numeric values are to be identified and extracted.
  /// The optional parameter [includeDecimals] indicates whether to include decimal numbers.
  ///
  /// If [includeDecimals] is set to `true`, the function captures both integers and decimal numbers.
  /// If set to `false` (default), the function captures only integers.
  ///
  /// Returns a [List<String>] containing identified numeric values extracted from the input [text].
  ///
  /// Note:
  /// - When [includeDecimals] is `true`, the function captures numbers with or without decimal points.
  /// - When [includeDecimals] is `false`, the function captures only whole numbers (integers).
  /// - The function utilizes regular expressions to extract numeric patterns from the text.
  static List<String> numericValues(String text,
      {bool includeDecimals = false}) {
    RegExp numericRegex =
        includeDecimals ? RegExp(r'\b\d+(\.\d+)?\b') : RegExp(r'\b\d+\b');
    Iterable<Match> matches = numericRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts hashtags and, optionally, mentions from the provided [text].
  ///
  /// This function identifies and extracts hashtags and, if specified, mentions from the input [text].
  ///
  /// The [text] parameter represents the text in which hashtags and/or mentions are to be identified and extracted.
  /// The optional parameter [includeMentions] determines whether mentions (starting with '@') should be included.
  ///
  /// If [includeMentions] is set to `true` (default), the function captures both hashtags (starting with '#')
  /// and mentions.
  /// If set to `false`, the function captures only hashtags.
  ///
  /// Returns a [List<String>] containing identified hashtags and, optionally, mentions extracted from the input [text].
  ///
  /// Note:
  /// - When [includeMentions] is `true`, the function captures both hashtags and mentions.
  /// - When [includeMentions] is `false`, the function captures only hashtags.
  /// - The function uses regular expressions to extract hashtags and mentions based on predefined patterns.
  static List<String> hashtagsMentions(String text,
      {bool includeMentions = true}) {
    RegExp tagRegex =
        includeMentions ? RegExp(r'#[^\s#]+|\B@\w+') : RegExp(r'#[^\s#]+');
    Iterable<Match> matches = tagRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts file paths from the provided [text].
  ///
  /// This function identifies and extracts file paths from the input [text].
  ///
  /// The [text] parameter represents the text in which file paths are to be identified and extracted.
  /// The optional parameter [separator] specifies the path separator character.
  ///
  /// The default [separator] value is '/' (forward slash), commonly used in Unix-based systems.
  ///
  /// Returns a [List<String>] containing identified file paths extracted from the input [text].
  ///
  /// Note:
  /// - The function uses a regular expression pattern to capture file path structures based on the provided [separator].
  /// - It aims to extract file paths that conform to the defined structure and separator.
  static List<String> filePaths(String text, {String separator = '/'}) {
    RegExp filePathRegex = RegExp('(?:$separator[\\w-]+)+$separator?');
    Iterable<Match> matches = filePathRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts special characters from the provided [text].
  ///
  /// This function identifies and extracts special characters from the input [text].
  ///
  /// The [text] parameter represents the text in which special characters are to be identified and extracted.
  /// The optional parameter [characterSet] specifies the set of characters to extract.
  ///
  /// The default [characterSet] is '[^\w\s]', capturing any character that's not alphanumeric or whitespace.
  ///
  /// Returns a [List<String>] containing identified special characters extracted from the input [text].
  ///
  /// Note:
  /// - The function utilizes a regular expression pattern to capture characters based on the provided [characterSet].
  /// - It collects characters that match the specified set.
  static List<String> specialCharacters(String text,
      {String characterSet = r'[^\w\s]'}) {
    RegExp specialCharRegex = RegExp(characterSet);
    Iterable<Match> matches = specialCharRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts occurrences of a specific [keyword] or phrase from the provided [text].
  ///
  /// This function identifies and extracts occurrences of the specified [keyword] or phrase in the input [text].
  ///
  /// The [text] parameter represents the text in which occurrences of [keyword] or phrase are to be identified and extracted.
  /// The [keyword] parameter represents the specific word or phrase to search for in the input [text].
  /// The optional parameter [caseSensitive] determines whether the search is case-sensitive.
  ///
  /// If [caseSensitive] is set to `true`, the function matches the [keyword] or phrase exactly.
  /// If set to `false` (default), the function captures occurrences regardless of case.
  ///
  /// Returns a [List<String>] containing instances of the specified [keyword] or phrase extracted from the input [text].
  ///
  /// Note:
  /// - The function uses a regular expression pattern to identify the [keyword] or phrase in the [text].
  /// - It collects instances where the [keyword] or phrase appears as a standalone word, considering case sensitivity if specified.
  static List<String> keywordsPhrases(String text, String keyword,
      {bool caseSensitive = false}) {
    RegExp keywordRegex =
        RegExp(r'\b' + keyword + r'\b', caseSensitive: caseSensitive);
    Iterable<Match> matches = keywordRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Separates text into sentences or paragraphs based on the provided [separator].
  ///
  /// This function segments the input [text] into sentences or paragraphs using the specified [separator].
  ///
  /// The [text] parameter represents the text to be segmented into sentences or paragraphs.
  /// The optional parameter [separator] determines the character that signifies the end of a sentence or paragraph.
  ///
  /// By default, [separator] is set to '.' (period) for sentence segmentation.
  ///
  /// Returns a [List<String>] containing individual sentences or paragraphs extracted from the input [text].
  ///
  /// Note:
  /// - The function utilizes a regular expression to split the text based on the provided [separator].
  /// - It separates the text into sentences or paragraphs based on the occurrence of the [separator] character.
  static List<String> sentencesParagraphs(String text,
      {String separator = '.'}) {
    RegExp sentenceRegex = RegExp('.+?(?=$separator)');
    Iterable<Match> matches = sentenceRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts acronyms and abbreviations from the provided [text].
  ///
  /// This function identifies and extracts acronyms and abbreviations from the input [text].
  ///
  /// The [text] parameter represents the text in which acronyms and abbreviations are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified acronyms and abbreviations extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings of capital letters (2 or more) as potential acronyms or abbreviations.
  /// - It identifies strings where all characters are uppercase letters as potential acronyms or abbreviations.
  static List<String> acronymsAbbreviations(String text) {
    RegExp acronymRegex = RegExp(r'\b[A-Z]{2,}\b');
    Iterable<Match> matches = acronymRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts Social Security Numbers (SSNs) from the provided [text].
  ///
  /// This function identifies and extracts Social Security Numbers (SSNs) from the input [text].
  ///
  /// The [text] parameter represents the text in which SSNs are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified Social Security Numbers (SSNs) extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings matching the format: 123-45-6789 as potential SSNs.
  static List<String> ssns(String text) {
    RegExp ssnRegex = RegExp(r'\b\d{3}-\d{2}-\d{4}\b');
    Iterable<Match> matches = ssnRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts IP addresses from the provided [text].
  ///
  /// This function identifies and extracts IP addresses from the input [text].
  ///
  /// The [text] parameter represents the text in which IP addresses are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified IP addresses extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings matching the format: 192.168.1.1 as potential IP addresses.
  static List<String> iPAddresses(String text) {
    RegExp ipRegex = RegExp(r'\b(?:\d{1,3}\.){3}\d{1,3}\b');
    Iterable<Match> matches = ipRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts potential credit card numbers from the provided [text].
  ///
  /// This function identifies and extracts potential credit card numbers from the input [text].
  ///
  /// The [text] parameter represents the text in which credit card numbers are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing potential credit card numbers extracted from the input [text].
  ///
  /// Note:
  /// - The function captures sequences of digits possibly separated by spaces or hyphens, ranging from 13 to 16 digits.
  static List<String> creditCardNumbers(String text) {
    RegExp creditCardRegex = RegExp(r'\b(?:\d[ -]*?){13,16}\b');
    Iterable<Match> matches = creditCardRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts code snippets from the provided [text] optionally filtered by [language].
  ///
  /// This function identifies and extracts code snippets from the input [text].
  /// Optionally, specifying a [language] parameter filters snippets written in a particular programming language.
  ///
  /// The [text] parameter represents the text containing code snippets to be extracted.
  /// The optional [language] parameter filters code snippets in the specified programming language.
  ///
  /// Returns a [List<String>] containing identified code snippets from the input [text].
  ///
  /// Note:
  /// - The function utilizes triple backticks (`) as delimiters for code blocks.
  /// - Optionally specifying the [language] parameter filters code snippets written in a specific programming language.
  static List<String> codeSnippets(String text, {String language = ''}) {
    RegExp codeRegex = RegExp(r'```(?:$language\n)?([\s\S]+?)```');
    Iterable<Match> matches = codeRegex.allMatches(text);
    return matches.map((match) => match.group(1)!).toList();
  }

  /// Extracts units of measurement from the provided [text].
  ///
  /// This function identifies and extracts units of measurement from the input [text].
  ///
  /// The [text] parameter represents the text containing units of measurement to be extracted.
  ///
  /// Returns a [List<String>] containing identified units of measurement extracted from the input [text].
  ///
  /// Note:
  /// - The function captures sequences of digits followed by a space and alphanumeric characters representing units.
  static List<String> unitsOfMeasurement(String text) {
    RegExp unitRegex = RegExp(r'\b\d+\s?\w+\b');
    Iterable<Match> matches = unitRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts product codes or IDs from the provided [text].
  ///
  /// This function identifies and extracts product codes or IDs from the input [text].
  ///
  /// The [text] parameter represents the text containing product codes or IDs to be extracted.
  ///
  /// Returns a [List<String>] containing identified product codes or IDs extracted from the input [text].
  ///
  /// Note:
  /// - The function captures alphanumeric strings of 6 or more characters typically used as product codes or IDs.
  static List<String> productCodesIDs(String text) {
    RegExp productCodeRegex = RegExp(r'\b[A-Z0-9]{6,}\b');
    Iterable<Match> matches = productCodeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts sentiment-related keywords from the provided [text].
  ///
  /// This function identifies and extracts keywords related to sentiment (e.g., good, bad, excellent, poor, great) from the input [text].
  ///
  /// The [text] parameter represents the text in which sentiment keywords are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing sentiment-related keywords extracted from the input [text].
  ///
  /// Note:
  /// - The function is case insensitive while capturing sentiment-related keywords.
  static List<String> sentimentKeywords(String text) {
    RegExp sentimentRegex =
        RegExp(r'\b(?:good|bad|excellent|poor|great)\b', caseSensitive: false);
    Iterable<Match> matches = sentimentRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts time patterns from the provided [text].
  ///
  /// This function identifies and extracts time patterns in 24-hour format (HH:MM) or with optional seconds (HH:MM:SS) from the input [text].
  ///
  /// The [text] parameter represents the text in which time patterns are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing time patterns extracted from the input [text].
  ///
  /// Note:
  /// - The function captures time patterns adhering to the 24-hour clock format.
  static List<String> time(String text) {
    RegExp timeRegex =
        RegExp(r'\b(?:[01]\d|2[0-3]):(?:[0-5]\d)(?::(?:[0-5]\d))?\b');
    Iterable<Match> matches = timeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts potential company names from the provided [text].
  ///
  /// This function identifies and extracts potential company names from the input [text].
  ///
  /// The [text] parameter represents the text in which company names are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing potential company names extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings that represent potential company name formats.
  static List<String> companyNames(String text) {
    RegExp companyRegex = RegExp(r'\b[A-Z][a-z]+(?:\s[A-Z][a-z]+)*\b');
    Iterable<Match> matches = companyRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts potential job titles from the provided [text].
  ///
  /// This function identifies and extracts potential job titles from the input [text].
  ///
  /// The [text] parameter represents the text in which job titles are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing potential job titles extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings that represent potential job title formats.
  static List<String> jobTitles(String text) {
    RegExp jobTitleRegex = RegExp(r'\b(?:[A-Z][a-z]*\s?)+\b');
    Iterable<Match> matches = jobTitleRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts Vehicle Identification Numbers (VINs) from the provided [text].
  ///
  /// This function identifies and extracts VINs, which are alphanumeric strings of 17 characters, from the input [text].
  ///
  /// The [text] parameter represents the text in which VINs are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified VINs extracted from the input [text].
  ///
  /// Note:
  /// - The function captures alphanumeric strings of 17 characters, adhering to the VIN format.
  static List<String> vins(String text) {
    RegExp vinRegex = RegExp(r'\b[A-HJ-NPR-Z0-9]{17}\b');
    Iterable<Match> matches = vinRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts Twitter handles from the provided [text].
  ///
  /// This function identifies and extracts Twitter handles (e.g., @username) from the input [text].
  ///
  /// The [text] parameter represents the text in which Twitter handles are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified Twitter handles extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings starting with '@' followed by letters, numbers, or underscores.

  static List<String> twitterHandles(String text) {
    RegExp twitterRegex = RegExp(r'@[A-Za-z0-9_]+');
    Iterable<Match> matches = twitterRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts YouTube video IDs from the provided [text].
  ///
  /// This function identifies and extracts YouTube video IDs from the input [text].
  ///
  /// The [text] parameter represents the text in which YouTube video IDs are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified YouTube video IDs extracted from the input [text].
  ///
  /// Note:
  /// - The function captures 11-character alphanumeric strings typically found in YouTube URLs.

  static List<String> youTubeVideoIDs(String text) {
    RegExp youtubeRegex =
        RegExp(r'(?<=youtu\.be\/|watch\?v=)[A-Za-z0-9_-]{11}');
    Iterable<Match> matches = youtubeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts ISBNs (International Standard Book Numbers) from the provided [text].
  ///
  /// This function identifies and extracts ISBNs from the input [text].
  ///
  /// The [text] parameter represents the text in which ISBNs are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified ISBNs extracted from the input [text].
  ///
  /// Note:
  /// - The function captures ISBNs with different formats, including ISBN-10 and ISBN-13.

  static List<String> isbns(String text) {
    RegExp isbnRegex = RegExp(
        r'\b(?:ISBN(?:-1[03])?:?\s*)?(?=[-0-9X ]{10,17}$|97[89][-0-9X ]{10}$|(?=(?:[-0-9X ]+){13}$|(?=(?:[-0-9X ]+){17}$) 97[89][-0-9X ]{13})[-0-9X]{1,5}[- ](?:[0-9]+[- ]){2}[0-9X]\b)');
    Iterable<Match> matches = isbnRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts HTML tags and their attributes from the provided [text].
  ///
  /// This function identifies and extracts HTML tags and their attributes from the input [text].
  ///
  /// The [text] parameter represents the text in which HTML tags and attributes are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified HTML tags and their attributes extracted from the input [text].
  ///
  /// Note:
  /// - The function captures HTML tags and their associated attributes.

  static List<String> htmlTagsAttributes(String text) {
    RegExp htmlRegex = RegExp(r'<([a-z][a-z0-9]*)\b[^>]*>(.*?)<\/\1>');
    Iterable<Match> matches = htmlRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts hexadecimal color codes from the provided [text].
  ///
  /// This function identifies and extracts hexadecimal color codes from the input [text].
  ///
  /// The [text] parameter represents the text in which hexadecimal color codes are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified hexadecimal color codes extracted from the input [text].
  ///
  /// Note:
  /// - The function captures 6-character hexadecimal strings typically representing colors (e.g., #RRGGBB).

  static List<String> hexColorCodes(String text) {
    RegExp hexColorRegex = RegExp(r'#[0-9a-fA-F]{6}\b');
    Iterable<Match> matches = hexColorRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts statistical terms (e.g., mean, median, mode, range) from the provided [text].
  ///
  /// This function identifies and extracts statistical terms from the input [text].
  ///
  /// The [text] parameter represents the text in which statistical terms are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified statistical terms extracted from the input [text].
  ///
  /// Note:
  /// - The function captures statistical terms like mean, median, mode, and range.
  static List<String> statisticalData(String text) {
    RegExp statisticsRegex = RegExp(r'\b(mean|median|mode|range)\b');
    Iterable<Match> matches = statisticsRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts Twitter or Facebook post IDs based on the provided [text] and [platform].
  ///
  /// This function identifies and extracts post IDs from either Twitter or Facebook URLs,
  /// based on the specified [platform].
  ///
  /// The [text] parameter represents the text in which post IDs are to be identified and extracted.
  /// The [platform] parameter specifies the social media platform ('Twitter' or 'Facebook').
  ///
  /// Returns a [List<String>] containing identified post IDs extracted from the input [text].
  ///
  /// Note:
  /// - For Twitter, the function captures numeric IDs following 'twitter.com/username/status/' in URLs.
  /// - For Facebook, the function captures numeric IDs following 'facebook.com/username/posts/' in URLs.

  static List<String> twiiterAndFacebookPostIDs(String text, String platform) {
    String regexPattern = platform == 'Twitter'
        ? r'(?<=twitter\.com\/\w+\/status\/)\d+'
        : r'(?<=facebook\.com\/\w+\/posts\/)\d+';
    RegExp socialMediaRegex = RegExp(regexPattern);
    Iterable<Match> matches = socialMediaRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts employee IDs from the provided [text].
  ///
  /// This function identifies and extracts employee IDs from the input [text].
  ///
  /// The [text] parameter represents the text in which employee IDs are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified employee IDs extracted from the input [text].
  ///
  /// Note:
  /// - The function captures alphanumeric strings with a minimum length of 5 characters.

  static List<String> employeeIDs(String text) {
    RegExp employeeIDRegex = RegExp(r'\b[A-Za-z0-9]{5,}\b');
    Iterable<Match> matches = employeeIDRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts bank account numbers from the provided [text].
  ///
  /// This function identifies and extracts bank account numbers from the input [text].
  ///
  /// The [text] parameter represents the text in which bank account numbers are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified bank account numbers extracted from the input [text].
  ///
  /// Note:
  /// - The function captures numeric strings with a length ranging from 9 to 12 digits.

  static List<String> bankAccountNumbers(String text) {
    RegExp bankAccountRegex = RegExp(r'\b\d{9,12}\b');
    Iterable<Match> matches = bankAccountRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts API endpoints from the provided [text].
  ///
  /// This function identifies and extracts API endpoints from the input [text].
  ///
  /// The [text] parameter represents the text in which API endpoints are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified API endpoints extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings representing API endpoint paths.

  static List<String> apiEndpoints(String text) {
    RegExp apiEndpointRegex = RegExp(r'\/[a-zA-Z0-9\/\-\_]+');
    Iterable<Match> matches = apiEndpointRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts OS file paths from the provided [text].
  ///
  /// This function identifies and extracts OS file paths from the input [text].
  ///
  /// The [text] parameter represents the text in which OS file paths are to be identified and extracted.
  ///
  /// Returns a [List<String>] containing identified OS file paths extracted from the input [text].
  ///
  /// Note:
  /// - The function captures strings representing file paths specific to the operating system.
  static List<String> osPaths(String text) {
    RegExp osPathRegex = RegExp(r'([A-Za-z]):(\\[A-Za-z0-9_\-\.]+)+');
    Iterable<Match> matches = osPathRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts Twitter or Facebook post IDs from the provided [text] based on the [platform].
  ///
  /// This function extracts post IDs from Twitter or Facebook URLs
  /// depending on the specified [platform] ('Twitter' or 'Facebook') in the [text].
  ///
  /// The [text] parameter represents the text containing URLs of Twitter or Facebook posts.
  /// The [platform] parameter specifies the social media platform ('Twitter' or 'Facebook').
  ///
  /// Returns a [List<String>] containing post IDs extracted from the input [text].
  ///
  /// Note:
  /// - For Twitter, the function captures numeric IDs following 'twitter.com/username/status/' in URLs.
  /// - For Facebook, the function captures numeric IDs following 'facebook.com/username/posts/' in URLs.

  static List<String> twitterAndFacebookPostContent(
      String text, String platform) {
    String regexPattern = platform == 'Twitter'
        ? r'(?<=twitter\.com\/\w+\/status\/)\d+'
        : r'(?<=facebook\.com\/\w+\/posts\/)\d+';
    RegExp socialMediaRegex = RegExp(regexPattern);
    Iterable<Match> matches = socialMediaRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts software version numbers from the provided [text].
  ///
  /// This function identifies and extracts software version numbers from the input [text].
  ///
  /// The [text] parameter represents the text containing software version numbers.
  ///
  /// Returns a [List<String>] containing identified software version numbers from the input [text].
  ///
  /// Note:
  /// - The function captures version numbers in the format x.y.z where 'x', 'y', 'z' are digits.

  static List<String> softwareVersionNumbers(String text) {
    RegExp softwareVersionRegex = RegExp(r'\b\d+(\.\d+)+\b');
    Iterable<Match> matches = softwareVersionRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts ordinal numbers (e.g., first, second, third) from the provided [text].
  ///
  /// This function identifies and extracts ordinal numbers from the input [text].
  ///
  /// The [text] parameter represents the text containing ordinal numbers.
  ///
  /// Returns a [List<String>] containing identified ordinal numbers from the input [text].

  static List<String> ordinalNumbers(String text) {
    RegExp ordinalNumberRegex = RegExp(
        r'\b(first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth)\b',
        caseSensitive: false);
    Iterable<Match> matches = ordinalNumberRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts meta tags from HTML content in the provided [text].
  ///
  /// This function identifies and extracts meta tags from HTML text.
  ///
  /// The [text] parameter represents the text containing HTML meta tags.
  ///
  /// Returns a [List<String>] containing identified meta tags from the input [text].

  static List<String> metaTags(String text) {
    RegExp metaTagsRegex = RegExp(r'<meta [^>]*>');
    Iterable<Match> matches = metaTagsRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts stock ticker symbols from the provided [text].
  ///
  /// This function identifies and extracts stock ticker symbols from the input [text].
  ///
  /// The [text] parameter represents the text containing stock ticker symbols.
  ///
  /// Returns a [List<String>] containing identified stock ticker symbols from the input [text].
  ///
  /// Note:
  /// - The function captures uppercase alphabetic strings of 2 to 5 characters.
  static List<String> stockTickerSymbols(String text) {
    RegExp tickerSymbolRegex = RegExp(r'\b[A-Z]{2,5}\b');
    Iterable<Match> matches = tickerSymbolRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts hash values from the provided [text].
  ///
  /// This function identifies and extracts hash values (MD5, SHA-1, SHA-256) from the input [text].
  ///
  /// The [text] parameter represents the text containing hash values.
  ///
  /// Returns a [List<String>] containing identified hash values from the input [text].
  ///
  /// Note:
  /// - Hash values are captured in formats: 32, 40, or 64 characters long hexadecimal strings.

  static List<String> hashValues(String text) {
    RegExp hashValueRegex =
        RegExp(r'\b[A-Fa-f0-9]{32}\b|\b[A-Fa-f0-9]{40}\b|\b[A-Fa-f0-9]{64}\b');
    Iterable<Match> matches = hashValueRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts chemical compound names from the provided [text].
  ///
  /// This function identifies and extracts chemical compound names from the input [text].
  ///
  /// The [text] parameter represents the text containing chemical compound names.
  ///
  /// Returns a [List<String>] containing identified chemical compound names from the input [text].
  ///
  /// Note:
  /// - The function captures compound names starting with an uppercase letter followed by lowercase letters.

  static List<String> chemicalCompoundNames(String text) {
    RegExp compoundNameRegex = RegExp(r'\b[A-Z][a-z]+\b');
    Iterable<Match> matches = compoundNameRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts MIME types from the provided [text].
  ///
  /// This function identifies and extracts MIME types from the input [text].
  ///
  /// The [text] parameter represents the text containing MIME types.
  ///
  /// Returns a [List<String>] containing identified MIME types from the input [text].
  ///
  /// Note:
  /// - MIME types are captured in the format 'type/subtype'.

  static List<String> mimeTypes(String text) {
    RegExp mimeTypeRegex = RegExp(r'\b[a-zA-Z\-]+\/[a-zA-Z\-]+\b');
    Iterable<Match> matches = mimeTypeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts HTTP status codes from the provided [text].
  ///
  /// This function identifies and extracts HTTP status codes from the input [text].
  ///
  /// The [text] parameter represents the text containing HTTP status codes.
  ///
  /// Returns a [List<String>] containing identified HTTP status codes from the input [text].
  ///
  /// Note:
  /// - Status codes are captured as 3-digit numeric values.

  static List<String> httpStatusCodes(String text) {
    RegExp httpStatusCodeRegex = RegExp(r'\b\d{3}\b');
    Iterable<Match> matches = httpStatusCodeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts coordinates from the provided [text].
  ///
  /// This function identifies and extracts geographical coordinates from the input [text].
  ///
  /// The [text] parameter represents the text containing coordinates.
  ///
  /// Returns a [List<String>] containing identified coordinates from the input [text].
  ///
  /// Note:
  /// - Coordinates are captured in various formats like degrees (°) with optional N/S/E/W indicators.

  static List<String> coordinates(String text) {
    RegExp coordinateRegex = RegExp(
        r'\b-?\d+(\.\d+)?\s*[°º]\s*[NS]?\b|\b-?\d+(\.\d+)?\s*[°º]\s*[WE]?\b');
    Iterable<Match> matches = coordinateRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extracts programming keywords from the provided [text] based on the specified [language].
  ///
  /// This function identifies and extracts programming keywords from the input [text].
  ///
  /// The [text] parameter represents the text containing programming keywords.
  /// The [language] parameter specifies the programming language ('Dart' or others).
  ///
  /// Returns a [List<String>] containing identified programming keywords from the input [text].
  ///
  /// Note:
  /// - The function captures keywords specific to the provided programming language in a case-insensitive manner.
  static List<String> extractProgrammingKeywords(String text, String language) {
    String keywordList = language == 'Dart'
        ? 'abstract|dynamic|implements|show|as|else|import|static|assert|enum|in|super|async|export|interface|switch|await|external|is|sync|break|extends|library|this|case|factory|mixin|throw|catch|false|new|true|class|final|null|try|const|finally|operator|typedef|continue|for|part|var|covariant|Function|rethrow|void|default|get|required|while|deferred|hide|return|with|do|if'
        : '';

    RegExp keywordRegex =
        RegExp(r'\b(?:' + keywordList + r')\b', caseSensitive: false);
    Iterable<Match> matches = keywordRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }
}
