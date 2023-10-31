import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFood = {
  'tempura': false,
  'sushi': false,
  'ramen': false,
  'tonkatsu': false,
  'sashimi': false,
  'donburi': false,
  'sukiyaki': false,
  'edamame': false,
  'gyoza': false,
  'shabu-shabu': false,
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
  'Tempura': key1,
  'Sushi': key2,
  'Ramen': key3,
  'Tonkatsu': key4,
  'Sashimi': key5,
  'Donburi': key6,
  'Sukiyaki': key7,
  'Edamame': key8,
  'Gyoza': key9,
  'Shabu-Shabu': key10,
};

class JFoods extends StatefulWidget {
  const JFoods({super.key});

  @override
  State<JFoods> createState() => _JFoodsState();
}

class _JFoodsState extends State<JFoods> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFood['tempura'] = false;
        iconStateFood['sushi'] = false;
        iconStateFood['ramen'] = false;
        iconStateFood['tonkatsu'] = false;
        iconStateFood['sashimi'] = false;
        iconStateFood['donburi'] = false;
        iconStateFood['sukiyaki'] = false;
        iconStateFood['edamame'] = false;
        iconStateFood['gyoza'] = false;
        iconStateFood['shabu-shabu'] = false;
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
            key: searchMapFoods['Tempura'],
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
                            'assets/Foods/TEMPURA.jpg',
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
                              'Tempura',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['tempura'] = true;
                                });
                                speak('Tempura');
                              },
                              icon: !iconStateFood['tempura']!
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
                                                ' 2 cups vegetable oil for frying\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 cup all-purpose flour\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 tablespoons cornstarch\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 pinch salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 cup water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 large egg yolk\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 large egg whites, lightly beaten\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 pound medium shrimp, peeled and deveined\n',
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
                          "Tempura, tenpura, is a typical Japanese dish that was originally introduced to Japan by the Portuguese in Nagasaki through fritter-cooking techniques during the 16th century. The dish usually consists of seafood, meat and vegetables that have been battered and deep fried.",
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
            key: searchMapFoods['Sushi'],
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
                          'assets/Foods/SUSHI.jpg',
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
                              'Sushi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['sushi'] = true;
                                });
                                speak('Sushi');
                              },
                              icon: !iconStateFood['sushi']!
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
                                            text: ' 1 ⅓ cups water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ⅔ cup uncooked short-grain white rice\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 tablespoons rice vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 3 tablespoons white sugar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 ½ teaspoons salt\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 4 sheets nori seaweed sheets\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ½ pound imitation crabmeat, flaked\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 avocado - peeled, pitted, and sliced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ½ cucumber, peeled, cut into small strips\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons pickled ginger\n',
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
                          "Sushi is a Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanied by a variety of ingridients, such as seafood-often raw-and vegetables. STyles of sushi and its presentation vary widely, but the one key ingridients is 'sushi rice', also referred to as shari or sumeshi.",
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
            key: searchMapFoods['Ramen'],
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
                          'assets/Foods/RAMEN.jpg',
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
                              'Ramen',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['ramen'] = true;
                                });
                                speak('Ramen');
                              },
                              icon: !iconStateFood['ramen']!
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
                                                ' Ramen noodles (our classic Maruchan package is all we need, sans the seasoning!)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Garlic and ginger\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Broth (chicken or veg)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Dried shiitake mushrooms\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Veggies like carrots or kale\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' All your favorite toppings like some panko, egg, chili oil, etc.\n',
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
                          "Ramen is Japanese noodle dish. It consists of Chinese-style wheat noodles served in a broth; common flavors are soy suace and miso, with typical toppings including sliced pork, nori, menma, and scallions. Ramen has its roots in Chinese noodle dishes. Nearly every region in Japan has its own variation of ramen, such as tonkatsu ramen of Kyushu and the miso ramen of the Hokkaido.",
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
            key: searchMapFoods['Tonkatsu'],
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
                          'assets/Foods/TONKATSU.jpg',
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
                              'Tonkatsu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['tonkatsu'] = true;
                                });
                                speak('Tonkatsu');
                              },
                              icon: !iconStateFood['tonkatsu']!
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
                                            text: ' salt and pepper\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Flour)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Egg\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Panko - Please get a Japanese brand as non-Japanese brand of panko seem a bit different.\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Neutral flavored oil for deep frying\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Tonkatsu sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Sesame seeds (optional)\n',
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
                          "Tokatsu is a Japanese dish consisting of a crispy fried pork cutlet. Seasoned pork loin or fillet is lightly dredged in flour, dipped in beaten eggs, and coated in Panko bread crumbs before deep-frying in hot oil until golden and crunchy.",
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
            key: searchMapFoods['Sashimi'],
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
                          'assets/Foods/SASHIMI.jpg',
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
                              'Sashimi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['sashimi'] = true;
                                });
                                speak('Sashimi');
                              },
                              icon: !iconStateFood['sashimi']!
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
                                                ' about 150g per person  sashimi-grade tuna or salmon\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' wasabi\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Japanese soy sauce)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' pickled ginger\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 mooli (white radish), spiralised or shredded\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' for decoration shiso leaves or micro leaves\n',
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
                          "Sashimi is Japanese delicacy consisting of fresh raw fish or meat sliced into thin pieces and often eaten with soy sauce. The word sashimi means 'pierced body'. This word dates from the Muromachi period(1336 to 1573) and was possibly coined when the word kiru(cut), the culinary step, was considered too inauspicious to be used by anyone other than samurai.",
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
            key: searchMapFoods['Donburi'],
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
                          'assets/Foods/DONBURI.jpg',
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
                              'Donburi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['donburi'] = true;
                                });
                                speak('Donburi');
                              },
                              icon: !iconStateFood['donburi']!
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
                                                ' 1 ½ cups sushi rice, rinsed and drained\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 3 cups water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 3 teaspoons canola oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 brown onion halved and thinly sliced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 100g shiitake mushrooms sliced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 300g chicken thigh fillet, thinly sliced\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 2 tablespoons soy sauce\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 2 tablespoons rice vinegar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 teaspoon brown sugar\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' 1 cup (250ml) Dashi or chicken stock (see tips)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '	5 eggs, lightly beaten\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	125g snow peas, halved lengthways\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	2-3 green onions, finely shredded diagonally\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	2 teaspoons sesame seeds, toasted\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '	Tonkatsu sauce, optional, to serve\n',
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
                          "Donburi literally 'bowl', also abbreviated to 'don' as a suffix, less commonly spelled 'domburi' is a Japanese rice bowl dish consisting of fish, meat, vegetables or other ingridients simmered together and served over rice.",
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
            key: searchMapFoods['Sukiyaki'],
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
                          'assets/Foods/SUKIYAKI.jpg',
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
                              'Sukiyaki',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['sukiyaki'] = true;
                                });
                                speak('Sukiyaki');
                              },
                              icon: !iconStateFood['sukiyaki']!
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
                                                ' Broth: Warishita (a mixture of soy sauce, sake, mirin, and sugar, diluted with kombu dashi)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Meat: Well-marbled beef (thicker than shabu shabu beef)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Vegetables: Napa cabbage, chrysanthemum greens, Tokyo negi, carrot, shirataki noodles)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Tofu: Grilled tofu\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Mushrooms: Shiitake, enoki, shimeji, maitake\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Final course (Shime): Udon noodles\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Dipping sauce: Raw eggs\n',
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
                          "Sukiyaki is a Japanese dish that is prepared and served in the nabemono(Japanese hot pot) style. It consists of meat(usually thinly sliced beef) which is slowly cooked or simmered at the table, alongside vegetables and other ingridients, in a shallow iron pot in mixture of soy sauce, sugar, and mirin.",
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
            key: searchMapFoods['Edamame'],
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
                          'assets/Foods/EDAMAME.jpg',
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
                              'Edamame',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['edamame'] = true;
                                });
                                speak('Edamame');
                              },
                              icon: !iconStateFood['edamame']!
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
                                                ' 1 pound frozen edamame in pods (in the shell)\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ½ tablespoon toasted sesame oil\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' 1 small garlic clove\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ¾ teaspoon kosher or fine sea salt, plus more for the water\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Spicy variation: add about 1 tablespoon chili garlic sauce, to taste\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Optional garnish: sesame seeds \n',
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
                          "Edamame is Japanese dish prepared with immature soybeans in the pod. The pods are boiled or steamed and may be served with salt or other condiments. The dish has become popular across the world because it is rich in vitamins, dietary fiber, and isoflavones. When the beans are outside the pod, the term mukimame is also sometimes used in Japanese.",
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
            key: searchMapFoods['Gyoza'],
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
                          'assets/Foods/GYOZA.jpg',
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
                              'Gyoza',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['gyoza'] = true;
                                });
                                speak('Gyoza');
                              },
                              icon: !iconStateFood['gyoza']!
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
                                            text: ' Pork\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Cabbage\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Chinese Chives\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Aromatics \n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Seasonings - The seasonings are simple, with just sake, soy sauce, sesame oil, and a pinch of salt and pepper. This way you can just enjoy the flavor and freshness of the main ingredients.\n',
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
                          "Gyoza are Japanese pan-fried dumplings that are crispy and golden on the bottom and juicy on the inside, are ubiquitous as ramen in Japan. You can find these mouthwatering dumplings being served at specialty shops, izakaya, ramen shops, grocery stores or even at festivals.",
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
            key: searchMapFoods['Shabu-Shabu'],
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
                          'assets/Foods/SHABUSHABU.jpg',
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
                              'Shabu-Shabu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['shabu-shabu'] = true;
                                });
                                speak('Shabu-Shabu');
                              },
                              icon: !iconStateFood['shabu-shabu']!
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
                                            text: ' Broth: Kombu dashi\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Meat: Well-marbled beef or pork\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Vegetables: Napa cabbage, chrysanthemum greens, Tokyo negi, mizuna, carrot\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: ' Tofu: Medium-firm tofu\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Mushrooms: Shiitake, enoki, shimeji, maitake\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Final course (Shime): Udon noodles, rice\n',
                                          ),
                                          TextSpan(
                                            text: '•',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                ' Dipping Sauce: Ponzu sauce and/or sesame sauce\n',
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
                          "Shabu-Shabu is a popular Japanese-style hot pot where the meat and vegetables are cooked in a flavorful kombu dashi broth. Everyone at the tables takes part in the communal cooking and enjoys the ingridients with different dipping sauces. It's intimate yet casual, and a whole lot of fun!",
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
