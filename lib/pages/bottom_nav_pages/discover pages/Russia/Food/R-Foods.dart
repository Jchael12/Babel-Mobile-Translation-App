import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFood = {
  'blini': false,
  'borscht': false,
  'pelmeni': false,
  'pirozhki': false,
  'solyanka': false,
};

final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFoods = {
  'Blini': key1,
  'Borscht': key2,
  'Pelmeni': key3,
  'Pirozhki': key4,
  'Solyanka': key5,
};

class RFoods extends StatefulWidget {
  const RFoods({super.key});

  @override
  State<RFoods> createState() => _RFoodsState();
}

class _RFoodsState extends State<RFoods> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFood['blini'] = false;
        iconStateFood['borscht'] = false;
        iconStateFood['pelmeni'] = false;
        iconStateFood['pirozhki'] = false;
        iconStateFood['solyanka'] = false;
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
            key: searchMapFoods['Blini'],
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
                            'assets/Foods/BLINI.jpg',
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
                              'Blini',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['Blini'] = true;
                                });
                                speak('Blini');
                              },
                              icon: !iconStateFood['blini']!
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
                          "A blini (plural blinis or blini, rarely bliny;[2][3] Russian: блины pl.), traditionally also called a blin is a Russian[4] and more broadly Eastern European pancake traditionally made from buckwheat flour or nowadays wheat and served with smetana, tvorog, butter, caviar and other garnishes. Blini are among the most popular and most-eaten dishes in Russia.",
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
            key: searchMapFoods['Borscht'],
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
                          'assets/Foods/BORSCHT.jpg',
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
                              'Borscht',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['borscht'] = true;
                                });
                                speak('Borscht');
                              },
                              icon: !iconStateFood['borscht']!
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
                          "Borscht (English: /ˈbɔːrʃ, ˈbɔːrʃt/ (listen)) is a sour soup, made with meat stock, vegetables and seasonings, common in Eastern Europe and Northern Asia. In English, the word 'borscht' is most often associated with the soup's variant of Ukrainian origin, made with red beetroots as one of the main ingredients, which give the dish its distinctive red color. The same name, however, is also used for a wide selection of sour-tasting soups without beetroots, such as sorrel-based green borscht, rye-based white borscht, and cabbage borscht.",
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
            key: searchMapFoods['Pelmeni'],
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
                          'assets/Foods/PELMENI.jpg',
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
                              'Pelmeni',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['pelmeni'] = true;
                                });
                                speak('Pelmeni');
                              },
                              icon: !iconStateFood['pelmeni']!
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
                          "Pelmeni (Russian: пельмени—plural, pronounced [pʲɪlʲˈmʲenʲɪ]; pelmen, Russian: пельмень—singular, pronounced [pʲɪlʲˈmʲenʲ]) are dumplings of Russian cuisine that consist of a filling wrapped in thin, unleavened dough. It is debated whether they originated in Ural or Siberia.[1] Pelmeni have been described as 'the heart of Russian cuisine'.",
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
            key: searchMapFoods['Pirozhki'],
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
                          'assets/Foods/PIROZHKI.jpg',
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
                              'Pirozhki',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['pirozhki'] = true;
                                });
                                speak('Pirozhki');
                              },
                              icon: !iconStateFood['pirozhki']!
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
                          "Pirozhki (Russian: пирожки́, tr. pirožkí, IPA: [pʲɪrɐʂˈkʲi]) are foremost, Russian baked or fried yeast-leavened boat-shaped buns with a variety of fillings. Pirozhki are a popular street food and comfort food in Eastern Europe. Pirozhki are either fried or baked. They come in sweet or savory varieties. Common savory fillings include ground meat, mashed potato, mushrooms, boiled egg with scallions, or cabbage. Typical sweet fillings are fruit (apple, cherry, apricot, lemon), jam, or tvorog.",
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
            key: searchMapFoods['Solyanka'],
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
                          'assets/Foods/SOLYANKA.jpg',
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
                              'Solyanka',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['solyanka'] = true;
                                });
                                speak('Solyanka');
                              },
                              icon: !iconStateFood['solyanka']!
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
                          "Solyanka (Russian: соля́нка, initially селя́нка; [sɐˈlʲankə] in English 'Settlers' Soup') is a thick and sour soup of Russian origin[2][3] that is common in Russia, Ukraine, Belarus, and other states of the former Soviet Union and certain parts of the former Eastern Bloc. It was one of the most popular dishes of the former East Germany (German: Soljanka(-Suppe))",
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

