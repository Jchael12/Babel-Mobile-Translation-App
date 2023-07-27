import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translate/states/stt.dart';
import 'package:translate/states/user_model.dart';
import 'package:translate/utils/colors.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String id = '';
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  late FlutterTts flutterTts;

  Map<String, String> convertLangTts = {
    'en_US': 'en-US',
    'fil_PH': 'fil-PH',
    'ja_JP': 'ja-JP',
    'ko_KR': 'ko-KR',
    'cmn_CN': 'zn-CN',
    'ar_AE': 'ar',
    'fr_FR': 'fr-FR',
    'es_ES': 'es-ES',
    'ru_RU': 'ru-RU',
    'de_DE': 'de-DE',
  };

  String convertTts(String text) {
    for (var entry in convertLangTts.entries) {
      if (entry.key == text) {
        return entry.value;
      }
    }
    return 'language not supported';
  }

  void initTts() {
    flutterTts = FlutterTts();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future speak(String text, String code) async {
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
    setState(() {});
  }

  Stream<List<User>> readUser() {
    if (id.isEmpty) {
      // Return an empty stream or handle the situation appropriately.
      print('id is empty');
      return Stream.value([]);
    } else {
      print('id is not empty ${id}');
      return FirebaseFirestore.instance.collection(id).snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
    }
  }

  Widget buildUser(User user) => Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff393E46),
            ),
            child: Container(
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
                      Consumer<TransLanguageStt>(
                        builder: (context, stt, child) {
                          return IconButton(
                            onPressed: () async {
                              debugPrint(stt.langCode);
                              var code = convertTts(stt.langCode);
                              print('This is the code from history $code');
                              await speak(user.translatedText, code);
                            },
                            icon: const Icon(Icons.volume_down_rounded),
                            iconSize: 30,
                            color: const Color(0xff35bbca),
                            splashRadius: 5,
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Date and Time"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                              //contentPadding: EdgeInsets.all(16),
                              content: Text(
                                "${user.date} \n${user.time}",
                                style: TextStyle(fontFamily: 'gothic'),
                              ),
                            ),
                          );
                        },
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
                            user.text,
                            style: TextStyle(
                              color: const Color(0xffEEEEEE),
                              fontFamily: 'gothic',
                              fontSize: 16.sp,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user.translatedText,
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
            ),
          )
        ],
      );

  getData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString('id');
      if (data != null) {
        setState(() {
          id = data;
        });
        print("[SUCCESS] Retrieved ID from SharedPreferences: $id");
      } else {
        print(
            "[FAILED] Failed to retrieve ID from SharedPreferences. Data is null.");
      }
    } catch (e) {
      print("[ERROR]: Retrieving data from sharedpreferences $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    initTts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: darkColor,
      child: StreamBuilder<List<User>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            final contents = user.map(buildUser).toList();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: contents.reversed.toList(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
