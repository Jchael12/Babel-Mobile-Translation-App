import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';
import 'package:translator/translator.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFood = {
  'adobo': false,
  'sinigang': false,
  'crispy': false,
  'sisig': false,
  'kare-kare': false,
  'balut': false,
  'bicol': false,
  'halo-halo': false,
  'ice': false,
  'bulalo': false,
};

final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();
final key6 = GlobalKey();
final key7 = GlobalKey();
final key8 = GlobalKey();
final key9 = GlobalKey();
final key10 = GlobalKey();

Map<String, GlobalKey> searchMapFoods = {
  'Adobo': key1,
  'Balut': key2,
  'Bicol Express': key3,
  'Bulalo': key4,
  'Crispy Pata': key5,
  'Halo-Halo': key6,
  'Ice Candy': key7,
  'Kare-Kare': key8,
  'Sinigang': key9,
  'Sisig': key10,
};

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  final ScrollController scrollController = ScrollController();
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  late FlutterTts flutterTts;
  final GoogleTranslator translator = GoogleTranslator();

  void showSnackBar(BuildContext context, String? messages, Color color) {
    final snackBar = SnackBar(
      content: Text(messages!),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  Future speak(String text) async {
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFood['adobo'] = false;
        iconStateFood['sinigang'] = false;
        iconStateFood['crispy'] = false;
        iconStateFood['sisig'] = false;
        iconStateFood['kare-kare'] = false;
        iconStateFood['balut'] = false;
        iconStateFood['bicol'] = false;
        iconStateFood['halo-halo'] = false;
        iconStateFood['ice'] = false;
        iconStateFood['bulalo'] = false;
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
            key: searchMapFoods['Adobo'],
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
                        borderRadius: BorderRadius.circular(10.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Foods/ADOBO.jpg',
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
                              'Adobo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['adobo'] = true;
                                });
                                await speak('Adobo');
                              },
                              icon: !iconStateFood['adobo']!
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
                                                ' 2 tablespoon vegetable oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1(3 pound) chicken, cut into pieces\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 large onion, sliced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoon minced garlic\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2/3 cup soy sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/3 cup of vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tablespoon garlic powder\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 teaspoon black pepper\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 bay leaf\n',
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
                              onPressed: () async {
                                var text = await translator.translate("Adobo",
                                    from: 'tl', to: 'tl');
                                debugPrint("asd: ${text.toString()}");
                              },
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
                          "Adobo is often the national dish of the Philippines and it's centainly the most famous Filipino dish. The flavor is created using vinegar, soy sauce, garlic, bay leaves, and black pepper. Also chilli pepper are sometimes added to give it a little spice.",
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
            key: searchMapFoods['Balut'],
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
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/BALUT.jpg',
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
                              'Balut',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['balut'] = true;
                                });
                                await speak('Balut');
                              },
                              icon: !iconStateFood['balut']!
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
                                                ' 2 duck eggs, raw/uncooked with embryos at 16 days of development or less\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/2 of a small onion, finely chopped\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 tablespoons of cane vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' salt to taste\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' freshly ground black pepper\n',
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
                          "Balut is probably the most infamous street food in the Philippines and the most likely to be a part of drunken dare involving tourists. It is basically just boiled duck egg. However, the duck eggs used for Balut have been fertilized and allowed to incubate anywhere from 14 to  18 days.",
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
            key: searchMapFoods['Bicol Express'],
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
                          'assets/Foods/BICOLEXPRESS.jpg',
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
                              'Bicol Express',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['bicol'] = true;
                                });
                                await speak('Bicol Express');
                              },
                              icon: !iconStateFood['bicol']!
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
                                            text: ' 4 cloves Garlic\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 pc Ginger\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 pc Onion\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 250 g Pork Belly\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 tbsp Bagoong Alamang\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 cups Coconut Milk\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 250 g green finger chili\n',
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
                          "Bicol Express is a stew made with pork belly, coconut milk/cream, bagoong alamang(shrimp paste), and generous amounts of finger chillis and siling labuyo(bird's eye chili). It's spicy and creamy and best eaten with steamed rice to help tone down the heat. Bicol Express got its name from a cooking competition in Manila in the 1970's.",
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
            key: searchMapFoods['Bulalo'],
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
                          'assets/Foods/BULALO.jpg',
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
                              'Bulalo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['bulalo'] = true;
                                });
                                await speak('Bulalo');
                              },
                              icon: !iconStateFood['bulalo']!
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
                                                ' Meat - bone-in beef shanks with collagen-rich bone marrow; no substitutions!\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Vegetables - the recipe uses pechay, onions, green onions, and corn on the cob.\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Seasonings - salt, pepper, and fish sauce round off flavors\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Water- the low and slow cooking of the meat and bone marrow turns it into a rich, flavorful stock\n',
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
                          "Bulalo is light-colored soup made with leafy vegetables, corn on the cob and beef shanks filled with bone marrow. It's basically a type of Nilaga dish (Boiled meat and vegies soup) made specifically with beef shanks containing marrow. To prepare, the beef shanks are simmered for several hours until the collagen and fat melt into the clea broth.",
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
            key: searchMapFoods['Crispy Pata'],
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
                        child: Image.asset(
                          'assets/Foods/PATA.jpg',
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
                              'Crispy Pata',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['crispy'] = true;
                                });
                                await speak('Crispy Pata');
                              },
                              icon: !iconStateFood['crispy']!
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
                                            text: ' 2kg (or smaller) pata\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ½ cup salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 red onions, quartered\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 heads garlic, halved horizontally\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 4 bay leaves\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tbsp whole black peppercorns\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ¼ cup soy sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' neutral oil, for frying\n',
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
                          "Crispy Pata refers to a famous Filipino dish of deep-fried pork trotters or knuckles served with a dipping sauce made with vinegar, soy sauce, garlic, onions, sugar and black pepper. To prepare, the pork leg is boiled to tenderize the meat before being deep-fried till golden brown and crispy. When cooked well, crispy pata is crunchy on the outside with moist and tender meat. It's usually served as a main dish with white rice.",
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
            key: searchMapFoods['Halo-Halo'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 530.h,
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
                          'assets/Foods/HALOHALO.jpg',
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
                              'Halo-Halo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['halo-halo'] = true;
                                });
                                await speak('Halo-halo');
                              },
                              icon: !iconStateFood['halo-halo']!
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
                                                ' 1-2 tbsp syrup-packed red mung beans, white beans, and/or garbanzo beans\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tbsp sweetened jackfruit\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tbsp macapuno strings (coconut sport)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tbsp nata de coconut (coconut gel)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 cup shaved ice\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tbsp ube halaya jam\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tbsp Leche Flan, purchased\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 to 4 tbsp evaporated milk\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 tbsp ube ice cream\n',
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
                          "Literally meaning 'mix mix' the name halo-halo is pretty description for this tranditional Filipino dessert that includes every sweet treat the restaurant has in their refrigerator and freezer. While components vary, you'll find some common and add-ons at most halo-halo carts and bars: jellies, flan, macapuno, palm seed, sweetened red beans, shaved ice, ube ice cream, fresh fruit, toasted coconut flakes, pinipig.",
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
            key: searchMapFoods['Ice Candy'],
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
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/ICECANDY.jpg',
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
                              'Ice Candy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['ice'] = true;
                                });
                                await speak('Ice Candy');
                              },
                              icon: !iconStateFood['ice']!
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
                                                ' Mix cornstarch, water, and condensed milk together\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Boil together until the mixture has a thick soupy consistency\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Add flavoring and additional ingredients\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Add variation (ube, strawberry, mango, chocolate)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Cool the filling\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Assemble the ice candies\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Freeze the ice candies overnight\n',
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
                          "Ice Candy is made by mixing fruit juice with sugar and milk, then pouring it into slender practice bags that are tied shut and frozen. Ice Candy is eaten just like a home made push pop. Tea or bite off the top of the plastic and squeeze from the buttom.",
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
            key: searchMapFoods['Kare-Kare'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
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
                          'assets/Foods/KAREKARE.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 200.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kare-Kare',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['kare-kare'] = true;
                                });
                                await speak('Kare-kare');
                              },
                              icon: !iconStateFood['kare-kare']!
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
                                                ' 2 pounds oxtail cut into serving size\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 banana heart\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 large eggplant ends trimmed and cut into 1-inch thick\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 bundle long beans sitaw, cut into 3-inch lengths\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 bundle pechay ends trimmed and leaves separated\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ¼ cup rice flour\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1-½ tablespoons annatto powder\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1-½ cups chunky peanut butter\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tablespoon oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 medium onion peeled and sliced thinly\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 4 to 5 cloves garlic peeled and minced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons fish sauce \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' salt and pepper\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' shrimp paste\n',
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
                          "Kare-Kare is thick stew made from oxtail, vegetables and peanut sauce. It reminded us a bit of massaman curry from Thailand which makes sense as the world 'kare' is derived from the Filipino word for curry. Supposedly the best kare-kare comes from Pampanga which is just north of Manila, but you'll find this dish served all over the Philippines.",
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
            key: searchMapFoods['Sinigang'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
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
                          'assets/Foods/SINIGANG.jpg',
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
                              'Sinigang',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['sinigang'] = true;
                                });
                                await speak('Sinigang');
                              },
                              icon: !iconStateFood['sinigang']!
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
                                            text: ' pork\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' tomatoes\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' onion\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' fish sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' gabi\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' radish (labanos)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' vegetables - the recipe uses sitaw (long beans), eggplant, okra, and bok choy, but feel free to include other local produce available such as kangkong (water spinach) and pechay\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' tamarind - can be fresh pods, paste, or powder mixes\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' banana or finger chili peppers (siling haba)\n',
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
                          "Sinigang is a sour soup that is typically made with pork and tamarind though sometinmes other sour fruits like guava, green mango or calamansi are used insted. Tomatoes, garlic, onion and various other vegetables complete the stew. It's delicious Filipino comfort food and makes for a hearty hangover breakfast if had a few to many liquor the night before.",
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
            key: searchMapFoods['Sisig'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
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
                          'assets/Foods/SISIG.jpg',
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
                              'Sisig',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  iconStateFood['sisig'] = true;
                                });
                                await speak('Sisig');
                              },
                              icon: !iconStateFood['sisig']!
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
                                                ' 2 pounds pig face (snouts, ears, and jowls)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 cup vinegar \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ¼ cup soy sauce \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 head garlic, peeled and crushed\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 teaspoon whole peppercorns\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 bay leaves \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tablespoon salt \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 large onion, peeled and diced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 6 Thai chili peppers, stemmed and minced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ½ cup calamansi juice\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tablespoon Liquid seasoning (I used Maggi)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ½ cup liver spread\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' pepper to taste\n',
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
                          "Pork Sisig is most common and it consist of chopped up pig ears, jowls and liver, onion, chili peppers delivered on a sizzling hot skillet with a raw egg on top. You'll need to mix in the egg to cook it before the skillet cools down. It usually comes with a couple calamansi halves so you can squeeze the juice over the top.",
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
