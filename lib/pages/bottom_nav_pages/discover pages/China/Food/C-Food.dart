// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFood = {
  'dimsum': false,
  'kungpao': false,
  'pekingduck': false,
  'xiaolongbao': false,
  'yangzhou': false,
};

Map<String, String> nameStateFood = {
  'Dimsum': 'siyomay',
  'Kung Pao': 'kungpao',
  'Peking Duck': 'Bibing Peking',
  'Xiaolongbao': 'false',
  'yangzhou': 'false',
};

final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFoods = {
  'Dimsum': key1,
  'Kungpao': key2,
  'Pekingduck': key3,
  'Xiaolongbao': key4,
  'Yangzhou': key5,
};

class CFoods extends StatefulWidget {
  const CFoods({super.key});

  @override
  State<CFoods> createState() => _CFoodsState();
}

class _CFoodsState extends State<CFoods> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFood['kimchi'] = false;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: CustomScrollView(
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
            key: searchMapFoods['Dimsum'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 540.h,
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
                            'assets/Foods/DIMSUM.jpg',
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
                              'Dimsum',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['dimsum'] = true;
                                });
                                speak('Dimsum');
                              },
                              icon: !iconStateFood['dimsum']!
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
                                            text: ' For the Dough:\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 cups refined flour\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/2 tsp salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' For the Filling:\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 cup finely minced cabbage (or mixed vegetables)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tbsp oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/2 cup onion-finely chopped\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tsp garlic-chopped\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/2 tsp salt or to taste\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/4 tsp vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/4 tsp black pepper\n',
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
                              onPressed: () {
                                // setState(() {
                                //   nameStateFood['dimsum'] = true;
                                // });
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
                          "Dim sum (traditional Chinese: 點心; simplified Chinese: 点心; pinyin: diǎn xīn; Jyutping: dim2 sam1) is a large range of small Cantonese dishes that are traditionally enjoyed in restaurants for brunch. Most modern dim sum dishes are commonly associated with Cantonese cuisine, although dim sum dishes also exist in other Chinese cuisines.",
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
            key: searchMapFoods['Kungpao'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 580.h,
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
                          'assets/Foods/KUNGPAO.jpg',
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
                              'Kung Pao Chicken',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['kungpao'] = true;
                                });
                                speak('Kung Pao Chicken');
                              },
                              icon: !iconStateFood['kungpao']!
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
                                                ' 2 tablespoons cornstarch, dissolved in 2 tablespoons water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons white wine, divided\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons soy sauce, divided\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons sesame oil, divided\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 pound skinless, boneless chicken breast halves - cut into chunks\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 ounce hot chili paste\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 teaspoons brown sugar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 teaspoon distilled white vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 (8 ounce) can water chestnuts\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 4 ounces chopped peanuts\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 4 green onions, chopped\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tablespoon chopped garlic\n',
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
                          "Kung pao chicken is a popular Chinese restaurant dish of stir-fried chicken, peanuts and vegetables. It's traditionally made with specialty ingredients, like Sichuan peppercorns, Chinese black vinegar, Chinese rice wine, and whole dried red chilies. This Americanized version replaces those hard-to-find-ingredients with staples from your neighborhood supermarket. It has all the same spicy, sweet, and sour appeal of traditional kung pao chicken, and it makes a really nice weeknight dinner with a side of rice.",
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
            key: searchMapFoods['Pekingduck'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 633.h,
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
                          'assets/Foods/PEKINGDUCK.jpg',
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
                              'Peking Duck',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['pekingduck'] = true;
                                });
                                speak('Peking Duck');
                              },
                              icon: !iconStateFood['pekingduck']!
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
                                                ' 1 (4 pound) whole duck, dressed\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ½ teaspoon ground cinnamon\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ½ teaspoon ground ginger\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ¼ teaspoon ground nutmeg\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ¼ teaspoon ground white pepper\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ⅛ teaspoon ground cloves\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 tablespoons soy sauce, divided\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 tablespoon honey\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 5 green onions, divided\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' ½ cup plum jam\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ¼ cup finely chopped chutney\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 ½ teaspoons sugar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 ½ teaspoons distilled white vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 orange, sliced in rounds\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tablespoon chopped fresh parsley, for garnish\n',
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
                          "Peking duck is a dish from Beijing (Peking)[a] that has been prepared since the Imperial era. The meat is characterized by its thin, crispy skin, with authentic versions of the dish serving mostly the skin and little meat, sliced in front of the diners by the cook. Ducks bred especially for the dish are slaughtered after 65 days and seasoned before being roasted in a closed or hung oven. The meat is often eaten with spring onion, cucumber and sweet bean sauce with pancakes rolled around the fillings. Sometimes pickled radish is also inside. Crispy aromatic duck is a similar dish to Peking duck and is popular in the United Kingdom.",
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
            key: searchMapFoods['Xiaolongbao'],
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
                          'assets/Foods/XIAOLONGBAO.jpg',
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
                              'Xiaolongbao',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['xiaolongbao'] = true;
                                });
                                speak('Xiaolongbao');
                              },
                              icon: !iconStateFood['xiaolongbao']!
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
                                            text: ' 1 medium scallion\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 3/4 cups low-sodium chicken broth, divided\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 dried shiitake mushroom\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 (1/4 inch thick) slice ginger root\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3/4 ounce plain gelatin (3 packets)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' For the Dough\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1/2 cup 195 F water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 1/2 cups (458 grams) all-purpose flour, spooned and leveled, plus more for dusting\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 teaspoons kosher salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/2 cup plus 2 tablespoons room temperature water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 teaspoons vegetable oiln',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 pound ground pork, preferably 80/20 lean to fat ratio\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 tablespoon minced scallion\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 teaspoons minced garlic\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/2 teaspoon minced fresh ginger root\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons Shaoxing rice wine\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons vegetable oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 4 teaspoons sesame oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 teaspoon dark soy sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 teaspoons (9 grams) Diamond Crystal brand kosher salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 3 teaspoons sugar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1/16 teaspoon white pepper\n',
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
                          "Xiaolongbao (/'ʃaʊlɒŋˌbaʊ/) refers to a type of small Chinese steamed bun (baozi) traditionally prepared in a xiaolong, a small bamboo steaming basket, hence the name. Xiaolongbao are often referred to as a kind of 'dumpling', but should not be confused with Chinese jiaozi or wonton.",
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
            key: searchMapFoods['Yangzhou'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 545.h,
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
                          'assets/Foods/YANGZHOU.jpg',
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
                              'Yangzhou',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['yangzhou'] = true;
                                });
                                speak('Yangzhou Fried Rice');
                              },
                              icon: !iconStateFood['yangzhou']!
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
                                            text: ' Rice\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Eggs\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Peas, carrots, scallions\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Chinese barbecued pork\n',
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
                          "Yangzhou fried rice (Traditional Chinese: 揚州炒飯; Simplified Chinese : 扬州炒饭; Pinyin : Yángzhōu chǎofàn, Jyutping: Joeng4zau1 Caau2faan6) is a popular Chinese-style wok fried rice dish in many Chinese restaurants throughout the world. It is commonly sold in the UK as special fried rice, in the US as house special fried rice, in Australia and New Zealand as combination fried rice and in Vietnam as cơm chiên dương châu.",
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
