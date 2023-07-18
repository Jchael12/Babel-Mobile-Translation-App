// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFestival = {
  'jeju-fire': false,
  'jinju-lantern': false,
  'seongsan-sunrise': false,
  'hansik': false,
  'daeboreum': false,
  'seollal': false,
  'dano': false,
  'hwacheon': false,
  'boryeong': false,
  'gwangju': false,
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

Map<String, GlobalKey> searchMapFestivals = {
  'Jeju-Fire Festival': key1,
  'Jinju-Lantern Festival': key2,
  'Seongsan-Sunrise Festival': key3,
  'Hansik Festival': key4,
  'Daeboreum Festival': key5,
  'Seollal Festival': key6,
  'Dano Festival': key7,
  'Hwacheon Festival': key8,
  'Boryeong Festival': key9,
  'Gwangju Festival': key10,
};

class USFestivals extends StatefulWidget {
  const USFestivals({super.key});

  @override
  State<USFestivals> createState() => _USFestivalsState();
}

class _USFestivalsState extends State<USFestivals> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFestival['jeju-fire'] = false;
        iconStateFestival['jinju-lantern'] = false;
        iconStateFestival['seongsan-sunrise'] = false;
        iconStateFestival['hansik'] = false;
        iconStateFestival['daeboreum'] = false;
        iconStateFestival['seollal'] = false;
        iconStateFestival['dano'] = false;
        iconStateFestival['hwacheon'] = false;
        iconStateFestival['boryeong'] = false;
        iconStateFestival['gwangju'] = false;
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
            key: searchMapFestivals['Jeju-Fire Festival'],
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
                                'assets/Festival/JEJUFIRE.jpg',
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
                                  'Jeju-Fire Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['jeju-fire'] = true;
                                    });
                                    speak('Jeju-Fire Festival');
                                  },
                                  icon: !iconStateFestival['jeju-fire']!
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
                              "Jeju Fire Festival is a representative cultural festival related to Jeju's culture of livestock care. Held every March at Saebyeoloreum Volcanic Cone, the night sky lights up with fiery red. The festival features a media facade show, torch march, fire show, and more as well as various program and food trucks.",
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
            key: searchMapFestivals['Jinju-Lantern Festival'],
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
                                'assets/Festival/JINJULANTERN.jpg',
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
                                  'Jinju-Lantern Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['jinju-lantern'] = true;
                                    });
                                    speak('Jinju-Lantern Festival');
                                  },
                                  icon: !iconStateFestival['jinju-lantern']!
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
                              "Jinju Namgang Yudeung Festival originates from the floating lanterns that were used during the Jinjuseong Fortress Battle of the Imjin War(1582-1598) as a military strategy to prevent Japanese troops from wading the Namgang river. The highlights of the festival are the floating events and programs including a fireworks show, water lighting show, cultural performance, and more.",
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
            key: searchMapFestivals['Seongsan-Sunrise Festival'],
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
                                'assets/Festival/SEONGSANSUNRISE.jpg',
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
                                  'Seongsan-Sunrise Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['seongsan-sunrise'] = true;
                                    });
                                    speak('Seongsan-Sunrise Festival');
                                  },
                                  icon: !iconStateFestival['seongsan-sunrise']!
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
                              "Welcoming the first day of the New Year, Seongsan Sunrise Festival features a natural festival aiming to spread the natural values of Seongsan Ilchulbong Peak, a UNESCO World Nature Heritage Site, to see the old year out and the new year in, and to share the traditional culture and artistic themed-tourism among visitors.",
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
            key: searchMapFestivals['Hansik Festival'],
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
                                'assets/Festival/HANSIK.jpg',
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
                                  'Hansik Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['hansik'] = true;
                                    });
                                    speak('Hansik Festival');
                                  },
                                  icon: !iconStateFestival['hansik']!
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
                              "Hansik is 105 days after Dongji and is one of the major four festive holidays including Seollal, Dano and Chuseok. The term Hansik is derived from an old custom of not lighting fire, thus eating cold food. It is said that the origin of this holiday goes back to ancient China where the day was made to console Gaechachu, a loyal subject of Jin. ",
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
            key: searchMapFestivals['Daeboreum Festival'],
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
                                'assets/Festival/DAEBOREUM.jpg',
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
                                  'Daeboreum Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['daeboreum'] = true;
                                    });
                                    speak('Daeboreum Festival');
                                  },
                                  icon: !iconStateFestival['daeboreum']!
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
                              "Daeboreum Festival is being celebrated during the first 'full moon' of the new year. I believe it relates to the lunar farming calendar that signals farmers to prepare or do something on the farm. Usually, Koreans play fames the night before full moon. Traditionally, farmers sburn hays between the rice fields while others play around with cans containing charcoals with fire inside them.",
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
            key: searchMapFestivals['Seollal Festival'],
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
                                'assets/Festival/SEOLLAL.jpg',
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
                                  'Seollal Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['seollal'] = true;
                                    });
                                    speak('Seollal Festival');
                                  },
                                  icon: !iconStateFestival['seollal']!
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
                              "Seollal is a traditional festival and national holiday commemorating the first day of the lunisolar calendar. It is one of the most important traditional holidays for ethnic Koreans, being celebrated in both North and South Korea as well as Korean diaspora all around the world.",
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
            key: searchMapFestivals['Dano Festival'],
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
                                'assets/Festival/DANO.jpg',
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
                                  'Dano Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['dano'] = true;
                                    });
                                    speak('Dano Festival');
                                  },
                                  icon: !iconStateFestival['dano']!
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
                              "Dano also called Surit-nal, is a traditional Korean traditional holiday that falls on the 5th day of the fifth month of the lunar Korean calendar. It is an official holiday in North Korea and one of the major traditional holidays in South Korea. South Korea has retained several festivals related to the holiday, one of which is Gangneung Dano Festival designated by UNESCO as a 'Intangible Cultural Heritage of Humanity'. ",
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
            key: searchMapFestivals['Hwacheon Festival'],
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
                                'assets/Festival/HWACHEON.jpg',
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
                                  'Hwacheon Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['hwacheon'] = true;
                                    });
                                    speak('Hwacheon Festival');
                                  },
                                  icon: !iconStateFestival['hwacheon']!
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
                              "Hwacheon Sancheoneo Ice Festival takes place in Hwacheon-gun, Gwangwon-do with plenty of snow and ice, perfect for a winter getaway. It was even introducedd by CNN as one of the 'Seven Winter Wonders' in 2011. The main event of the festival, ice fishing, takes place on the frozen Hwacheoncheon Stream. The festival has been visited by more than a million people, attesting to the festival's charm. ",
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
            key: searchMapFestivals['Boryeong Festival'],
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
                                'assets/Festival/BORYEONG.jpg',
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
                                  'Boryeong Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['boryeong'] = true;
                                    });
                                    speak('Boryeong Festival');
                                  },
                                  icon: !iconStateFestival['boryeong']!
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
                              "The Boryeong Mud Festival is an annual festival which takes place during the summer in Boryeong, a town around 200km south of Seoul, South Korea. The first mud festival was staged in 1998 and, by 2007, the festival attracted 2.2 million visitors to Boryeong.",
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
            key: searchMapFestivals['Gwangju Festival'],
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
                                'assets/Festival/GWANGJU.jpg',
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
                                  'Gwangju Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['gwangju'] = true;
                                    });
                                    speak('Gwangju Festival');
                                  },
                                  icon: !iconStateFestival['gwangju']!
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
                              "The festival is held annually in a town with the name Kimchi which is located in the province of Gwangju. It all started back in 1994, where kimchi making was the highlighted event during festival. At the festival, you'll be able to taste and see a variety of Kimchi.",
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
