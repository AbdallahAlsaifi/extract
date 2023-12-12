
# Extract Class
![Pub Popularity](https://img.shields.io/pub/popularity/extract)
![Pub Points](https://img.shields.io/pub/points/extract)
![Pub Likes](https://img.shields.io/pub/likes/extract)
![Pub Version](https://img.shields.io/pub/v/extract)
[![Youtube](https://img.shields.io/badge/YouTube-FF0000?logo=youtube&logoColor=white)](https://www.youtube.com/@AbdallahAlsaifi)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-in-0e76a8)](https://www.linkedin.com/in/abdallahAlsaifi)

[![Alt text](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/abdallahalsaifi)

![Visitor Count](https://profile-counter.glitch.me/abdallahAlsaifi_extract/count.svg)
Extract whatever you need with **Extract** and save your time

## Table of Contents

- [Methods](#methods)
    - [phoneNumbers](#phonenumbers)
    - [urls](#urls)
    - [allDates](#alldates)
    - [specificWords(text, word)](#specificwords)
    - [addresses](#addresses)
    - [numericValues(text, includeDecimals)](#numericvalues)
    - [hashtagsMentions(text, includeMentions)](#hashtagsmentions)
    - [filePaths(text, separator)](#filepaths)
    - [specialCharacters(text, characterSet)](#specialcharacters)
    - [keywordsPhrases(text, keyword, caseSensitive)](#keywordsphrases)
    - [sentencesParagraphs(text, separator)](#sentencesparagraphs)
    - [acronymsAbbreviations](#acronymsabbreviations)
    - [ssns](#ssns)
    - [iPAddresses](#ipaddresses)
    - [creditCardNumbers](#creditcardnumbers)
    - [codeSnippets(text, language)](#codesnippets)
    - [unitsOfMeasurement](#unitsofmeasurement)
    - [productCodesIDs](#productcodesids)
    - [sentimentKeywords](#sentimentkeywords)
    - [time](#time)
    - [companyNames](#companynames)
    - [jobTitles](#jobtitles)
    - [vins](#vins)
    - [twitterHandles](#twitterhandles)
    - [youTubeVideoIDs](#youtubevideoids)
    - [isbns](#isbns)
    - [htmlTagsAttributes](#htmltagsattributes)
    - [hexColorCodes](#hexcolorcodes)
    - [statisticalData](#statisticaldata)
    - [twiiterAndFacebookPostIDs(text, platform)](#twiiterandfacebookpostids)
    - [employeeIDs](#employeeids)
    - [bankAccountNumbers](#bankaccountnumbers)
    - [apiEndpoints](#apiendpoints)
    - [osPaths](#ospaths)
    - [twitterAndFacebookPostContent(text, platform)](#twitterandfacebookpostcontent)
    - [softwareVersionNumbers](#softwareversionnumbers)
    - [ordinalNumbers](#ordinalnumbers)
    - [metaTags](#metatags)
    - [stockTickerSymbols](#stocktickersymbols)
    - [hashValues](#hashvalues)
    - [chemicalCompoundNames](#chemicalcompoundnames)
    - [mimeTypes](#mimetypes)
    - [httpStatusCodes](#httpstatuscodes)
    - [coordinates](#coordinates)
    - [extractProgrammingKeywords](#extractprogrammingkeywords)

---

## Methods

### phoneNumbers

The `phoneNumbers` method within the `Extract` class is responsible for extracting phone numbers from the provided text using regular expressions.

- **Method Signature:**
  ```dart
  static List<String> phoneNumbers(String text)
  ```

- **Parameters:**
    - `text`: The text input from which phone numbers will be extracted.

- **Description:**
  This method utilizes a regular expression pattern to identify and extract phone numbers from the given text. It captures sequences that resemble phone numbers, including various formats like `+1234567890`, `123-456-7890`, etc.

- **Usage:**
  ```dart
  String text = 'Contact us at +1234567890 or 123-456-7890';
  List<String> numbers = Extract.phoneNumbers(text);
  ```

- **Example:**
  ```dart
  String text = 'Reach us at +1 555-555-5555 or 123-456-7890';
  List<String> extractedNumbers = Extract.phoneNumbers(text);
  // Result: ['+1 555-555-5555', '123-456-7890']
  ```

- **Return Value:**
    - A list containing all identified phone numbers present in the provided text.

- **Note:**
    - This method might capture phone number-like sequences in text but does not guarantee that the extracted sequence is a valid or active phone number.

- **Considerations:**
    - Ensure the input text is appropriately formatted and contains the desired phone numbers for accurate extraction.

### urls

The `urls` method within the `Extract` class is designed to extract URLs from the provided text using regular expressions.

- **Method Signature:**
  ```dart
  static List<String> urls(String text)
  ```

- **Parameters:**
    - `text`: The text input from which URLs will be extracted.

- **Description:**
  This method employs a regular expression pattern (`RegExp`) to identify and extract URLs from the given text. It captures URL patterns that start with `http://` or `https://` followed by a sequence of characters representing the URL structure.

- **Usage:**
  ```dart
  String text = 'Visit our website at https://example.com';
  List<String> extractedUrls = Extract.urls(text);
  ```

- **Example:**
  ```dart
  String text = 'Explore more at http://www.example.org and https://another-example.com';
  List<String> extracted = Extract.urls(text);
  // Result: ['http://www.example.org', 'https://another-example.com']
  ```

- **Return Value:**
    - A list containing all identified URLs present in the provided text.

- **Note:**
    - This method identifies and extracts URL-like patterns but does not validate or guarantee the existence or validity of the URLs.

- **Considerations:**
    - Ensure the input text contains well-formed URLs for accurate extraction.

### allDates

The `allDates` method within the `Extract` class is designed to extract various date formats from the provided text using multiple regular expression patterns.

- **Method Signature:**
  ```dart
  List<String> allDates(String text)
  ```

- **Parameters:**
    - `text`: The text input from which different date formats will be extracted.

- **Description:**
  This method utilizes an array of regular expression patterns to identify and extract various date formats from the given text. It captures different date representations such as `DD/MM/YYYY`, `Jan 31, 2023`, `2023-12-31`, etc., covering a wide range of common date formats.

- **Usage:**
  ```dart
  String text = 'The event is on 12/31/2023 or Jan 15, 2024';
  List<String> extractedDates = Extract.allDates(text);
  ```

- **Example:**
  ```dart
  String text = 'Meeting scheduled for 31-Dec-2023 or 01.15.2024';
  List<String> extracted = Extract.allDates(text);
  // Result: ['31-Dec-23', '01.15.2024']
  ```

- **Return Value:**
    - A list containing all identified date formats present in the provided text.

- **Note:**
    - This method might capture date-like sequences in text but does not guarantee the accuracy or validity of the extracted dates.

- **Considerations:**
    - Ensure the input text contains diverse date formats for accurate extraction.

### specificWords

The `specificWords` method within the `Extract` class is designed to extract occurrences of a specific word from the provided text using a case-insensitive regular expression pattern.

- **Method Signature:**
  ```dart
  static List<String> specificWords(String text, String word)
  ```

- **Parameters:**
    - `text`: The text input from which occurrences of the specific `word` will be extracted.
    - `word`: The specific word to search for in the text.

- **Description:**
  This method constructs a case-insensitive regular expression pattern to identify and extract instances of the specified `word` within the given `text`.

- **Usage:**
  ```dart
  String text = 'The word "apple" appeared multiple times in the text.';
  String specificWord = 'apple';
  List<String> extractedWords = Extract.specificWords(text, specificWord);
  ```

- **Example:**
  ```dart
  String text = 'The term "apple" refers to a fruit named apple.';
  String specificWord = 'apple';
  List<String> extracted = Extract.specificWords(text, specificWord);
  // Result: ['apple', 'apple']
  ```

- **Return Value:**
    - A list containing all occurrences of the specified `word` present in the provided text.

- **Note:**
    - This method identifies occurrences of the specified `word` based on word boundaries and ignores case sensitivity.

- **Considerations:**
    - Ensure the input `text` contains instances of the specific `word` for accurate extraction.

### addresses

The `addresses` method within the `Extract` class aims to extract addresses from the provided text using a regular expression pattern.

- **Method Signature:**
  ```dart
  static List<String> addresses(String text)
  ```

- **Parameters:**
    - `text`: The text input containing addresses to be extracted.

- **Description:**
  This method employs a regular expression pattern designed to identify and extract addresses from the given `text`. It looks for patterns resembling standard address formats and retrieves them from the text.

- **Usage:**
  ```dart
  String text = 'The address is 123 Main St, City, State 12345';
  List<String> extractedAddresses = Extract.addresses(text);
  ```

- **Example:**
  ```dart
  String text = '1234 Elm Street, Apt 5B, New York, NY 10001';
  List<String> extracted = Extract.addresses(text);
  // Result: ['1234 Elm Street, Apt 5B, New York, NY 10001']
  ```

- **Return Value:**
    - A list containing all identified address formats present in the provided text.

- **Note:**
    - The effectiveness of address extraction heavily relies on the consistency and format of addresses within the input text.

- **Considerations:**
    - Ensure the input `text` contains addresses conforming to the patterns recognized by the regular expression for accurate extraction.


### numericValues

The `numericValues` method within the `Extract` class is designed to extract numeric values from the provided text, allowing an option to include decimals based on the specified flag.

- **Method Signature:**
  ```dart
  static List<String> numericValues(String text, {bool includeDecimals = false})
  ```

- **Parameters:**
    - `text`: The text input containing numeric values to be extracted.
    - `includeDecimals` (Optional): A boolean flag that specifies whether to include decimal values (default: `false`).

- **Description:**
  This method utilizes a regular expression pattern to identify and extract numeric values from the given `text`. The inclusion of decimals is controlled by the `includeDecimals` parameter.

- **Usage:**
  ```dart
  String text = 'The price is $25.99, and the count is 100.';
  List<String> extractedNumbers = Extract.numericValues(text);
  List<String> extractedDecimals = Extract.numericValues(text, includeDecimals: true);
  ```

- **Example:**
  ```dart
  String text = 'The product cost is $50.';
  List<String> extracted = Extract.numericValues(text);
  // Result: ['50']
  List<String> extractedWithDecimals = Extract.numericValues(text, includeDecimals: true);
  // Result: ['50']
  ```

- **Return Value:**
    - A list containing all identified numeric values (with or without decimals) present in the provided text based on the specified flag.

- **Note:**
    - The method extracts numeric values based on the presence or absence of decimals, as controlled by the `includeDecimals` parameter.

- **Considerations:**
    - Ensure the input `text` contains numeric values that conform to the expected patterns for accurate extraction.

### hashtagsMentions

The `hashtagsMentions` method within the `Extract` class is designed to extract hashtags and optionally mentions from the provided text.

- **Method Signature:**
  ```dart
  static List<String> hashtagsMentions(String text, {bool includeMentions = true})
  ```

- **Parameters:**
    - `text`: The text input containing hashtags and/or mentions to be extracted.
    - `includeMentions` (Optional): A boolean flag that specifies whether to include mentions (default: `true`).

- **Description:**
  This method utilizes a regular expression pattern to identify and extract hashtags and mentions from the given `text`. The extraction of mentions is controlled by the `includeMentions` parameter.

- **Usage:**
  ```dart
  String text = 'This is a #hashtag and a @mention in a sentence.';
  List<String> extractedTags = Extract.hashtagsMentions(text);
  List<String> extractedOnlyHashtags = Extract.hashtagsMentions(text, includeMentions: false);
  ```

- **Example:**
  ```dart
  String text = 'Post about #technology and mention @ChatGPT.';
  List<String> extracted = Extract.hashtagsMentions(text);
  // Result: ['#technology', '@ChatGPT']
  List<String> extractedOnlyHashtags = Extract.hashtagsMentions(text, includeMentions: false);
  // Result: ['#technology']
  ```

- **Return Value:**
    - A list containing identified hashtags and/or mentions from the provided text based on the specified flag.

- **Note:**
    - The method distinguishes between hashtags (`#hashtag`) and mentions (`@username`) based on the regular expression pattern and includes them in the extraction accordingly.

- **Considerations:**
    - Ensure the input `text` contains hashtags and/or mentions conforming to expected patterns for accurate extraction.

### filePaths

The `filePaths` method in the `Extract` class is designed to extract file paths from the provided text based on a specified separator.

- **Method Signature:**
  ```dart
  static List<String> filePaths(String text, {String separator = '/'})
  ```

- **Parameters:**
    - `text`: The input text containing file paths to be extracted.
    - `separator` (Optional): A string specifying the separator used in the file paths (default: `/`).

- **Description:**
  This method uses a regular expression pattern to identify and extract file paths from the given `text` based on the provided `separator`.

- **Usage:**
  ```dart
  String text = 'The file paths are /path/to/file1.txt and /directory/path/file2.jpg';
  List<String> extractedPaths = Extract.filePaths(text);
  List<String> extractedPathsUsingSeparator = Extract.filePaths(text, separator: '/');
  ```

- **Example:**
  ```dart
  String text = 'The file paths are /path/to/file1.txt and /directory/path/file2.jpg';
  List<String> extracted = Extract.filePaths(text);
  // Result: ['/path/to/file1.txt', '/directory/path/file2.jpg']
  ```

- **Return Value:**
    - A list containing identified file paths from the provided text based on the specified separator.

- **Note:**
    - The method uses the `separator` parameter to define the separator character(s) in the file paths. Adjust the separator parameter to match the specific separator used in the input text for accurate extraction.

- **Considerations:**
    - Ensure the input `text` contains file paths conforming to the expected structure and uses the provided `separator` for accurate extraction.

### specialCharacters

The `specialCharacters` method in the `Extract` class aims to extract special characters from the provided text based on a specified character set.

- **Method Signature:**
  ```dart
  static List<String> specialCharacters(String text, {String characterSet = r'[^\w\s]'})
  ```

- **Parameters:**
    - `text`: The input text containing special characters to be extracted.
    - `characterSet` (Optional): A string specifying the character set for extracting special characters (default: `r'[^\w\s]'`).

- **Description:**
  This method utilizes a regular expression pattern to identify and extract special characters from the given `text` based on the provided `characterSet`.

- **Usage:**
  ```dart
  String text = 'The $@# text! *& contains special characters.';
  List<String> extractedChars = Extract.specialCharacters(text);
  List<String> extractedCharsWithCustomSet = Extract.specialCharacters(text, characterSet: r'[!@#$%^&*]');
  ```

- **Example:**
  ```dart
  String text = 'The $@# text! *& contains special characters.';
  List<String> extracted = Extract.specialCharacters(text);
  // Result: ['$', '@', '#', '!', '*', '&']
  ```

- **Return Value:**
    - A list containing identified special characters from the provided text based on the specified `characterSet`.

- **Note:**
    - The method uses the `characterSet` parameter to define the set of characters to be extracted as special characters. Modify the `characterSet` parameter to match the specific characters you want to extract.

- **Considerations:**
    - Ensure the input `text` contains the characters that align with the specified `characterSet` for accurate extraction.

### keywordsPhrases

The `keywordsPhrases` method in the `Extract` class is designed to extract occurrences of a specific `keyword` or phrase from the provided text.

- **Method Signature:**
  ```dart
  static List<String> keywordsPhrases(String text, String keyword, {bool caseSensitive = false})
  ```

- **Parameters:**
    - `text`: The input text where the method will search for the specified `keyword` or phrase.
    - `keyword`: The specific word or phrase to search for in the `text`.
    - `caseSensitive` (Optional): A boolean indicating whether the search for `keyword` should be case-sensitive (default: `false`).

- **Description:**
  This method utilizes a regular expression pattern to identify and extract occurrences of the specified `keyword` or phrase from the given `text`. The `caseSensitive` parameter allows toggling between case-sensitive and case-insensitive searches.

- **Usage:**
  ```dart
  String text = 'The quick brown fox jumps over the lazy dog.';
  String keyword = 'the';
  List<String> extracted = Extract.keywordsPhrases(text, keyword);
  List<String> caseSensitiveExtracted = Extract.keywordsPhrases(text, keyword, caseSensitive: true);
  ```

- **Example:**
  ```dart
  String text = 'The quick brown fox jumps over the lazy dog.';
  String keyword = 'the';
  List<String> extracted = Extract.keywordsPhrases(text, keyword);
  // Result (case-insensitive): ['The', 'the']
  ```

- **Return Value:**
    - A list containing all occurrences of the specified `keyword` or phrase in the provided `text`.

- **Note:**
    - By default, the search is case-insensitive. To perform a case-sensitive search, set the `caseSensitive` parameter to `true`.
    - The method uses word boundaries (`\b`) in the regular expression pattern to ensure it matches whole words or phrases.

- **Considerations:**
    - Ensure the `text` and `keyword` parameters are accurately provided to extract the desired occurrences.


### sentencesParagraphs

The `sentencesParagraphs` method within the `Extract` class is designed to extract sentences or paragraphs from the given text.

- **Method Signature:**
  ```dart
  static List<String> sentencesParagraphs(String text, {String separator = '.'})
  ```

- **Parameters:**
    - `text`: The text input from which sentences or paragraphs will be extracted.
    - `separator` (Optional): The separator indicating the end of a sentence or paragraph (default: `.`).

- **Description:**
  This method uses a regular expression pattern to split the provided `text` into sentences or paragraphs based on the specified `separator`. Each match represents a sentence or paragraph in the text.

- **Usage:**
  ```dart
  String text = 'This is a sample text. It contains multiple sentences.';
  List<String> extractedSentences = Extract.sentencesParagraphs(text);
  List<String> extractedParagraphs = Extract.sentencesParagraphs(text, separator: '\n');
  ```

- **Example:**
  ```dart
  String text = 'This is a sample text. It contains multiple sentences.';
  List<String> extractedSentences = Extract.sentencesParagraphs(text);
  // Result: ['This is a sample text', ' It contains multiple sentences']
  ```

- **Return Value:**
    - A list containing sentences or paragraphs based on the `separator` provided.

- **Note:**
    - The method splits the text based on the `separator` to identify sentences or paragraphs. Custom separators like `\n` can be used for paragraph extraction.

- **Considerations:**
    - Ensure the `text` input is correctly provided for accurate sentence or paragraph extraction.
    - Adjust the `separator` parameter to suit the text's structure and the desired splitting criteria.

### acronymsAbbreviations

The `acronymsAbbreviations` method within the `Extract` class is used to extract acronyms or abbreviations from the provided text.

- **Method Signature:**
  ```dart
  static List<String> acronymsAbbreviations(String text)
  ```

- **Parameters:**
    - `text`: The input text from which acronyms or abbreviations will be extracted.

- **Description:**
  This method employs a regular expression pattern to identify and extract sequences of uppercase letters (`A-Z`) with a minimum length of two characters, assuming them to be acronyms or abbreviations.

- **Usage:**
  ```dart
  String text = 'The NASA is an acronym for National Aeronautics and Space Administration.';
  List<String> extractedAcronyms = Extract.acronymsAbbreviations(text);
  ```

- **Example:**
  ```dart
  String text = 'The NASA is an acronym for National Aeronautics and Space Administration.';
  List<String> extractedAcronyms = Extract.acronymsAbbreviations(text);
  // Result: ['NASA']
  ```

- **Return Value:**
    - A list containing identified acronyms or abbreviations present in the input `text`.

- **Note:**
    - The method targets uppercase sequences of letters with a minimum length of two characters, assuming them to be acronyms or abbreviations.
    - Ensure the provided `text` accurately represents content where acronyms or abbreviations might exist.

- **Considerations:**
    - The method may return false positives or miss certain acronyms based on the pattern matching criteria.
    - Review the identified acronyms or abbreviations to ensure they meet the desired extraction criteria.

### ssns

The `ssns` method within the `Extract` class is designed to extract Social Security Numbers (SSNs) from the provided text.

- **Method Signature:**
  ```dart
  static List<String> ssns(String text)
  ```

- **Parameters:**
    - `text`: The input text from which SSNs will be extracted.

- **Description:**
  This method uses a regular expression pattern to identify and extract sequences of digits in the format `###-##-####`, assuming them to be Social Security Numbers (SSNs).

- **Usage:**
  ```dart
  String text = 'The document contains SSNs like 123-45-6789 and 987-65-4321.';
  List<String> extractedSSNs = Extract.ssns(text);
  ```

- **Example:**
  ```dart
  String text = 'The document contains SSNs like 123-45-6789 and 987-65-4321.';
  List<String> extractedSSNs = Extract.ssns(text);
  // Result: ['123-45-6789', '987-65-4321']
  ```

- **Return Value:**
    - A list containing identified Social Security Numbers present in the input `text`.

- **Note:**
    - The method targets sequences in the format `###-##-####` and assumes them to be SSNs.
    - Ensure the provided `text` accurately represents content where SSNs might exist.

- **Considerations:**
    - This method may return false positives if the pattern is present in non-SSN content.
    - Review the extracted numbers to ensure they indeed represent valid SSNs.

### iPAddresses

The `iPAddresses` method, part of the `Extract` class, is utilized to extract IP addresses from a given text.

- **Method Signature:**
  ```dart
  static List<String> iPAddresses(String text)
  ```

- **Parameters:**
    - `text`: The text where IP addresses are to be identified and extracted.

- **Description:**
  This method utilizes a regular expression pattern to identify and extract IP addresses in the format of `###.###.###.###`.

- **Usage:**
  ```dart
  String text = 'The text includes IPs like 192.168.0.1 and 10.0.0.1.';
  List<String> extractedIPs = Extract.iPAddresses(text);
  ```

- **Example:**
  ```dart
  String text = 'The text includes IPs like 192.168.0.1 and 10.0.0.1.';
  List<String> extractedIPs = Extract.iPAddresses(text);
  // Result: ['192.168.0.1', '10.0.0.1']
  ```

- **Return Value:**
    - A list containing the identified IP addresses present in the input `text`.

- **Note:**
    - This method targets patterns in the format `###.###.###.###` and assumes them to be IP addresses.
    - Ensure the provided `text` accurately represents content where IP addresses might exist.

- **Considerations:**
    - This method may return false positives if the pattern is present in non-IP content.
    - Review the extracted addresses to confirm they are valid IPs.

### creditCardNumbers

The `creditCardNumbers` method, part of the `Extract` class, is designed to extract potential credit card numbers from a given text.

- **Method Signature:**
  ```dart
  static List<String> creditCardNumbers(String text)
  ```

- **Parameters:**
    - `text`: The text where credit card numbers are to be identified and extracted.

- **Description:**
  This method utilizes a regular expression pattern to identify sequences of digits that potentially represent credit card numbers. The identified sequences are typically between 13 to 16 digits, optionally separated by spaces or dashes.

- **Usage:**
  ```dart
  String text = 'The text contains credit card numbers like 4111-1111-1111-1111.';
  List<String> extractedCreditCards = Extract.creditCardNumbers(text);
  ```

- **Example:**
  ```dart
  String text = 'The text contains credit card numbers like 4111-1111-1111-1111.';
  List<String> extractedCreditCards = Extract.creditCardNumbers(text);
  // Result: ['4111-1111-1111-1111']
  ```

- **Return Value:**
    - A list containing the identified potential credit card numbers present in the input `text`.

- **Note:**
    - This method aims to find sequences of digits that resemble typical credit card numbers.
    - It might produce false positives if the pattern is present in non-credit card content.
    - Review the extracted numbers to ensure they correspond to actual credit card numbers if used for validation or verification purposes.

- **Considerations:**
    - The identified sequences may or may not be valid credit card numbers; further validation might be necessary for confirmation.

### codeSnippets

The `codeSnippets` method, within the `Extract` class, is created to extract code snippets from a given text, optionally filtered by a specific programming `language`.

- **Method Signature:**
  ```dart
  static List<String> codeSnippets(String text, {String language = ''})
  ```

- **Parameters:**
    - `text`: The text containing code snippets.
    - `language` (optional): The programming language used in the code snippets (if provided).

- **Description:**
  This method employs a regular expression to identify and extract code blocks enclosed in triple backticks (```), optionally filtered by a specified programming language.

- **Usage:**
  ```dart
  String text = 'Here is a Dart code snippet:\n```dart\nvoid main() {\n  print("Hello, world!");\n}\n```';
  List<String> extractedCode = Extract.codeSnippets(text, language: 'dart');
  ```

- **Example:**
  ```dart
  String text = 'Here is a Dart code snippet:\n```dart\nvoid main() {\n  print("Hello, world!");\n}\n```';
  List<String> extractedCode = Extract.codeSnippets(text, language: 'dart');
  // Result: ['void main() {\n  print("Hello, world!");\n}']
  ```

- **Return Value:**
    - A list containing the identified code snippets from the input `text`, optionally filtered by the specified programming `language`.

- **Note:**
    - The method retrieves code blocks encapsulated between triple backticks (` ``` `).
    - Specifying a programming language as an argument filters the extraction to code blocks of that specific language.
    - If `language` is not provided, all code snippets regardless of the language tag will be extracted.

- **Considerations:**
    - Ensure the accuracy of the language tag provided to accurately filter code snippets if required.

### unitsOfMeasurement

The `unitsOfMeasurement` method, within the `Extract` class, is designed to identify and extract various units of measurement from a given text.

- **Method Signature:**
  ```dart
  static List<String> unitsOfMeasurement(String text)
  ```

- **Parameters:**
    - `text`: The text containing units of measurement.

- **Description:**
  This method utilizes a regular expression to capture numerical values followed by units of measurement in a text. It aims to identify and extract strings representing measurements, such as "5 kg", "10 meters", "20°C", etc.

- **Usage:**
  ```dart
  String text = 'The parcel weighs about 5 kg and is 10 meters long.';
  List<String> extractedUnits = Extract.unitsOfMeasurement(text);
  ```

- **Example:**
  ```dart
  String text = 'The parcel weighs about 5 kg and is 10 meters long.';
  List<String> extractedUnits = Extract.unitsOfMeasurement(text);
  // Result: ['5 kg', '10 meters']
  ```

- **Return Value:**
    - A list containing identified strings representing units of measurement extracted from the input `text`.

- **Note:**
    - The method captures patterns that consist of a numerical value followed by a space and a unit of measurement.
    - Units might include but are not limited to length, weight, temperature, volume, etc.
    - The extracted units may contain numerical values along with various measurement units.

- **Considerations:**
    - The method assumes units are represented in a format where the numerical value is followed by the unit identifier without any special characters separating them.


### productCodesIDs

The `productCodesIDs` method, part of the `Extract` class, is designed to identify and extract product codes or IDs from a given text.

- **Method Signature:**
  ```dart
  static List<String> productCodesIDs(String text)
  ```

- **Parameters:**
    - `text`: The text containing product codes or IDs.

- **Description:**
  This method utilizes a regular expression to identify and extract alphanumeric strings that are typically used to represent product codes or identifiers. These codes generally consist of a sequence of uppercase letters and numbers.

- **Usage:**
  ```dart
  String text = 'The product code is ABC123XYZ456.';
  List<String> extractedCodes = Extract.productCodesIDs(text);
  ```

- **Example:**
  ```dart
  String text = 'The product code is ABC123XYZ456.';
  List<String> extractedCodes = Extract.productCodesIDs(text);
  // Result: ['ABC123XYZ456']
  ```

- **Return Value:**
    - A list containing identified alphanumeric strings representing product codes or IDs extracted from the input `text`.

- **Note:**
    - The method captures sequences of uppercase letters and numbers, usually of a specific length or more (6 characters or longer in this case), which commonly represent product codes or unique identifiers.
    - Adjustments to the regular expression pattern may be necessary to match specific formats or lengths of product codes.

- **Considerations:**
    - Ensure that the input text contains product codes or IDs in the specified format.
    - The method captures sequences consisting of uppercase letters and numbers without spaces or special characters.


### sentimentKeywords

The `sentimentKeywords` method, part of the `Extract` class, identifies specific sentiment-related keywords from a given text.

- **Method Signature:**
  ```dart
  static List<String> sentimentKeywords(String text)
  ```

- **Parameters:**
    - `text`: The text to be analyzed for sentiment-related keywords.

- **Description:**
  This method utilizes a regular expression to extract sentiment-associated words from the input text. It identifies words such as "good," "bad," "excellent," "poor," and "great," regardless of case sensitivity.

- **Usage:**
  ```dart
  String text = 'The product was excellent, but the service was poor.';
  List<String> extractedSentiments = Extract.sentimentKeywords(text);
  ```

- **Example:**
  ```dart
  String text = 'The product was excellent, but the service was poor.';
  List<String> extractedSentiments = Extract.sentimentKeywords(text);
  // Result: ['excellent', 'poor']
  ```

- **Return Value:**
    - A list containing identified sentiment-related keywords extracted from the input `text`.

- **Note:**
    - This method identifies specific words associated with sentiments like positive ("good," "excellent," "great") and negative ("bad," "poor").
    - The regular expression used is case insensitive to capture variations in letter case.

- **Considerations:**
    - Adjustments to the regular expression or keyword list may be necessary to capture a broader range of sentiments or specific words relevant to the analysis.
    - The method provides a quick way to identify basic sentiment-related terms but may not cover the entire spectrum of sentiment analysis.


### time

The `time` method, part of the `Extract` class, extracts time-related patterns from the provided text.

- **Method Signature:**
  ```dart
  static List<String> time(String text)
  ```

- **Parameters:**
    - `text`: The text to be scanned for time-related patterns.

- **Description:**
  This method uses a regular expression to identify time patterns in the input text. It captures time in 24-hour format (HH:MM) and optionally includes seconds (HH:MM:SS) within word boundaries.

- **Usage:**
  ```dart
  String text = 'The meeting is scheduled at 14:30. Please arrive on time.';
  List<String> extractedTimes = Extract.time(text);
  ```

- **Example:**
  ```dart
  String text = 'The meeting is scheduled at 14:30. Please arrive on time.';
  List<String> extractedTimes = Extract.time(text);
  // Result: ['14:30']
  ```

- **Return Value:**
    - A list containing identified time patterns extracted from the input `text`.

- **Note:**
    - The regular expression captures time representations adhering to the 24-hour clock format.
    - The method targets time patterns but doesn’t perform contextual validation or semantic understanding.

- **Considerations:**
    - Adjustments might be needed to capture specialized time formats or patterns specific to the use case.
    - The method offers a way to quickly extract time information but may require modifications for broader or more precise time pattern recognition.


### companyNames

The `companyNames` method, a part of the class or utility, aims to extract potential company names from the provided text.

- **Method Signature:**
  ```dart
  static List<String> companyNames(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential company names are to be identified.

- **Description:**
  This method employs a regular expression to identify sequences of words that potentially represent company names. It captures sequences that start with an uppercase letter, followed by one or more lowercase words, allowing spaces between words.

- **Usage:**
  ```dart
  String text = 'The meeting is with Acme Corporation and XYZ Enterprises.';
  List<String> extractedCompanies = theClass.companyNames(text);
  ```

- **Example:**
  ```dart
  String text = 'The meeting is with Acme Corporation and XYZ Enterprises.';
  List<String> extractedCompanies = theClass.companyNames(text);
  // Result: ['Acme Corporation', 'XYZ Enterprises']
  ```

- **Return Value:**
    - A list containing potential company names extracted from the input `text`.

- **Note:**
    - The regular expression pattern used is designed to capture basic company name structures but might need adjustments for specific naming conventions or edge cases.
    - This method focuses on identifying sequences of words that could represent company names based on initial capitalization and word boundaries.

- **Considerations:**
    - Specialized company name formats or unique cases might require modifications to the regular expression for improved accuracy.
    - This method provides a starting point for extracting potential company names but may not cover all variations or formats used in real-world text.


### jobTitles

The `jobTitles` method, part of the class or utility, is designed to extract potential job titles from the provided text.

- **Method Signature:**
  ```dart
  static List<String> jobTitles(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential job titles are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences of words that potentially represent job titles. It captures sequences that start with an uppercase letter, followed by one or more lowercase words, allowing spaces between words.

- **Usage:**
  ```dart
  String text = 'The team consists of a Software Engineer, Project Manager, and Designer.';
  List<String> extractedJobTitles = theClass.jobTitles(text);
  ```

- **Example:**
  ```dart
  String text = 'The team consists of a Software Engineer, Project Manager, and Designer.';
  List<String> extractedJobTitles = theClass.jobTitles(text);
  // Result: ['Software Engineer', 'Project Manager', 'Designer']
  ```

- **Return Value:**
    - A list containing potential job titles extracted from the input `text`.

- **Note:**
    - The regular expression pattern is designed to capture typical job title structures but might need adjustments for specific naming conventions or edge cases.
    - This method focuses on identifying sequences of words that could represent job titles based on initial capitalization and word boundaries.

- **Considerations:**
    - Specialized job title formats or unique cases might require modifications to the regular expression for improved accuracy.
    - This method serves as a starting point for extracting potential job titles but might not cover all variations or formats used in real-world text.


### vins

The `vins` method, part of the class or utility, is intended to extract Vehicle Identification Numbers (VINs) from the provided text.

- **Method Signature:**
  ```dart
  static List<String> vins(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential Vehicle Identification Numbers (VINs) are to be identified.

- **Description:**
  This method employs a regular expression to identify sequences of characters that adhere to the typical structure of a VIN. It captures sequences comprising 17 characters, excluding I, O, and Q, as per standard VIN patterns.

- **Usage:**
  ```dart
  String text = 'The VINs for the cars are ABCDEFG123456789 and XYZ9876543210HJK.';
  List<String> extractedVINs = theClass.vins(text);
  ```

- **Example:**
  ```dart
  String text = 'The VINs for the cars are ABCDEFG123456789 and XYZ9876543210HJK.';
  List<String> extractedVINs = theClass.vins(text);
  // Result: ['ABCDEFG123456789', 'XYZ9876543210HJK']
  ```

- **Return Value:**
    - A list containing potential Vehicle Identification Numbers (VINs) extracted from the input `text`.

- **Note:**
    - The regular expression pattern used is designed to capture sequences of 17 alphanumeric characters, excluding I, O, and Q, in accordance with typical VIN structures.
    - This method aims to identify sequences that fit the VIN pattern but might not perform VIN validation or ensure their authenticity.

- **Considerations:**
    - In specific cases or industries, VIN formats might vary or include additional characters. Adjust the regular expression accordingly for such scenarios.
    - This method provides a basic extraction of potential VINs based on their typical alphanumeric structure.


### twitterHandles

The `twitterHandles` method, a part of the class or utility, aims to extract potential Twitter handles from the provided text.

- **Method Signature:**
  ```dart
  static List<String> twitterHandles(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential Twitter handles are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the typical structure of Twitter handles. It captures sequences starting with '@' followed by alphanumeric characters or underscores.

- **Usage:**
  ```dart
  String text = 'Contact us via @example_handle or follow @the_twitter!';
  List<String> extractedHandles = theClass.twitterHandles(text);
  ```

- **Example:**
  ```dart
  String text = 'Contact us via @example_handle or follow @the_twitter!';
  List<String> extractedHandles = theClass.twitterHandles(text);
  // Result: ['@example_handle', '@the_twitter']
  ```

- **Return Value:**
    - A list containing potential Twitter handles extracted from the input `text`.

- **Note:**
    - The regular expression pattern is designed to capture sequences starting with '@' followed by alphanumeric characters or underscores, resembling typical Twitter handles.
    - This method aims to extract potential Twitter handles based on pattern matching but doesn't validate whether these sequences are actual Twitter handles.

- **Considerations:**
    - Twitter handles might have variations and special characters, which might require adjustments to the regular expression for better accuracy.
    - This method provides a basic extraction of potential Twitter handles based on their typical structure.

### youTubeVideoIDs

The `youTubeVideoIDs` method, a part of the class or utility, is aimed at extracting potential YouTube video IDs from the provided text.

- **Method Signature:**
  ```dart
  static List<String> youTubeVideoIDs(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential YouTube video IDs are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the typical structure of YouTube video IDs. It captures sequences following the patterns found in standard YouTube video URLs.

- **Usage:**
  ```dart
  String text = 'Check out this video: https://youtu.be/abcdefghijk';
  List<String> extractedVideoIDs = theClass.youTubeVideoIDs(text);
  ```

- **Example:**
  ```dart
  String text = 'Check out this video: https://youtu.be/abcdefghijk';
  List<String> extractedVideoIDs = theClass.youTubeVideoIDs(text);
  // Result: ['abcdefghijk']
  ```

- **Return Value:**
    - A list containing potential YouTube video IDs extracted from the input `text`.

- **Note:**
    - The regular expression pattern is designed to capture sequences following the patterns commonly found in YouTube video URLs, specifically 11-character video IDs.
    - This method aims to extract potential YouTube video IDs based on pattern matching but doesn't validate whether these sequences are actual YouTube video IDs.

- **Considerations:**
    - YouTube video IDs might occasionally deviate or include different characters or structures. Adjustments to the regular expression might be necessary for improved accuracy in handling variations.
    - This method provides a basic extraction of potential YouTube video IDs based on their typical structure.


### isbns

The `isbns` method, part of the class or utility, is intended to extract potential International Standard Book Numbers (ISBNs) from the provided text.

- **Method Signature:**
  ```dart
  static List<String> isbns(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential ISBNs are to be identified.

- **Description:**
  This method utilizes a complex regular expression to identify sequences that adhere to the typical structure of ISBNs. It captures sequences following various ISBN formats, including 10-digit and 13-digit ISBNs, with or without hyphens.

- **Usage:**
  ```dart
  String text = 'The ISBNs in the text are ISBN-13: 978-1-56619-909-4 and ISBN-10: 0-306-40615-2';
  List<String> extractedISBNs = theClass.isbns(text);
  ```

- **Example:**
  ```dart
  String text = 'The ISBNs in the text are ISBN-13: 978-1-56619-909-4 and ISBN-10: 0-306-40615-2';
  List<String> extractedISBNs = theClass.isbns(text);
  // Result: ['978-1-56619-909-4', '0-306-40615-2']
  ```

- **Return Value:**
    - A list containing potential International Standard Book Numbers (ISBNs) extracted from the input `text`.

- **Note:**
    - The regular expression pattern used is complex and designed to capture sequences that adhere to various ISBN formats, including hyphenated and non-hyphenated variations of 10-digit and 13-digit ISBNs.
    - This method aims to extract potential ISBNs based on pattern matching but doesn't validate whether these sequences are valid ISBNs or check their authenticity.

- **Considerations:**
    - ISBN formats might occasionally deviate or include different characters or structures. Modifications to the regular expression might be necessary for improved accuracy in handling variations.
    - This method provides a basic extraction of potential ISBNs based on their typical structure but might not cover all variations used in real-world text.


### htmlTagsAttributes

The `htmlTagsAttributes` method, part of the class or utility, aims to extract HTML tags with their attributes and content from the provided text.

- **Method Signature:**
  ```dart
  static List<String> htmlTagsAttributes(String text)
  ```

- **Parameters:**
    - `text`: The text in which HTML tags with attributes and content are to be identified.

- **Description:**
  This method utilizes a regular expression to identify HTML tags along with their attributes and content. It captures sequences that resemble valid HTML tags encompassing attributes and enclosed content.

- **Usage:**
  ```dart
  String text = '<p class="example">This is a paragraph.</p><div><span>Hello</span></div>';
  List<String> extractedHTML = theClass.htmlTagsAttributes(text);
  ```

- **Example:**
  ```dart
  String text = '<p class="example">This is a paragraph.</p><div><span>Hello</span></div>';
  List<String> extractedHTML = theClass.htmlTagsAttributes(text);
  // Result: ['<p class="example">This is a paragraph.</p>', '<div><span>Hello</span></div>']
  ```

- **Return Value:**
    - A list containing HTML tags along with their attributes and enclosed content extracted from the input `text`.

- **Note:**
    - The regular expression pattern used is designed to capture HTML tags with attributes and content based on common HTML syntax.
    - This method aims to extract HTML structures based on pattern matching but doesn't perform full HTML parsing or validation.

- **Considerations:**
    - Complex HTML structures or non-standard formats might not be accurately captured by this regular expression. Adjustments might be necessary for handling such cases.
    - This method provides a basic extraction of HTML tags with attributes and content based on typical HTML syntax.

### hexColorCodes

The `hexColorCodes` method, part of the class or utility, is intended to extract hexadecimal color codes from the provided text.

- **Method Signature:**
  ```dart
  static List<String> hexColorCodes(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential hexadecimal color codes are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the typical structure of hexadecimal color codes. It captures sequences starting with '#' followed by six characters representing hexadecimal digits (0-9, A-F, or a-f).

- **Usage:**
  ```dart
  String text = 'The colors used are #FF0000 (red) and #00FF00 (green).';
  List<String> extractedColors = theClass.hexColorCodes(text);
  ```

- **Example:**
  ```dart
  String text = 'The colors used are #FF0000 (red) and #00FF00 (green).';
  List<String> extractedColors = theClass.hexColorCodes(text);
  // Result: ['#FF0000', '#00FF00']
  ```

- **Return Value:**
    - A list containing potential hexadecimal color codes extracted from the input `text`.

- **Note:**
    - The regular expression pattern used is designed to capture sequences following the common structure of hexadecimal color codes, typically represented with a '#' followed by six characters of hexadecimal digits.
    - This method aims to extract potential hexadecimal color codes based on pattern matching but doesn't perform color validation or verification.

- **Considerations:**
    - Hexadecimal color codes might occasionally deviate or include different characters or structures. Adjustments to the regular expression might be necessary for improved accuracy in handling variations.
    - This method provides a basic extraction of potential hexadecimal color codes based on their typical structure.



### statisticalData

The `statisticalData` method, part of the class or utility, aims to identify statistical terms within the provided text.

- **Method Signature:**
  ```dart
  static List<String> statisticalData(String text)
  ```

- **Parameters:**
    - `text`: The text in which statistical terms are to be identified.

- **Description:**
  This method employs a regular expression to identify specific statistical terms such as 'mean', 'median', 'mode', or 'range' within the text.

- **Usage:**
  ```dart
  String text = 'The mean and median values were calculated for the dataset.';
  List<String> extractedStats = theClass.statisticalData(text);
  ```

- **Example:**
  ```dart
  String text = 'The mean and median values were calculated for the dataset.';
  List<String> extractedStats = theClass.statisticalData(text);
  // Result: ['mean', 'median']
  ```

- **Return Value:**
    - A list containing identified statistical terms extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures specific statistical terms such as 'mean', 'median', 'mode', or 'range' as defined within the method.

- **Considerations:**
    - For additional statistical terms or specific variations, modify the regular expression to encompass those terms.

---

### twiiterAndFacebookPostIDs

The `twiiterAndFacebookPostIDs` method, a part of the class or utility, is intended to extract post IDs from either Twitter or Facebook URLs based on the provided platform.

- **Method Signature:**
  ```dart
  static List<String> twiiterAndFacebookPostIDs(String text, String platform)
  ```

- **Parameters:**
    - `text`: The text in which post IDs are to be identified.
    - `platform`: A string specifying the platform ('Twitter' or 'Facebook') for extraction.

- **Description:**
  This method uses a regular expression to extract post IDs from either Twitter or Facebook URLs based on the specified platform.

- **Usage:**
  ```dart
  String text = 'Check out this post: https://twitter.com/user/status/1234567890';
  List<String> extractedIDs = theClass.twiiterAndFacebookPostIDs(text, 'Twitter');
  ```

- **Example:**
  ```dart
  String text = 'Check out this post: https://twitter.com/user/status/1234567890';
  List<String> extractedIDs = theClass.twiiterAndFacebookPostIDs(text, 'Twitter');
  // Result: ['1234567890']
  ```

- **Return Value:**
    - A list containing extracted post IDs from either Twitter or Facebook URLs based on the provided platform.

- **Note:**
    - The method distinguishes between Twitter and Facebook URLs based on the `platform` parameter and extracts the corresponding post IDs using distinct regular expression patterns for each platform.

- **Considerations:**
    - Ensure proper platform specification ('Twitter' or 'Facebook') to extract the relevant post IDs.


### employeeIDs

The `employeeIDs` method, a part of the class or utility, is designed to extract potential employee identification codes from the provided text.

- **Method Signature:**
  ```dart
  static List<String> employeeIDs(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential employee IDs are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the pattern of employee identification codes. It captures sequences comprising alphanumeric characters, typically five or more characters long.

- **Usage:**
  ```dart
  String text = 'The employee IDs are E12345, A987654, and X56789.';
  List<String> extractedIDs = theClass.employeeIDs(text);
  ```

- **Example:**
  ```dart
  String text = 'The employee IDs are E12345, A987654, and X56789.';
  List<String> extractedIDs = theClass.employeeIDs(text);
  // Result: ['E12345', 'A987654', 'X56789']
  ```

- **Return Value:**
    - A list containing potential employee identification codes extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences typically representing employee IDs based on their alphanumeric structure.

- **Considerations:**
    - Ensure that the pattern defined in the regular expression aligns with the specific format or structure of employee identification codes used in the context.

---

### bankAccountNumbers

The `bankAccountNumbers` method, a part of the class or utility, aims to extract potential bank account numbers from the provided text.

- **Method Signature:**
  ```dart
  static List<String> bankAccountNumbers(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential bank account numbers are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the pattern of bank account numbers. It captures sequences comprising 9 to 12 digits, representing potential bank account numbers.

- **Usage:**
  ```dart
  String text = 'Please verify account numbers: 123456789 and 9876543210.';
  List<String> extractedAccountNumbers = theClass.bankAccountNumbers(text);
  ```

- **Example:**
  ```dart
  String text = 'Please verify account numbers: 123456789 and 9876543210.';
  List<String> extractedAccountNumbers = theClass.bankAccountNumbers(text);
  // Result: ['123456789', '9876543210']
  ```

- **Return Value:**
    - A list containing potential bank account numbers extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences comprising digits typically representing bank account numbers, ranging from 9 to 12 digits in length.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of bank account numbers in the context.

### apiEndpoints

The `apiEndpoints` method, part of the class or utility, aims to extract potential API endpoints from the provided text.

- **Method Signature:**
  ```dart
  static List<String> apiEndpoints(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential API endpoints are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the structure of API endpoints. It captures sequences starting with '/' followed by alphanumeric characters, hyphens, and underscores.

- **Usage:**
  ```dart
  String text = 'The API endpoints are /users/get and /posts/all.';
  List<String> extractedEndpoints = theClass.apiEndpoints(text);
  ```

- **Example:**
  ```dart
  String text = 'The API endpoints are /users/get and /posts/all.';
  List<String> extractedEndpoints = theClass.apiEndpoints(text);
  // Result: ['/users/get', '/posts/all']
  ```

- **Return Value:**
    - A list containing potential API endpoints extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling API endpoints typically starting with a forward slash followed by alphanumeric characters, hyphens, and underscores.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of API endpoints in the context.

---

### osPaths

The `osPaths` method, part of the class or utility, is intended to extract potential operating system paths from the provided text.

- **Method Signature:**
  ```dart
  static List<String> osPaths(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential OS paths are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences resembling operating system paths. It captures sequences following the structure of a drive letter (e.g., C:) followed by a series of folders or files separated by backslashes.

- **Usage:**
  ```dart
  String text = 'The file paths are C:\\Users\\User\\Documents\\file.txt and D:\\Folder\\image.jpg.';
  List<String> extractedPaths = theClass.osPaths(text);
  ```

- **Example:**
  ```dart
  String text = 'The file paths are C:\\Users\\User\\Documents\\file.txt and D:\\Folder\\image.jpg.';
  List<String> extractedPaths = theClass.osPaths(text);
  // Result: ['C:\\Users\\User\\Documents\\file.txt', 'D:\\Folder\\image.jpg']
  ```

- **Return Value:**
    - A list containing potential operating system paths extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling OS paths, including drive letters followed by a series of folders or files separated by backslashes.

- **Considerations:**
    - Ensure the regular expression pattern accurately captures the structure of OS paths relevant to the system or environment.


### twitterAndFacebookPostContent

The `twitterAndFacebookPostContent` method, part of the class or utility, is intended to extract content related to Twitter or Facebook posts based on the provided platform.

- **Method Signature:**
  ```dart
  static List<String> twitterAndFacebookPostContent(String text, String platform)
  ```

- **Parameters:**
    - `text`: The text in which post content is to be identified.
    - `platform`: A string specifying the platform ('Twitter' or 'Facebook') for extraction.

- **Description:**
  This method uses a regular expression to extract post IDs from either Twitter or Facebook URLs based on the specified platform.

- **Usage:**
  ```dart
  String text = 'Check out this post: https://twitter.com/user/status/1234567890';
  List<String> extractedContent = theClass.twitterAndFacebookPostContent(text, 'Twitter');
  ```

- **Example:**
  ```dart
  String text = 'Check out this post: https://twitter.com/user/status/1234567890';
  List<String> extractedContent = theClass.twitterAndFacebookPostContent(text, 'Twitter');
  // Result: ['1234567890']
  ```

- **Return Value:**
    - A list containing extracted post IDs from either Twitter or Facebook URLs based on the provided platform.

- **Note:**
    - The method distinguishes between Twitter and Facebook URLs based on the `platform` parameter and extracts the corresponding post IDs using distinct regular expression patterns for each platform.

- **Considerations:**
    - Ensure proper platform specification ('Twitter' or 'Facebook') to extract the relevant post IDs.

---

### softwareVersionNumbers

The `softwareVersionNumbers` method, part of the class or utility, aims to extract potential software version numbers from the provided text.

- **Method Signature:**
  ```dart
  static List<String> softwareVersionNumbers(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential software version numbers are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the structure of software version numbers. It captures sequences consisting of digits separated by periods.

- **Usage:**
  ```dart
  String text = 'The software versions are 1.0, 2.3.4, and 5.6.7.8.';
  List<String> extractedVersions = theClass.softwareVersionNumbers(text);
  ```

- **Example:**
  ```dart
  String text = 'The software versions are 1.0, 2.3.4, and 5.6.7.8.';
  List<String> extractedVersions = theClass.softwareVersionNumbers(text);
  // Result: ['1.0', '2.3.4', '5.6.7.8']
  ```

- **Return Value:**
    - A list containing potential software version numbers extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling software version numbers, typically comprising digits separated by periods.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of software version numbers in the context.


### ordinalNumbers

The `ordinalNumbers` method, part of the class or utility, is aimed at extracting ordinal numbers from the provided text.

- **Method Signature:**
  ```dart
  static List<String> ordinalNumbers(String text)
  ```

- **Parameters:**
    - `text`: The text in which ordinal numbers are to be identified.

- **Description:**
  This method employs a regular expression to identify sequences that match the structure of ordinal numbers (e.g., first, second, third). It captures words representing ordinal positions in a case-insensitive manner.

- **Usage:**
  ```dart
  String text = 'The first, second, and third positions are important.';
  List<String> extractedOrdinals = theClass.ordinalNumbers(text);
  ```

- **Example:**
  ```dart
  String text = 'The first, second, and third positions are important.';
  List<String> extractedOrdinals = theClass.ordinalNumbers(text);
  // Result: ['first', 'second', 'third']
  ```

- **Return Value:**
    - A list containing identified ordinal numbers extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures words representing ordinal positions regardless of case sensitivity.

- **Considerations:**
    - Ensure the regular expression pattern aligns with the specific ordinal representations relevant to the use case.

---

### metaTags

The `metaTags` method, part of the class or utility, is designed to extract HTML meta tags from the provided text.

- **Method Signature:**
  ```dart
  static List<String> metaTags(String text)
  ```

- **Parameters:**
    - `text`: The text in which HTML meta tags are to be identified.

- **Description:**
  This method utilizes a regular expression to identify HTML meta tags within the text. It captures sequences resembling standard HTML meta tags.

- **Usage:**
  ```dart
  String text = '<meta charset="UTF-8"><meta name="description" content="Sample description">';
  List<String> extractedMetaTags = theClass.metaTags(text);
  ```

- **Example:**
  ```dart
  String text = '<meta charset="UTF-8"><meta name="description" content="Sample description">';
  List<String> extractedMetaTags = theClass.metaTags(text);
  // Result: ['<meta charset="UTF-8">', '<meta name="description" content="Sample description">']
  ```

- **Return Value:**
    - A list containing identified HTML meta tags extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling standard HTML meta tags.

- **Considerations:**
    - Ensure the regular expression accurately captures HTML meta tags based on the requirements and variations in their structure.


### stockTickerSymbols

The `stockTickerSymbols` method, part of the class or utility, aims to extract potential stock ticker symbols from the provided text.

- **Method Signature:**
  ```dart
  static List<String> stockTickerSymbols(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential stock ticker symbols are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the structure of stock ticker symbols. It captures sequences comprising 2 to 5 uppercase letters typically representing stock ticker symbols.

- **Usage:**
  ```dart
  String text = 'The stock symbols mentioned are AAPL, GOOGL, and TSLA.';
  List<String> extractedSymbols = theClass.stockTickerSymbols(text);
  ```

- **Example:**
  ```dart
  String text = 'The stock symbols mentioned are AAPL, GOOGL, and TSLA.';
  List<String> extractedSymbols = theClass.stockTickerSymbols(text);
  // Result: ['AAPL', 'GOOGL', 'TSLA']
  ```

- **Return Value:**
    - A list containing potential stock ticker symbols extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences typically representing stock ticker symbols based on their structure of 2 to 5 uppercase letters.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of stock ticker symbols in the context.

---

### hashValues

The `hashValues` method, part of the class or utility, aims to extract potential hash values from the provided text.

- **Method Signature:**
  ```dart
  static List<String> hashValues(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential hash values are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences resembling hash values. It captures sequences comprising 32, 40, or 64 characters of hexadecimal digits (0-9, A-F, or a-f).

- **Usage:**
  ```dart
  String text = 'The hash values found are A1B2C3... and 123abc...';
  List<String> extractedHashes = theClass.hashValues(text);
  ```

- **Example:**
  ```dart
  String text = 'The hash values found are A1B2C3... and 123abc...';
  List<String> extractedHashes = theClass.hashValues(text);
  // Result: ['A1B2C3...', '123abc...']
  ```

- **Return Value:**
    - A list containing potential hash values extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling hash values based on their lengths of 32, 40, or 64 characters of hexadecimal digits.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of hash values in the context.


### chemicalCompoundNames

The `chemicalCompoundNames` method, part of the class or utility, is designed to extract potential chemical compound names from the provided text.

- **Method Signature:**
  ```dart
  static List<String> chemicalCompoundNames(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential chemical compound names are to be identified.

- **Description:**
  This method employs a regular expression to identify sequences that match the structure of chemical compound names. It captures words typically starting with an uppercase letter followed by lowercase letters.

- **Usage:**
  ```dart
  String text = 'The chemical compounds include Water, Oxygen, and Hydrochloric acid.';
  List<String> extractedCompounds = theClass.chemicalCompoundNames(text);
  ```

- **Example:**
  ```dart
  String text = 'The chemical compounds include Water, Oxygen, and Hydrochloric acid.';
  List<String> extractedCompounds = theClass.chemicalCompoundNames(text);
  // Result: ['Water', 'Oxygen', 'Hydrochloric']
  ```

- **Return Value:**
    - A list containing potential chemical compound names extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences typically representing chemical compound names based on their structure starting with an uppercase letter followed by lowercase letters.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of chemical compound names in the context.

---

### mimeTypes

The `mimeTypes` method, part of the class or utility, aims to extract potential MIME types from the provided text.

- **Method Signature:**
  ```dart
  static List<String> mimeTypes(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential MIME types are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences resembling MIME types. It captures sequences consisting of letters, hyphens, and slashes in a specific format.

- **Usage:**
  ```dart
  String text = 'The MIME types detected are text/plain, image/jpeg, and application/json.';
  List<String> extractedMIMEs = theClass.mimeTypes(text);
  ```

- **Example:**
  ```dart
  String text = 'The MIME types detected are text/plain, image/jpeg, and application/json.';
  List<String> extractedMIMEs = theClass.mimeTypes(text);
  // Result: ['text/plain', 'image/jpeg', 'application/json']
  ```

- **Return Value:**
    - A list containing potential MIME types extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling MIME types based on their structure of letters, hyphens, and slashes in a specific format.

- **Considerations:**
    - Ensure the regular expression accurately captures MIME types based on the requirements and variations in their structure.


### httpStatusCodes

The `httpStatusCodes` method, part of the class or utility, aims to extract potential HTTP status codes from the provided text.

- **Method Signature:**
  ```dart
  static List<String> httpStatusCodes(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential HTTP status codes are to be identified.

- **Description:**
  This method employs a regular expression to identify sequences that match the structure of HTTP status codes. It captures three consecutive digits representing HTTP status codes.

- **Usage:**
  ```dart
  String text = 'The HTTP status codes returned were 200, 404, and 500.';
  List<String> extractedCodes = theClass.httpStatusCodes(text);
  ```

- **Example:**
  ```dart
  String text = 'The HTTP status codes returned were 200, 404, and 500.';
  List<String> extractedCodes = theClass.httpStatusCodes(text);
  // Result: ['200', '404', '500']
  ```

- **Return Value:**
    - A list containing potential HTTP status codes extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences comprising three consecutive digits representing HTTP status codes.

- **Considerations:**
    - Validate the accuracy of the regular expression pattern based on the specific structure or format of HTTP status codes in the context.

---

### coordinates

The `coordinates` method, part of the class or utility, is intended to extract potential geographical coordinates from the provided text.

- **Method Signature:**
  ```dart
  static List<String> coordinates(String text)
  ```

- **Parameters:**
    - `text`: The text in which potential coordinates are to be identified.

- **Description:**
  This method utilizes a regular expression to identify sequences resembling geographical coordinates. It captures numeric values potentially representing latitude and longitude coordinates with various formats.

- **Usage:**
  ```dart
  String text = 'The coordinates found were 40.7128° N, 74.0060° W and -33.8688° S, 151.2093° E.';
  List<String> extractedCoords = theClass.coordinates(text);
  ```

- **Example:**
  ```dart
  String text = 'The coordinates found were 40.7128° N, 74.0060° W and -33.8688° S, 151.2093° E.';
  List<String> extractedCoords = theClass.coordinates(text);
  // Result: ['40.7128° N', '74.0060° W', '-33.8688° S', '151.2093° E']
  ```

- **Return Value:**
    - A list containing potential geographical coordinates extracted from the input `text`.

- **Note:**
    - The regular expression pattern used captures sequences resembling latitude and longitude coordinates in various formats.

- **Considerations:**
    - Ensure the regular expression accurately captures geographical coordinates based on the requirements and variations in their formats.

### extractProgrammingKeywords

The `extractProgrammingKeywords` method, part of the class or utility, is designed to extract programming keywords from the provided text based on a specified programming language.

- **Method Signature:**
  ```dart
  static List<String> extractProgrammingKeywords(String text, String language)
  ```

- **Parameters:**
    - `text`: The text in which programming keywords are to be identified.
    - `language`: A string specifying the programming language ('Dart' or other) for keyword extraction.

- **Description:**
  This method utilizes a regular expression to identify sequences that match the provided programming language's keywords. It captures words representing programming language keywords in a case-insensitive manner.

- **Usage:**
  ```dart
  String text = 'The code snippet contains keywords like abstract, dynamic, and if.';
  List<String> extractedKeywords = theClass.extractProgrammingKeywords(text, 'Dart');
  ```

- **Example:**
  ```dart
  String text = 'The code snippet contains keywords like abstract, dynamic, and if.';
  List<String> extractedKeywords = theClass.extractProgrammingKeywords(text, 'Dart');
  // Result: ['abstract', 'dynamic', 'if']
  ```

- **Return Value:**
    - A list containing identified programming keywords extracted from the input `text` based on the specified programming language.

- **Note:**
    - The method distinguishes between programming languages via the `language` parameter and extracts corresponding keywords using a pre-defined list of keywords for each language.
    - The regular expression pattern used captures words representing programming language keywords in a case-insensitive manner.

- **Considerations:**
    - Ensure proper specification of the programming language ('Dart' or other) to extract the relevant keywords.
    - Modify the `keywordList` variable to include the complete list of keywords specific to each supported programming language.
