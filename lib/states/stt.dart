// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/utils/colors.dart';

class LanguagesStt extends ChangeNotifier {
  String localeName = 'English';
  String localeCode = 'en_US';

  String get langName => localeName;
  String get langCode => localeCode;

  void setLangName(String name) {
    localeName = name;
    notifyListeners();
  }

  void setLangCode(String code) {
    localeCode = code;
    notifyListeners();
  }
}

class TranslatedText extends ChangeNotifier {
  String _translatedText = '';

  String get translatedText => _translatedText;

  void setText(var text) {
    _translatedText = text;
    notifyListeners();
  }
}

class TransLanguageStt extends ChangeNotifier {
  String _langName = 'Filipino';
  String _langCode = 'fil_PH';

  String get langName => _langName;
  String get langCode => _langCode;

  void setLangName(String name) {
    _langName = name;
    notifyListeners();
  }

  void setLangCode(String code) {
    _langCode = code;
    notifyListeners();
  }
}

class LanguagesSpokeStt extends ChangeNotifier {
  String receivedWords = '';

  List<Widget> containers = [];
  List<Widget> history = [];

  String get words => receivedWords;

  void setWords(String words) {
    receivedWords = words;
    notifyListeners();
  }

  Map<String, String> convertLangTts = {
    'en': 'en-US',
    'tl': 'fil-PH',
    'ja': 'ja-JP',
    'ko': 'ko-KR',
    'zn-cn': 'zn-CN'
  };

  String convertTts(String text){
    for (var entry in convertLangTts.entries) {
      if (entry.key == text) {
        return entry.value;
      }
    }
    return 'language not supported';
  }

  speak(String text, String code) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = code;
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {});

    if (!languages.contains(selectedLanguage)) {
      // Language not supported
      debugPrint("Selected language is not supported on this device");
      return;
    } else {
      flutterTts.setLanguage(selectedLanguage);
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }
  }

  Widget createContainer(String text, String translatedText, String code) {
    return Container(
      //padding: const EdgeInsets.all(12),
      height: 120.h,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () async {
                  debugPrint(code);
                  var getCode = convertTts(code);
                  debugPrint(getCode);
                  speak(translatedText, getCode);
                },
                icon: const Icon(Icons.volume_down_rounded),
                iconSize: 30,
                color: const Color(0xff35bbca),
                splashRadius: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_outline_rounded),
                iconSize: 28,
                color: const Color(0xff35bbca),
                splashRadius: 5,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xffEEEEEE),
                      fontFamily: 'gothic',
                      fontSize: 16.sp,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translatedText,
                    style: TextStyle(
                      color: const Color(0xffEEEEEE),
                      fontFamily: 'gothic',
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addContainer(Widget container) {
    containers.insert(0, container);
    history.insert(0, container);
    notifyListeners();
  }

  void removeContainer(int index) {
    containers.removeAt(index);
    notifyListeners();
  }

  void removeItemHistory(int index) {
    history.removeAt(index);
    notifyListeners();
  }
}
