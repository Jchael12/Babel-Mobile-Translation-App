import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListLanguage {
  static final langs = {
    'Automatic': 'auto',
    'Arabic': 'ar',
    'Chinese (Simplified)': 'zh-cn',
    'Chinese (Traditional)': 'zh-tw',
    'English': 'en',
    'Filipino': 'tl',
    'French': 'fr',
    'German': 'de',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Russian': 'ru',
    'Spanish': 'es'
  };
}

class TranslateToLanguages {
  static final tLangs = {
    'Automatic': 'auto',
    'Arabic': 'ar',
    'Chinese (Simplified)': 'zh-cn',
    'Chinese (Traditional)': 'zh-tw',
    'English': 'en',
    'Filipino': 'tl',
    'French': 'fr',
    'German': 'de',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Russian': 'ru',
    'Spanish': 'es'
  };
}

// speech section

class SttSupportedLanguages {
  static List<stt.LocaleName> supLanguanges = [];
}

class TranslateToLanguagesStt {
  static List<stt.LocaleName> languanges = [];
}
