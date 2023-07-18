import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/states/list_supported_lang.dart';
import 'package:translate/states/model.dart';
import 'package:translate/utils/colors.dart';

class SourceLanguage extends StatefulWidget {
  const SourceLanguage({super.key});

  @override
  State<SourceLanguage> createState() => _SourceLanguage();
}

class _SourceLanguage extends State<SourceLanguage> {
  @override
  Widget build(BuildContext context) {
    var sourceLang = Provider.of<SourceLanguageModel>(context, listen: false);

    return Builder(builder: (BuildContext scaffoldContext) {
      return Scaffold(
        backgroundColor: darkColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearch(scaffoldContext),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: ListLanguage.langs.values.length,
          itemBuilder: (BuildContext context, int index) {
            String langCode = ListLanguage.langs.values.elementAt(index);
            String langName = ListLanguage.langs.keys.elementAt(index);
            return ListTile(
              title: Text(
                langName,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'gothic',
                ),
              ),
              subtitle: Text(
                langCode,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'gothic',
                ),
              ),
              onTap: () {
                // Do something when the user taps on a language
                sourceLang.setText(langName);
                sourceLang.setLangCode(langCode);
                Navigator.pop(context);
                debugPrint('Language code - ${sourceLang.getLangName}');
                debugPrint('Language code - ${sourceLang.getLangCode}');
              },
            );
          },
        ),
      );
    });
  }
}

class LanguagesToTranslate extends StatefulWidget {
  const LanguagesToTranslate({super.key});

  @override
  State<LanguagesToTranslate> createState() => _LanguagesToTranslateState();
}

class _LanguagesToTranslateState extends State<LanguagesToTranslate> {
  @override
  Widget build(BuildContext context) {
    var translated =
        Provider.of<TranslatedLanguageModel>(context, listen: false);

    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: TranslateToLanguages.tLangs.values.length,
        itemBuilder: (BuildContext context, int index) {
          String langCode = TranslateToLanguages.tLangs.values.elementAt(index);
          String langName = TranslateToLanguages.tLangs.keys.elementAt(index);
          return ListTile(
            title: Text(
              langName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              langCode,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // Do something when the user taps on a language
              translated.setText(langName);
              translated.setLangCode(langCode);
              Navigator.pop(context);
              debugPrint('Language code - ${translated.getLangName}');
              debugPrint('Language code - ${translated.getLangCode}');
            },
          );
        },
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final BuildContext scaffoldContext;
  CustomSearch(this.scaffoldContext);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Perform search logic here with query
    final List<MapEntry<String, String>> filteredResults = [];

    for (MapEntry<String, String> e in ListLanguage.langs.entries) {
      if (e.value.toLowerCase().contains(query.toLowerCase()) ||
          e.key.toLowerCase().contains(query.toLowerCase())) {
        filteredResults.add(e);
      }
    }

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final MapEntry<String, String> entry = filteredResults[index];
        return ListTile(
          title: Text(
            entry.value,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'gothic',
            ),
          ),
          subtitle: Text(
            entry.key,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'gothic',
            ),
          ),
          onTap: () {
            close(context, entry);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var updateLang = Provider.of<SourceLanguageModel>(context, listen: false);
    // Display suggestions based on query and perform the same logic above.
    final List<MapEntry<String, String>> filteredResults = [];

    for (MapEntry<String, String> item in ListLanguage.langs.entries) {
      if (item.value.toLowerCase().contains(query.toLowerCase()) ||
          item.key.toLowerCase().contains(query.toLowerCase())) {
        filteredResults.add(item);
      }
    }

    return Container(
      color: darkColor,
      child: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          final MapEntry<String, String> entry = filteredResults[index];
          return ListTile(
            title: Text(
              entry.key,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              entry.value,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              updateLang.setText(entry.key);
              updateLang.setLangCode(entry.value);

              debugPrint(updateLang.getLangName);
              debugPrint(updateLang.getLangCode);
              close(context, entry);
              Navigator.pop(scaffoldContext);
            },
          );
        },
      ),
    );
  }
}
