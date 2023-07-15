import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/states/model.dart';
import 'package:translate/utils/colors.dart';

class CustomSearchContents extends SearchDelegate {
  final BuildContext scaffoldContext;
  final Map<String, GlobalKey> map;

  CustomSearchContents({required this.scaffoldContext, required this.map});

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
    final List<MapEntry<String, GlobalKey>> filteredResults = [];

    for (MapEntry<String, GlobalKey> e in map.entries) {
      if (e.key.toLowerCase().contains(query.toLowerCase())) {
        filteredResults.add(e);
      }
    }

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final MapEntry<String, GlobalKey> entry = filteredResults[index];
        return ListTile(
          title: Text(
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
    //var updateLang = Provider.of<SourceLanguageModel>(context, listen: false);

    var key = Provider.of<GetIndex>(context, listen: false);
    // Display suggestions based on query and perform the same logic above.
    // TODO: not sure if we need the buildResult, need to double check later.
    final List<MapEntry<String, GlobalKey>> filteredResults = [];

    for (MapEntry<String, GlobalKey> item in map.entries) {
      if (item.key.toLowerCase().contains(query.toLowerCase())) {
        filteredResults.add(item);
      }
    }

    return Container(
      color: darkColor,
      child: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          final MapEntry<String, GlobalKey> entry = filteredResults[index];
          return ListTile(
            title: Text(
              entry.key,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // updateLang.setText(entry.value);
              // updateLang.setLangCode(entry.key);

              // debugPrint(updateLang.getLangName);
              // debugPrint(updateLang.getLangCode);
              debugPrint("Beaches");
              
              key.setKey(entry.value);
              close(context, entry);
              // Navigator.pop(context);
              //Scrollable.ensureVisible(key1.currentContext!);
              Navigator.pop(scaffoldContext);
              Scrollable.ensureVisible(
                key.key!.currentContext!,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              );
            },
          );
        },
      ),
    );
  }
}

class ItemsSearch extends StatefulWidget {
  final Map<String, GlobalKey> map;
  const ItemsSearch({super.key, required this.map});

  @override
  State<ItemsSearch> createState() => _ItemsSearchState();
}

class _ItemsSearchState extends State<ItemsSearch> {
  @override
  Widget build(BuildContext context) {
    var key = Provider.of<GetIndex>(context, listen: false);
    Map<String, GlobalKey> customMap = widget.map;

    return Builder(builder: (BuildContext scaffoldContext) {
      return Scaffold(
        backgroundColor: darkColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchContents(scaffoldContext: scaffoldContext, map: customMap),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: widget.map.length,
          itemBuilder: (BuildContext context, int index) {
            String name = widget.map.keys.elementAt(index);
            // ignore: no_leading_underscores_for_local_identifiers
            GlobalKey _key = widget.map.values.elementAt(index);
            return ListTile(
              title: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'gothic',
                ),
              ),
              onTap: () {
                key.setKey(_key);
                Scrollable.ensureVisible(
                  key.key!.currentContext!,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                );
                Navigator.pop(context);
              },
            );
          },
        ),
      );
    });
  }
}