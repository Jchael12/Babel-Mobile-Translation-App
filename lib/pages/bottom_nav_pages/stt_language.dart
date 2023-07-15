import 'package:flutter/material.dart';
import 'package:translate/states/list_supported_lang.dart';
import 'package:translate/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:translate/states/stt.dart';

class SourceLanguageStt extends StatefulWidget {
  const SourceLanguageStt({super.key});

  @override
  State<SourceLanguageStt> createState() => _SourceLanguageSttState();
}

class _SourceLanguageSttState extends State<SourceLanguageStt> {
  @override
  Widget build(BuildContext context) {
    var langStt = Provider.of<LanguagesStt>(context, listen: false);
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: SttSupportedLanguages.supLanguanges.length,
        itemBuilder: (BuildContext context, int index) {
          String localeName = SttSupportedLanguages.supLanguanges[index].name;
          String localeCode = SttSupportedLanguages.supLanguanges[index].localeId;
          return ListTile(
            title: Text(
              localeName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              localeCode,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // Do something when the user taps on a language
              langStt.setLangName(localeName);
              langStt.setLangCode(localeCode);
              debugPrint('Selected language name: ${langStt.langName}');
              debugPrint('Seclected language code: ${langStt.langCode}');
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

class ToLanguageStt extends StatefulWidget {
  const ToLanguageStt({super.key});

  @override
  State<ToLanguageStt> createState() => _ToLanguageSttState();
}

class _ToLanguageSttState extends State<ToLanguageStt> {
  @override
  Widget build(BuildContext context) {
    var stt = Provider.of<TransLanguageStt>(context, listen: false);
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: TranslateToLanguagesStt.languanges.length,
        itemBuilder: (BuildContext context, int index) {
          String localeName = TranslateToLanguagesStt.languanges[index].name;
          String localeCode =
              TranslateToLanguagesStt.languanges[index].localeId;
          return ListTile(
            title: Text(
              localeName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              localeCode,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // Do something when the user taps on a language
              stt.setLangName(localeName);
              stt.setLangCode(localeCode);
              // debugPrint('Selected language name: ${langStt.langName}');
              // debugPrint('Seclected language code: ${langStt.langCode}');
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
