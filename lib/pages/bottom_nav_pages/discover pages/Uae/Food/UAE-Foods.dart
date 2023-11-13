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

Map<String, bool> iconStateFood = {
  'al harees': false,
  'falafel': false,
  'machboos': false,
  'shawarma': false,
  'umm ali': false,
};

final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFoods = {
  'Al Harees': key1,
  'Falafel': key2,
  'Macboos': key3,
  'Shawarma': key4,
  'Umm Ali': key5,
};

class UAFoods extends StatefulWidget {
  const UAFoods({super.key});

  @override
  State<UAFoods> createState() => _UAFoodsState();
}

class _UAFoodsState extends State<UAFoods> {
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
        iconStateFood['al harees'] = false;
        iconStateFood['falafel'] = false;
        iconStateFood['machboos'] = false;
        iconStateFood['shawarma'] = false;
        iconStateFood['umm ali'] = false;
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
                        builder: (context) => ItemsSearch(map: searchMapFoods)),
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
                'assets/Foods/FDC.png',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "F O O D S",
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
            key: searchMapFoods['Al Harees'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 546.h,
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
                            'assets/Foods/ALHAREES.jpg',
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
                              'Al Harees',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['al harees'] = true;
                                });
                                await speak('Al Harees');
                              },
                              icon: !iconStateFood['al harees']!
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.food_bank_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.g_translate_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Harees, jareesh (Arabic: هريس), boko boko, or harisa (Armenian: հարիսա, romanized: harisa) is a dish of boiled, cracked, or coarsely-ground cracked wheat or bulgur, mixed with meat and seasoned.[1] Its consistency varies between a porridge and a gruel. Harees is a popular dish known throughout the Arab world, and is commonly eaten in Arab states of the Persian Gulf.",
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
            key: searchMapFoods['Falafel'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 549.h,
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
                        child: Image.asset(
                          'assets/Foods/FALAFEL.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Falafel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['falafel'] = true;
                                });
                                await speak('Falafel');
                              },
                              icon: !iconStateFood['falafel']!
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.food_bank_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.g_translate_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          'Falafel (/fəˈlɑːfəl/; Arabic: فلافل, [fæˈlæːfɪl] (listen)) is a deep-fried ball or patty-shaped fritter of Arab origin, featuring in Middle Eastern cuisine (especially in Egyptian and Levantine cuisines) made from broad beans, ground chickpeas, or both. Falafel is often served in a pita, samoon, or wrapped in a flatbread known as taboon; "falafel" also frequently refers to a wrapped sandwich that is prepared in this way.',
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
            key: searchMapFoods['Machboos'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 515.h,
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
                        child: Image.asset(
                          'assets/Foods/MACHBOOS.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Machboos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['machboos'] = true;
                                });
                                await speak('Machboos');
                              },
                              icon: !iconStateFood['machboos']!
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.food_bank_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.g_translate_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Chicken Machboos, also known as Kabsa, is a popular rice dish from the Arabian Gulf made with either lamb or chicken. The term 'Machboos' or 'kabsa' actually means pressed in Arabic. It has slight variations from region to region. One thing remains common though: use of whole spices, and cooking the meat in the broth/sauce for the rice in order to get even more flavour.",
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
            key: searchMapFoods['Shawarma'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 585.h,
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
                        child: Image.asset(
                          'assets/Foods/SHAWARMA.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Shawarma',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['shawarma'] = true;
                                });
                                await speak('Shawarma');
                              },
                              icon: !iconStateFood['shawarma']!
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.food_bank_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.g_translate_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Shawarma (/ʃəˈwɑːrmə/; Arabic: شاورما) is a popular Middle Eastern dish that originated in the Ottoman Empire, consisting of meat cut into thin slices, stacked in an inverted cone, and roasted on a slowly turning vertical rotisserie or spit. Traditionally made with lamb or mutton, it may also be made with chicken, turkey, beef, or veal. Thin slices are shaved off the cooked surface as it continuously rotates. Shawarma is a popular street food in the greater Middle East, including Egypt, Kuwait, Iraq, and the Levant, also served widely in Saudi Arabia",
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
            key: searchMapFoods['Umm Ali'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 566.h,
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
                        child: Image.asset(
                          'assets/Foods/UMM.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Umm Ali',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['umm ali'] = true;
                                });
                                await speak('Umm Ali');
                              },
                              icon: !iconStateFood['umm ali']!
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.food_bank_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.g_translate_outlined),
                              iconSize: 28,
                              color: Color(0xff35bbca),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Om Ali, Omali, Umm Ali, or Oumm Ali (Egyptian Arabic: أم على), meaning 'Mother of Ali', is a traditional Egyptian dessert, and is a national dessert of Egypt. There are numerous variations with different composition. The dish, which is traced back to as far as Medieval Egypt, it is named after the wife of the Sultan of Egypt, who, according to folklore, asked all Egypt's cooks and women to compete and come up with the most delicious dessert that they could create as a form of celebration.",
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
