// ignore_for_file: file_names
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconState = {
  'bluebay' : false,
  'lazurnaya': false,
  'riviera': false,
  'sestroretsk' : false,
  'kungasny': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMap = {
  'Bluebay' : key1, 
  'Lazurnaya': key2,
  'Riviera': key3,
  'Sestroretsk': key4,
  'Kungasny': key5,
};

final ScrollController scrollController = ScrollController();

class RBeaches extends StatefulWidget {
  const RBeaches({super.key});

  @override
  State<RBeaches> createState() => _RBeachesState();
}

class _RBeachesState extends State<RBeaches> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        iconState['bluebay'] = false;
        iconState['lazurnaya'] = false;
        iconState['riviera'] = false;
        iconState['sestroretsk'] = false;
        iconState['kungasny'] = false;
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
    return Builder(builder: (BuildContext scaffoldContext) {
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
                          builder: (context) => ItemsSearch(map: searchMap)),
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
                  'assets/Beaches/BC.png',
                  fit: BoxFit.cover,
                ),
                titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                title: Text(
                  "B E A C H E S",
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
              key: searchMap['Bluebay'],
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
                              'assets/Beaches/BLUEBAY.jpg',
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
                                'Blue Bay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['bluebay'] = true;
                                  });
                                  speak('Bluebay');
                                },
                                icon: !iconState['bluebay']!
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
                            "Blue Bay is usually called a small village 13 kilometers from the center of Gelendzhik. Here is the resort of the same name and the Institute of Oceanology of the PP Shyrshovu Russian Academy of Sciences. Research ships are sent to carry out research in various parts of the world ocean from here. It is believed that at the Blue Bay of the cleanest water in Gelendzhik, and healthful climate. Indeed, crystal clear water, shimmering in the sun glare, gaze is pebbly bottom samples.",
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
              key: searchMap['Lazurnaya'],
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
                              'assets/Beaches/LAZURNAYA.jpg',
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
                                'Lazurnaya Beach',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['lazurnaya'] = true;
                                  });
                                  speak('Lazurnaya');
                                },
                                icon: !iconState['lazurnaya']!
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
                            "Lazurnaya Bay (Russian: бухта Лазурная) is a bay on the east side of the Muravyov-Amursky Peninsula in Russia. It lies to the northeast of Vladivostok and to the southwest from the Three Little Pigs Bay. The Lazurnaya Bay forms part of the Ussuri Bay in the Sea of Japan.",
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
              key: searchMap['Riviera'],
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
                              'assets/Beaches/RIVIERA.jpg',
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
                                'Riviera Beach',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['riviera'] = true;
                                  });
                                  speak('Riviera');
                                },
                                icon: !iconState['riviera']!
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
                            'Riviera Beach is the best beach in the Central district of Sochi. Its length is almost 500 meters, and the width is about 50 meters. There are no breakwaters that spoil the appearance of the Central Beach of Sochi. The beaches on the Sochi coast are usually pebbly, but the Riviera Beach is covered with sand mixed with small pebbles. The entrance to the sea is flat, so there are always a lot of families with children. Riviera beach in Sochi is covered with pebbles and sand',
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
              key: searchMap['Sestroretsk'],
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
                              'assets/Beaches/SESTRORETSK.jpg',
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
                                'Sestroretsk Beach',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['sestroretsk'] = true;
                                  });
                                  speak('Sestroretsk');
                                },
                                icon: !iconState['sestroretsk']!
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
                            'Sestroretsk Beach is a popular holiday destination on the coast of the Gulf of Finland in the vicinity of St. Petersburg. It is located on the shore of the resort town of Sestroretsk, famous for its many sanatoriums, and among all other city beaches it is considered to be one of the most visited. Due to the stable small waves, this beach is one of the best places in the vicinity of St. Petersburg for beginners to master kitesurfing.',
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
              key: searchMap['Kungasny'],
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
                              'assets/Beaches/KUNGASNY.jpg',
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
                                'Kungasny Beach',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['kungasny'] = true;
                                  });
                                  speak('Kungasny');
                                },
                                icon: !iconState['kungasny']!
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
                            "Kungasny Cape Beach in Vladivostok is a vivid example of how from an unattractive place on the coast you can create a beautiful recreation area, impressive cleanliness of the coast and developed infrastructure. It is located almost in the center of the city, in the bukhta Bezymyannaya of Amur Bay, and in recent years, it has become one of the most beloved beach by locals and guests.",
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
    });
  }
}
