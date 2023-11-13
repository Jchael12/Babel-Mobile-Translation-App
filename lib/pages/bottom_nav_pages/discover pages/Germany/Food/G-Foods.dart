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
  'bratwurst': false,
  'currywurst': false,
  'pretzel': false,
  'sauerkraut': false,
  'schnitzel': false,
};

final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFoods = {
  'Bratwurst': key1,
  'Currywurst': key2,
  'Pretzel': key3,
  'Sauerkraut': key4,
  'Schnitzel': key5,
};

class GFoods extends StatefulWidget {
  const GFoods({super.key});

  @override
  State<GFoods> createState() => _GFoodsState();
}

class _GFoodsState extends State<GFoods> {
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
        iconStateFood['bratwurst'] = false;
        iconStateFood['currywurst'] = false;
        iconStateFood['pretzel'] = false;
        iconStateFood['sauerkraut'] = false;
        iconStateFood['schnitzel'] = false;
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
            key: searchMapFoods['Bratwurst'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 556.h,
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
                            'assets/Foods/BRATWURST.jpg',
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
                              'Bratwurst',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['bratwurst'] = true;
                                });
                                await speak('Bratwurst');
                              },
                              icon: !iconStateFood['bratwurst']!
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    contentTextStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 238, 190, 190),
                                        fontFamily: "gothic"),
                                    alignment: Alignment.center,
                                    scrollable: true,
                                    elevation: 0,
                                    backgroundColor: const Color(0xff393E46),
                                    title: Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 238, 190, 190)),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    content: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3lbs pork (I use butt as the fat ratio is perfect)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2eggs\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1cup beer\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 1/2 teaspoons black pepper, ground\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1teaspoon cayenne pepper\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 teaspoon paprika (I use smoked)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/2 teaspoon nutmeg\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tablespoon dry mustard (I use Colemans)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	1 tablespoon coriander\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	1 teaspoon sage, ground\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	5 teaspoons salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	2 teaspoons sugar, white\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	2 teaspoons onion powder\n',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                          "Bratwurst (German: ['bʁa:tvʊʁst] (listen)) is a type of German sausage made from pork or, less commonly, beef or veal. The name is derived from the Old High German Brätwurst, from brät-, finely chopped meat, and Wurst, sausage, although in modern German it is often associated with the verb braten, to pan fry or roast.[1] Beef and veal are usually incorporated amongst a blend often including pork.",
                          textAlign: TextAlign.left,
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
            key: searchMapFoods['Currywurst'],
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
                        child: Image.asset(
                          'assets/Foods/CURRYWURST.jpg',
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
                              'Currywurst',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['currywurst'] = true;
                                });
                                await speak('Currywurst');
                              },
                              icon: !iconStateFood['currywurst']!
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    contentTextStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 238, 190, 190),
                                        fontFamily: "gothic"),
                                    alignment: Alignment.center,
                                    scrollable: true,
                                    elevation: 0,
                                    backgroundColor: const Color(0xff393E46),
                                    title: Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 238, 190, 190)),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    content: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	Bratwursts\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 cup of Tomato Ketchup\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/4 teaspoon of Baking Soda (sounds weird but trust me)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 4 - 5 teaspoons of Mild Curry Powder\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 teaspoons of Smoked Paprika\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 teaspoon of Onion Powder\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/8 - 1/4 teaspoons of Cayenne Pepper\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Liquids:\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	2 teaspoons of Worcestershire Sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 4 tablespoons of Beef Broth \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 (or more) tablespoons of Water\n',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                          "Currywurst (German: ['kœʁiˌvʊɐ̯st] (listen)[1]) is a fast food dish of German origin consisting of steamed, fried sausage, usually pork (German: Bratwurst), typically cut into bite-sized chunks and seasoned with curry ketchup, a sauce based on spiced ketchup or tomato paste topped with curry powder, or a ready-made ketchup seasoned with curry and other spices. The dish is often served with chips.",
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
            key: searchMapFoods['Pretzel'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 543.h,
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
                          'assets/Foods/PRETZEL.jpg',
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
                              'Pretzel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['pretzel'] = true;
                                });
                                await speak('Pretzel');
                              },
                              icon: !iconStateFood['pretzel']!
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    contentTextStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 238, 190, 190),
                                        fontFamily: "gothic"),
                                    alignment: Alignment.center,
                                    scrollable: true,
                                    elevation: 0,
                                    backgroundColor: const Color(0xff393E46),
                                    title: Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 238, 190, 190)),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    content: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	1 and 1/2 cups (360ml) warm water (lukewarm- no need to take temperature but around 100°F (38°C) is great)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 and 1/4 teaspoons (7g) instant or active dry yeast (1 standard packet)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 teaspoon salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 Tablespoon brown sugar or granulated sugar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 Tablespoon unsalted butter, melted and slightly cool\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 and 3/4-4 cups (469-500g) all-purpose flour (spooned & leveled), plus more for hands and work surface\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' coarse salt or coarse sea salt for sprinkling\n',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                          "A pretzel (listen (help·info)), from German pronunciation, standard German: Breze(l) (listen (help·info) is a type of baked pastry made from dough that is commonly shaped into a knot. The traditional pretzel shape is a distinctive symmetrical form, with the ends of a long strip of dough intertwined and then twisted back onto itself in a particular way (a pretzel loop or pretzel bow). Today, pretzels come in a wide range of shapes.",
                          textAlign: TextAlign.left,
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
            key: searchMapFoods['Sauerkraut'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 597.h,
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
                          'assets/Foods/SAUERKRAUT.jpg',
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
                              'Sauerkraut',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['sauerkraut'] = true;
                                });
                                await speak('Sauerkraut');
                              },
                              icon: !iconStateFood['sauerkraut']!
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    contentTextStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 238, 190, 190),
                                        fontFamily: "gothic"),
                                    alignment: Alignment.center,
                                    scrollable: true,
                                    elevation: 0,
                                    backgroundColor: const Color(0xff393E46),
                                    title: Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 238, 190, 190)),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    content: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	1 medium head green cabbage (about 3 pounds)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 1/2 tablespoons \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' kosher salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tablespoon \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' caraway seeds (optional, for flavor)\n',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                          "Sauerkraut (/'saʊ.ərˌkraʊt/; German: ['zaʊ.ɐˌkʁaʊt] (listen), lit. 'sour cabbage')[1] is finely cut raw cabbage that has been fermented by various lactic acid bacteria.[2][3] It has a long shelf life and a distinctive sour flavor, both of which result from the lactic acid formed when the bacteria ferment the sugars in the cabbage leaves.[4] Although it is considered a national dish in Germany and is known under its German name in English-speaking countries, it did not originate in Germany and is also a traditional and ubiquitous dish in Central and Eastern Europe.",
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
            key: searchMapFoods['Schnitzel'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 578.h,
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
                          'assets/Foods/SCHNITZEL.jpg',
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
                              'Schnitzel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['schnitzel'] = true;
                                });
                                await speak('Schnitzel');
                              },
                              icon: !iconStateFood['schnitzel']!
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    contentTextStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 238, 190, 190),
                                        fontFamily: "gothic"),
                                    alignment: Alignment.center,
                                    scrollable: true,
                                    elevation: 0,
                                    backgroundColor: const Color(0xff393E46),
                                    title: Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 238, 190, 190)),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                    content: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 lbs boneless pork chops \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/3 cup all-purpose flour\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 Tbsp garlic salt (or sub with equal parts salt and garlic powder)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/2 tsp paprika\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/2 tsp black pepper, freshly ground\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 3 large eggs\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 cups panko bread crumbs\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Olive oil, canola oil or any high heat cooking oil to saute\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                " Lemon wedges to serve (don't skip the lemons!)\n",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                          "A schnitzel is a thin slice of meat. The meat is usually thinned by pounding with a meat tenderizer. Most commonly, the meat is breaded before frying. Breaded schnitzel is popular in many countries and is made using veal, pork, chicken, mutton, beef, or turkey. Schnitzel is very similar to the dish escalope in France and Spain, panado in Portugal, tonkatsu in Japan, cotoletta in Italy, kotlet schabowy in Poland, milanesa in Latin America, chuleta valluna in Colombia, and chicken-fried steak and pork tenderloin of the United States.",
                          textAlign: TextAlign.left,
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
