import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListLanguage {
  static final langs = {
    'Automatic': 'auto',
    'Chinese (Simplified)': 'zh-cn',
    'Chinese (Traditional)': 'zh-tw',
    'English': 'en',
    'Filipino': 'tl',
    'Japanese': 'ja',
    'Korean': 'ko',
  };
}

class TranslateToLanguages {
  static final tLangs = {
    'Automatic': 'auto',
    'Chinese (Simplified)': 'zh-cn',
    'Chinese (Traditional)': 'zh-tw',
    'English': 'en',
    'Filipino': 'tl',
    'Japanese': 'ja',
    'Korean': 'ko',
  };
}

// speech section

class SttSupportedLanguages {
  static List<stt.LocaleName> supLanguanges = [];
}

class TranslateToLanguagesStt {
  static List<stt.LocaleName> languanges = [];
}
