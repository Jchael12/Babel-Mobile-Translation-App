// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateCulture = {
  'brandenburg gate': false,
  'cologne cathedral': false,
  "neuschwanstein castle": false,
  "the berlin wall memorial": false,
  'romantic road': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapCultures = {
  'Brandenburg Gate': key1,
  'Cologne Cathedral': key2,
  'Neuschwanstein Castle': key3,
  'The Berlin Wall Memorial': key4,
  'Romatic Road': key5
};

class GCultures extends StatefulWidget {
  const GCultures({super.key});

  @override
  State<GCultures> createState() => _GCulturesState();
}

class _GCulturesState extends State<GCultures> {
  final ScrollController scrollController = ScrollController();
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  late FlutterTts flutterTts;

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

  Future speak(String text) async {
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateCulture['brandenburg gate'] = false;
        iconStateCulture['cologne cathedral'] = false;
        iconStateCulture['neuschwanstein castle'] = false;
        iconStateCulture['the berlin wall memorial'] = false;
        iconStateCulture['romantic road'] = false;
      });
    });

    if (!languages.contains(selectedLanguage)) {
      // Language not supported
      debugPrint("Selected language is not supported on this device");
      return;
    } else {
      flutterTts.setLanguage(selectedLanguage);
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }
    setState(() {
      isSpeakingCompleted = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ItemsSearch(map: searchMapCultures)),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
            backgroundColor: accent,
            leading: const LeadingWidget(),
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/Cultural/CAC.png',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "C U L T U R A L",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gothic',
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapCultures['Brandenburg Gate'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 525.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Cultural/BRANDENBURG.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 200.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Brandenburg Gate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateCulture['brandenburg gate'] = true;
                                });
                                await speak('Brandenburg Gate');
                              },
                              icon: !iconStateCulture['brandenburg gate']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "The Brandenburg Gate (German: Brandenburger Tor [ˈbʁandn̩ˌbʊʁɡɐ ˈtoːɐ̯] (listen)) is an 18th-century neoclassical monument in Berlin, built on the orders of Prussian king Frederick William II after restoring the Orangist power by suppressing the Dutch popular unrest.[1] One of the best-known landmarks of Germany, it was built on the site of a former city gate that marked the start of the road from Berlin to the town of Brandenburg an der Havel, which used to be the capital of the Margraviate of Brandenburg.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapCultures['Cologne Cathedral'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 550.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Cultural/COLOGNE.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cologne Cathedral',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateCulture['cologne cathedral'] = true;
                                });
                                await speak('Cologne Cathedral');
                              },
                              icon: !iconStateCulture['cologne cathedral']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Cologne Cathedral (German: Kölner Dom, pronounced [ˌkœlnɐ ˈdoːm] (listen), officially Hohe Domkirche Sankt Petrus, English: Cathedral Church of Saint Peter) is a cathedral in Cologne, North Rhine-Westphalia belonging to the Catholic Church. It is the seat of the Archbishop of Cologne and of the administration of the Archdiocese of Cologne. It is a renowned monument of German Catholicism and Gothic architecture and was declared a World Heritage Site[4] in 1996.[5] It is Germany's most visited landmark, attracting an average of 20,000 people a day.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapCultures['Neuschwanstein Castle'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 500.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Cultural/NEUSCHWANSTEIN.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Neuschwanstein Castle',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateCulture['neuschwanstein castle'] = true;
                                });
                                await speak('Neuschwanstein Castle');
                              },
                              icon: !iconStateCulture['neuschwanstein castle']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Neuschwanstein Castle (German: Schloss Neuschwanstein, pronounced [ˈʃlɔs nɔʏˈʃvaːnʃtaɪn]; Southern Bavarian: Schloss Neischwanstoa) is a 19th-century historicist palace on a rugged hill of the foothills of the Alps in the very south of Germany, just north of Austria. It is located in the Swabia region of Bavaria, in the municipality of Schwangau, above the incorporated village of Hohenschwangau, which is also the location of Hohenschwangau Castle. The closest larger town is Füssen. The castle stands above the narrow gorge of the Pöllat [de] stream, east of the Alpsee and Schwansee lakes, close to the mouth of the Lech into Forggensee.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapCultures['The Berlin Wall Memorial'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 525.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Cultural/BERLINWALL.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'The Berlin Wall Memorial',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateCulture['the berlin wall memorial'] = true;
                                });
                                await speak('The Berlin Wall Memorial');
                              },
                              icon: !iconStateCulture['the berlin wall memorial']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "The Gedenkstätte Berliner Mauer (Berlin Wall Memorial) commemorates the division of Berlin by the Berlin Wall and the deaths that occurred there. The monument was created in 1998 by the Federal Republic of Germany and the Federal State of Berlin. It is located on Bernauer Straße at the corner of Ackerstraße and includes a Chapel of Reconciliation, the Berlin Wall Documentation Centre, a 60-metre (200 ft) section of the former border, a window of remembrance and a visitor center.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapCultures['The Romantic Road'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 550.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Cultural/ROMANTIC.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 200.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'The Romantic Road',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateCulture['romantic road'] = true;
                                });
                                await speak('The Romantic Road');
                              },
                              icon: !iconStateCulture['romantic road']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          'The Romantic Road (German: Romantische Straße) is a "theme route" devised by promotion-minded travel agents in the 1950s. It describes the 460 kilometres (290 mi) of surface roads between Würzburg and Füssen in southern Germany, specifically in Bavaria and Baden-Württemberg, linking a number of picturesque towns and castles. In medieval times, part of it was a trade route that connected the center of Germany with the south.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
