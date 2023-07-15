import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:translate/states/list_supported_lang.dart';
import 'package:translate/states/stt.dart';
import 'package:translate/states/swap_lang.dart';
import 'package:translate/pages/bottom_nav_pages/stt_language.dart';
import 'package:translate/utils/animate.dart';
import 'package:translate/utils/colors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator/translator.dart';
import 'dart:core';

class Conversation extends StatefulWidget {
  // final stt.SpeechToText speech;
  // final bool isInitialized;

  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  stt.SpeechToText speech = stt.SpeechToText();
  List<stt.LocaleName> locales = [];
  bool speechEnabled = false;
  bool isListening = false;
  String text = 'Press the button to start speak!';

  // this list is used to compare if that language is supported or not.
  List<String> langId = [
    'ar_AE',
    'cmn_CN',
    'en_US',
    'fil_PH',
    'fr_FR',
    'de_DE',
    'ja_JP',
    'ko_KR',
    'ru_RU',
    'es_ES',
  ];

  Map<String, String> convertLangStt = {
    'ar_AE': 'ar',
    'cmn_CN': 'zn-cn',
    'en_US': 'en',
    'fil_PH': 'tl',
    'fr_FR': 'fr',
    'de_DE': 'de',
    'ja_JP': 'ja',
    'ko_KR': 'ko',
    'ru_RU': 'ru',
    'es_ES': 'es',
  };

  // convert Stt language code so it can translate
  String convertStt(String text) {
    for (var entry in convertLangStt.entries) {
      if (entry.key == text) {
        return entry.value;
      }
    }
    return 'language not supported';
  }

  void stopListening() async {
    await speech.stop();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> initSpeech() async {
    bool success = await speech.initialize(
        onStatus: (String status) {
          if (status == 'done') {
            debugPrint("Status Done");
            stopListening();
          }
        },
        onError: (status) => debugPrint("$status"));
    List<stt.LocaleName> _locales = await speech.locales();
    // clear the list so everytime initialize the list dont have any duplicates
    SttSupportedLanguages.supLanguanges.clear();
    TranslateToLanguagesStt.languanges.clear();
    for (stt.LocaleName id in _locales) {
      if (langId.contains(id.localeId)) {
        debugPrint(id.localeId);
        debugPrint("Adding languages to the list!!");
        SttSupportedLanguages.supLanguanges.add(id);
        TranslateToLanguagesStt.languanges.add(id);
      }
    }
    speechEnabled = success;

    debugPrint('$speechEnabled');
  }

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  @override
  void dispose() {
    // Cancel any ongoing operations
    speech.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var swap = Provider.of<Swap>(context, listen: false);
    var textProvider = Provider.of<LanguagesSpokeStt>(context, listen: false);
    var transProvider = Provider.of<TranslatedText>(context, listen: false);

    return Container(
      color: const Color(0xff222831),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 10.w),
            child: Row(
              children: [
                SizedBox(
                  width: 140.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Do something when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => swap.touchState % 2 == 0
                              ? const ToLanguageStt()
                              : const SourceLanguageStt(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 14.0.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0.r),
                      ),
                      side: BorderSide.none,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                              Consumer3<LanguagesStt, TransLanguageStt, Swap>(
                            builder: (context, langData, transData, swapData,
                                child) {
                              return Text(
                                swapData.touchState % 2 == 0
                                    ? transData.langName
                                    : langData.langName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'gothic',
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 10.w),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0.r),
                      splashColor: Colors.black.withOpacity(0.3),
                      onTap: () {},
                      child: RotateSwapButton(
                        childWidget: Icon(
                          Icons.swap_horizontal_circle_outlined,
                          size: 35,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: SizedBox(
                    width: 140.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => swap.touchState % 2 == 0
                                ? const SourceLanguageStt()
                                : const ToLanguageStt(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w, vertical: 14.0.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0.r),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child:
                                Consumer3<TransLanguageStt, LanguagesStt, Swap>(
                              builder: (context, transData, langData, swapData,
                                  child) {
                                return Text(
                                  swapData.touchState % 2 == 0
                                      ? langData.langName
                                      : transData.langName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'gothic',
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 16.0.w),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                // --------------------------------------------------------
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.20),
            child: Container(
              width: 340.w,
              height: 290.h,
              decoration: BoxDecoration(
                color: const Color(0xff393E46),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Consumer<LanguagesSpokeStt>(
                builder: (context, data, child) {
                  return ListView.builder(
                    itemCount: data.containers.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Dismissible(
                          key: UniqueKey(),
                          child: data.containers[index],
                          onDismissed: (DismissDirection direction) {
                            data.removeContainer(index);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1.10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer4<LanguagesStt, TransLanguageStt, TranslatedText, Swap>(
                  builder:
                      (context, langstt, transStt, transText, swap, child) {
                    var fromLang = convertStt(swap.touchState % 2 == 0
                        ? transStt.langCode
                        : langstt.langCode);
                    var toLang = convertStt(swap.touchState % 2 == 0
                        ? langstt.langCode
                        : transStt.langCode);

                    Future<String> translate(String text) async {
                      final translator = GoogleTranslator();

                      var translation = await translator.translate(text,
                          from: fromLang, to: toLang);

                      transProvider.setText(translation.toString());

                      return translation.toString();
                    }

                    void listen() async {
                      //if (speechEnabled) {
                      //setState(() => isListening = true);

                      await speech.listen(
                        onResult: (val) async {
                          String translatedText =
                              await translate(val.recognizedWords);

                          Widget add = textProvider.createContainer(
                              val.recognizedWords,
                              translatedText.toString(),
                              toLang);
                          debugPrint(toLang);

                          textProvider.addContainer(add);
                          
                          DateTime timeNow = DateTime.now();
                          String date =
                              DateFormat('EEEE, MMM d, yyyy').format(timeNow);
                          final formatTime = DateFormat('h:mm a');
                          final time = formatTime.format(timeNow);
                          debugPrint('$date');
                          debugPrint('$time');

                          debugPrint(textProvider.words);
                        },
                        localeId: langstt.langCode,
                        listenMode: stt.ListenMode.dictation,
                        partialResults: false,
                        listenFor: const Duration(seconds: 5),
                      );
                      setState(() {});
                      // } else {
                      //   setState(() => isListening = false);
                      //   //speech.stop();
                      // }
                    }

                    return AvatarGlow(
                      animate: speech.isListening,
                      glowColor: Colors.grey,
                      endRadius: 75.0,
                      duration: const Duration(milliseconds: 1000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Button press logic
                            speech.isNotListening ? listen() : stopListening();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16),
                            backgroundColor: accent,
                          ),
                          child: Icon(
                              speech.isListening ? Icons.mic : Icons.mic_none),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
