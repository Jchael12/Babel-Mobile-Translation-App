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
  'dubai shopping festival': false,
  'eid al-fitr': false,
  'uae national day': false,
  'sharjah light festival': false,
  'sheikh zayed heritage festival': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFestivals = {
  'Dubai Shopping Festival': key1,
  'Eid Al-fitr': key2,
  'Uae National Day': key3,
  'Sharjah Light Festival': key4,
  'Sheikh Zayed Heritage Festival': key5,
};

class UAFestivals extends StatefulWidget {
  const UAFestivals({super.key});

  @override
  State<UAFestivals> createState() => _UAFestivalsState();
}

class _UAFestivalsState extends State<UAFestivals> {
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
        iconStateFestival['dubai shopping festival'] = false;
        iconStateFestival['eid al-fitr'] = false;
        iconStateFestival['uae national day'] = false;
        iconStateFestival['sharjah light festival'] = false;
        iconStateFestival['sheikh zayed heritage festival'] = false;
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
            key: searchMapFestivals['Dubai Shopping Festival'],
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
                                'assets/Festival/SHOPPING.jpg',
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
                                  'Dubai Shopping Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['dubai shopping festival'] = true;
                                    });
                                    await speak('Dubai Shopping Festival');
                                  },
                                  icon: !iconStateFestival['dubai shopping festival']!
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
                              "Dubai Shopping Festival (DSF; Arabic: مهرجان دبي للتسوق, romanized: Mahrajan Dubayy lil-tasawoq) is an annual month long event put together by the Dubai Festivals & Retail Establishment (DFRE), which is a part of Dubai's department of tourism.[1] During the festival, shops offer discounts on their merchandise, daily car raffles and prize drawings are held to win items such as gold and cars, and there is a fireworks display. There are also a range of family activities and live shows that take place throughout Dubai.",
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
            key: searchMapFestivals['Eid Al-fitr'],
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
                                'assets/Festival/EID.jpg',
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
                                  'Eid Al-fitr',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['eid al-fitr'] = true;
                                    });
                                    await speak('Eid Al-fitr');
                                  },
                                  icon: !iconStateFestival['eid al-fitr']!
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
                              "Eid al-Fitr (/ˌiːd əl ˈfɪtər, -trə/; Arabic: عيد الفطر, romanized: ʿĪd al-Fiṭr, lit. 'Holiday of Breaking the Fast', IPA: [ʕiːd æl ˈfɪtˤr]) is the earlier of the two official holidays celebrated within Islam (the other being Eid al-Adha). While the Qur'an does not mention the celebration of Eid, the religious holiday of Eid al-Fitr is celebrated by Muslims worldwide because it marks the end of the month-long dawn-to-sunset fasting of Ramadan. Some Muslims, however, do not view it as a sacred holiday.",
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
            key: searchMapFestivals['Uae National Day'],
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
                                'assets/Festival/UAEDAY.jpg',
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
                                  'Uae National Day',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      iconStateFestival['uae national day'] = true;
                                    });
                                    await speak('Uae National Day');
                                  },
                                  icon: !iconStateFestival['uae national day']!
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
                              "The UAE National Day stands for the nationalisation of the British Protectorate Treaties, which were declared in 1968, and also falls on the anniversary of the federal unification of the six emirates (seven in 1972 after Ras Al Khaimah joined) in 1971 which combined to form the modern-day country, headed by Sheikh Zayed bin Sultan Al Nahyan, the federation's first president. Recently, the UAE National Day has been combined with the Emirati Martyrs' Day that is on November 30th.",
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
            key: searchMapFestivals['Sharjah Light Festival'],
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
                                'assets/Festival/SHARJAHLIGHT.jpg',
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
                                  'Sharjah Light Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      iconStateFestival['sharjah light festival'] = true;
                                    });
                                    await speak('Sharjah Light Festival');
                                  },
                                  icon: !iconStateFestival['sharjah light festival']!
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
                              "The Sharjah Light Festival (SLF) is a cultural extravaganza that takes place annually in the Emirate of Sharjah, United Arab Emirates. The festival was first established in 2010 under the patronage of His Highness Sheikh Dr. Sultan bin Muhammad Al Qasimi, Member of the Supreme Council and Ruler of Sharjah, and has since become an integral part of the city's cultural landscape",
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
            key: searchMapFestivals['Sheikh Zayed Heritage Festival'],
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
                                'assets/Festival/ZAYEDHERITAGE.jpg',
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
                                  'Sheikh Zayed Heritage Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['sheikh zayed heritage festival'] = true;
                                    });
                                    await speak('Sheikh Zayed Heritage Festival');
                                  },
                                  icon: !iconStateFestival['sheikh zayed heritage festival']!
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
                              "Sheikh Zayed Festival 2023 brings thrilling experiences and unforgettable moments with its varied range of events and activities. This season, Sheikh Zayed Festival has the slogan “UAE: Uniting Civilizations”, which is reflected by the involvement of numerous different cultures from around the world.",
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
