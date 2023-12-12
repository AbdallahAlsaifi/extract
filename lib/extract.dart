import 'extract_platform_interface.dart';

class Extract {
  Future<String?> getPlatformVersion() {
    return ExtractPlatform.instance.getPlatformVersion();
  }

  static List<String> phoneNumbers(String text) {
    RegExp phoneRegex = RegExp(r'(\+?\d{1,2}\s?)?[\d-]{8,}');
    Iterable<Match> matches = phoneRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> urls(String text) {
    RegExp urlRegex = RegExp(r'https?://(?:[-\w.]|(?:%[\da-fA-F]{2}))+');
    Iterable<Match> matches = urlRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  List<String> allDates(String text) {
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

  static List<String> specificWords(String text, String word) {
    RegExp wordRegex = RegExp(r'\b' + word + r'\b', caseSensitive: false);
    Iterable<Match> matches = wordRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> addresses(String text) {
    RegExp addressRegex = RegExp(
        r'\d{1,5}\s\w+\s\w+,\s?\w+,\s\w+\s\d{5}|\d{1,5}\s\w+\s\w+\s\w+,\s\w+,\s\w+\s\d{5}');
    Iterable<Match> matches = addressRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> numericValues(String text,
      {bool includeDecimals = false}) {
    RegExp numericRegex =
        includeDecimals ? RegExp(r'\b\d+(\.\d+)?\b') : RegExp(r'\b\d+\b');
    Iterable<Match> matches = numericRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> hashtagsMentions(String text,
      {bool includeMentions = true}) {
    RegExp tagRegex =
        includeMentions ? RegExp(r'#[^\s#]+|\B@\w+') : RegExp(r'#[^\s#]+');
    Iterable<Match> matches = tagRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> filePaths(String text, {String separator = '/'}) {
    RegExp filePathRegex = RegExp('(?:$separator[\\w-]+)+$separator?');
    Iterable<Match> matches = filePathRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> specialCharacters(String text,
      {String characterSet = r'[^\w\s]'}) {
    RegExp specialCharRegex = RegExp(characterSet);
    Iterable<Match> matches = specialCharRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> keywordsPhrases(String text, String keyword,
      {bool caseSensitive = false}) {
    RegExp keywordRegex =
        RegExp(r'\b' + keyword + r'\b', caseSensitive: caseSensitive);
    Iterable<Match> matches = keywordRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> sentencesParagraphs(String text,
      {String separator = '.'}) {
    RegExp sentenceRegex = RegExp('.+?(?=$separator)');
    Iterable<Match> matches = sentenceRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> acronymsAbbreviations(String text) {
    RegExp acronymRegex = RegExp(r'\b[A-Z]{2,}\b');
    Iterable<Match> matches = acronymRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> ssns(String text) {
    RegExp ssnRegex = RegExp(r'\b\d{3}-\d{2}-\d{4}\b');
    Iterable<Match> matches = ssnRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> iPAddresses(String text) {
    RegExp ipRegex = RegExp(r'\b(?:\d{1,3}\.){3}\d{1,3}\b');
    Iterable<Match> matches = ipRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> creditCardNumbers(String text) {
    RegExp creditCardRegex = RegExp(r'\b(?:\d[ -]*?){13,16}\b');
    Iterable<Match> matches = creditCardRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> codeSnippets(String text, {String language = ''}) {
    RegExp codeRegex = RegExp(r'```(?:$language\n)?([\s\S]+?)```');
    Iterable<Match> matches = codeRegex.allMatches(text);
    return matches.map((match) => match.group(1)!).toList();
  }

  static List<String> unitsOfMeasurement(String text) {
    RegExp unitRegex = RegExp(r'\b\d+\s?\w+\b');
    Iterable<Match> matches = unitRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> productCodesIDs(String text) {
    RegExp productCodeRegex = RegExp(r'\b[A-Z0-9]{6,}\b');
    Iterable<Match> matches = productCodeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> sentimentKeywords(String text) {
    RegExp sentimentRegex =
        RegExp(r'\b(?:good|bad|excellent|poor|great)\b', caseSensitive: false);
    Iterable<Match> matches = sentimentRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> time(String text) {
    RegExp timeRegex =
        RegExp(r'\b(?:[01]\d|2[0-3]):(?:[0-5]\d)(?::(?:[0-5]\d))?\b');
    Iterable<Match> matches = timeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> companyNames(String text) {
    RegExp companyRegex = RegExp(r'\b[A-Z][a-z]+(?:\s[A-Z][a-z]+)*\b');
    Iterable<Match> matches = companyRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> jobTitles(String text) {
    RegExp jobTitleRegex = RegExp(r'\b(?:[A-Z][a-z]*\s?)+\b');
    Iterable<Match> matches = jobTitleRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> vins(String text) {
    RegExp vinRegex = RegExp(r'\b[A-HJ-NPR-Z0-9]{17}\b');
    Iterable<Match> matches = vinRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> twitterHandles(String text) {
    RegExp twitterRegex = RegExp(r'@[A-Za-z0-9_]+');
    Iterable<Match> matches = twitterRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> youTubeVideoIDs(String text) {
    RegExp youtubeRegex =
        RegExp(r'(?<=youtu\.be\/|watch\?v=)[A-Za-z0-9_-]{11}');
    Iterable<Match> matches = youtubeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> isbns(String text) {
    RegExp isbnRegex = RegExp(
        r'\b(?:ISBN(?:-1[03])?:?\s*)?(?=[-0-9X ]{10,17}$|97[89][-0-9X ]{10}$|(?=(?:[-0-9X ]+){13}$|(?=(?:[-0-9X ]+){17}$) 97[89][-0-9X ]{13})[-0-9X]{1,5}[- ](?:[0-9]+[- ]){2}[0-9X]\b)');
    Iterable<Match> matches = isbnRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> htmlTagsAttributes(String text) {
    RegExp htmlRegex = RegExp(r'<([a-z][a-z0-9]*)\b[^>]*>(.*?)<\/\1>');
    Iterable<Match> matches = htmlRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> hexColorCodes(String text) {
    RegExp hexColorRegex = RegExp(r'#[0-9a-fA-F]{6}\b');
    Iterable<Match> matches = hexColorRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> statisticalData(String text) {
    RegExp statisticsRegex = RegExp(r'\b(mean|median|mode|range)\b');
    Iterable<Match> matches = statisticsRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> twiiterAndFacebookPostIDs(String text, String platform) {
    String regexPattern = platform == 'Twitter'
        ? r'(?<=twitter\.com\/\w+\/status\/)\d+'
        : r'(?<=facebook\.com\/\w+\/posts\/)\d+';
    RegExp socialMediaRegex = RegExp(regexPattern);
    Iterable<Match> matches = socialMediaRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> employeeIDs(String text) {
    RegExp employeeIDRegex = RegExp(r'\b[A-Za-z0-9]{5,}\b');
    Iterable<Match> matches = employeeIDRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> bankAccountNumbers(String text) {
    RegExp bankAccountRegex = RegExp(r'\b\d{9,12}\b');
    Iterable<Match> matches = bankAccountRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> apiEndpoints(String text) {
    RegExp apiEndpointRegex = RegExp(r'\/[a-zA-Z0-9\/\-\_]+');
    Iterable<Match> matches = apiEndpointRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> osPaths(String text) {
    RegExp osPathRegex = RegExp(r'([A-Za-z]):(\\[A-Za-z0-9_\-\.]+)+');
    Iterable<Match> matches = osPathRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> twitterAndFacebookPostContent(
      String text, String platform) {
    String regexPattern = platform == 'Twitter'
        ? r'(?<=twitter\.com\/\w+\/status\/)\d+'
        : r'(?<=facebook\.com\/\w+\/posts\/)\d+';
    RegExp socialMediaRegex = RegExp(regexPattern);
    Iterable<Match> matches = socialMediaRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> softwareVersionNumbers(String text) {
    RegExp softwareVersionRegex = RegExp(r'\b\d+(\.\d+)+\b');
    Iterable<Match> matches = softwareVersionRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> ordinalNumbers(String text) {
    RegExp ordinalNumberRegex = RegExp(
        r'\b(first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth)\b',
        caseSensitive: false);
    Iterable<Match> matches = ordinalNumberRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> metaTags(String text) {
    RegExp metaTagsRegex = RegExp(r'<meta [^>]*>');
    Iterable<Match> matches = metaTagsRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> stockTickerSymbols(String text) {
    RegExp tickerSymbolRegex = RegExp(r'\b[A-Z]{2,5}\b');
    Iterable<Match> matches = tickerSymbolRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> hashValues(String text) {
    RegExp hashValueRegex =
        RegExp(r'\b[A-Fa-f0-9]{32}\b|\b[A-Fa-f0-9]{40}\b|\b[A-Fa-f0-9]{64}\b');
    Iterable<Match> matches = hashValueRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> chemicalCompoundNames(String text) {
    RegExp compoundNameRegex = RegExp(r'\b[A-Z][a-z]+\b');
    Iterable<Match> matches = compoundNameRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> mimeTypes(String text) {
    RegExp mimeTypeRegex = RegExp(r'\b[a-zA-Z\-]+\/[a-zA-Z\-]+\b');
    Iterable<Match> matches = mimeTypeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> httpStatusCodes(String text) {
    RegExp httpStatusCodeRegex = RegExp(r'\b\d{3}\b');
    Iterable<Match> matches = httpStatusCodeRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  static List<String> coordinates(String text) {
    RegExp coordinateRegex = RegExp(
        r'\b-?\d+(\.\d+)?\s*[°º]\s*[NS]?\b|\b-?\d+(\.\d+)?\s*[°º]\s*[WE]?\b');
    Iterable<Match> matches = coordinateRegex.allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

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
