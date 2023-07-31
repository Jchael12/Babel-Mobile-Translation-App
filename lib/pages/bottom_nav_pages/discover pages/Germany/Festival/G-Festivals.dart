// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFestival = {
  'oktoberfest': false,
  'christmas markets': false,
  'carnival': false,
  'rhein in flammen': false,
  'berlin international film festival': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFestivals = {
  'Oktoberfest': key1,
  'Christmas Markets': key2,
  'Carnival': key3,
  'Rhein in Flammen': key4,
  'Berlin International Film Festival': key5,
};

class GFestivals extends StatefulWidget {
  const GFestivals({super.key});

  @override
  State<GFestivals> createState() => _GFestivalsState();
}

class _GFestivalsState extends State<GFestivals> {
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
        iconStateFestival['oktoberfest'] = false;
        iconStateFestival['christmas markets'] = false;
        iconStateFestival['carnival'] = false;
        iconStateFestival['rhein in flammen'] = false;
        iconStateFestival['berlin international film festival'] = false;
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
                            ItemsSearch(map: searchMapFestivals)),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
            backgroundColor: accent,
            leading: const LeadingWidget(),
            expandedHeight: 250.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/Festival/festival_bg.jpg',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "F E S T I V A L S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gothic',
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
          ),
          //sliver items

          SliverToBoxAdapter(
            key: searchMapFestivals['Oktoberfest'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 680.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Festival/OG.jpg',
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
                                  'Oktoberfest',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['oktoberfest'] = true;
                                    });
                                    await speak('Oktoberfest');
                                  },
                                  icon: !iconStateFestival['oktoberfest']!
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
                              "Oktoberfest (German pronunciation: [ɔkˈtoːbɐˌfɛst]; Bavarian: Wiesn, Oktobafest) is the world's largest Volksfest, featuring a beer festival and a travelling carnival. It is held annually in Munich, Bavaria, running from mid- or late-September to around the first Sunday in October, with more than six million international and national visitors attending the event. Locally, it is called d'Wiesn, after the colloquial name for the fairgrounds, Theresienwiese. Oktoberfest is an important part of Bavarian culture, having been held since the year 1810.",
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
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            key: searchMapFestivals['Christmas Markets'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 595.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Festival/CHRISTMAS.jpg',
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
                                  'Christmas Markets',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['christmas markets'] = true;
                                    });
                                    await speak('Christmas Market');
                                  },
                                  icon: !iconStateFestival['christmas markets']!
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
                              'A Christmas market, also known as Christkindlmarkt (literally: Christ Child Market, but the term "Christkind" usually refers to an angel-like "spirit of Christmas" rather than literally the Christ Child), Christkindlesmarkt, Christkindlimarkt, and Weihnachtsmarkt, is a street market associated with the celebration of Christmas during the four weeks of Advent.[1] These markets originated in Germany, but are now held in many countries.[2] Some in the U.S. have adapted the name to the quasi-German Christkindlmarket, substituting market for German Market.',
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
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            key: searchMapFestivals['Carnival'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 565.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Festival/CARNIVAL.jpg',
                                fit: BoxFit.cover,
                                width: 400.w,
                                height: 260.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Carnival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      iconStateFestival['carnival'] = true;
                                    });
                                    await speak('Carnival');
                                  },
                                  icon: !iconStateFestival['carnival']!
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
                              "A variety of customs and traditions are associated with Carnival celebrations in the German-speaking countries of Germany, Switzerland and Austria. They can vary considerably from country to country, but also from one small region to another. This is reflected in the various names given to these festivities occurring before Lent.",
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
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            key: searchMapFestivals['Rhein in Flammen'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 625.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Festival/RHEN.jpg',
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
                                  'Rhein in Flammen',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      iconStateFestival['rhein in flammen'] = true;
                                    });
                                    await speak('Rhein in Flammen');
                                  },
                                  icon: !iconStateFestival['rhein in flammen']!
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
                              'Rhein in Flammen (English: "Rhine in Flames") is the name of five different firework displays along the river Rhine in Germany. The displays take place annually, at various locations along the river. On the five different dates, brightly illuminated ships sail the river in an evening convoy for their passengers to see the full firework display at each location of the river. The firework displays are started when the ships arrive. During the firework displays in St. Goar and St. Goarshausen, the convoy waits statically between the two castles Burg Maus and Burg Rheinfels. On the river banks wine festivals take place that attract hundreds of thousands of visitors every year.',
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
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            key: searchMapFestivals['berlin international film festival'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 575.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Festival/BERLINALE.jpg',
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
                                  'Berlin International Film Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['berlin international film festival'] = true;
                                    });
                                    await speak('Berlin International Film Festival');
                                  },
                                  icon: !iconStateFestival['berlin international film festival']!
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
                              'The Berlin International Film Festival (German: Internationale Filmfestspiele Berlin), usually called the Berlinale (German pronunciation: [bɛʁliˈnaːlə] (listen)), is a major international film festival held annually in Berlin, Germany. Founded in 1951 and originally run in June, the festival has been held every February since 1978 and is one of Europe "Big Three" film festivals alongside the Venice Film Festival held in Italy and the Cannes Film Festival held in France. Furthermore, it is one of the "Big Five", the most prestigious film festivals in the world. The festival regularly draws tens of thousands of visitors each year.',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
