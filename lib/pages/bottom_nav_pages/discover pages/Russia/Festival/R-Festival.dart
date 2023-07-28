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
  'golden': false,
  'maslenitsa': false,
  'moscow': false,
  'orthodox': false,
  'victory': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapFestivals = {
  'Golden': key1,
  'Maslenitsa': key2,
  'Moscow': key3,
  'Orthodox': key4,
  'Victory': key5,
};

class RFestivals extends StatefulWidget {
  const RFestivals({super.key});

  @override
  State<RFestivals> createState() => _RFestivalsState();
}

class _RFestivalsState extends State<RFestivals> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFestival['golden'] = false;
        iconStateFestival['maslenitsa'] = false;
        iconStateFestival['moscow'] = false;
        iconStateFestival['orthodox'] = false;
        iconStateFestival['victory'] = false;
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
                        builder: (context) => ItemsSearch(map: searchMapFestivals)),
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
                'assets/Festival/GOLDEN.jpg',
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
            key: searchMapFestivals['Golden'],
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
                                'assets/Festival/GOLDEN.jpg',
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
                                  'Golden Mask Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['golden'] = true;
                                    });
                                    speak('Golden Mask');
                                  },
                                  icon: !iconStateFestival['golden']!
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
                              "The Golden Mask (Russian: Золотая Маска, zolotaya maska) is a Russian theatre festival and the National Theatre Award established in 1994 by the Theatre Union of Russia. The award is given to productions in all genres of theatre art: drama, opera, ballet, operetta and musical, and puppet theatre. It presents the most significant performances from all over Russia in Moscow in the spring of each year. The first Golden Mask award was given in 1995 presented by Union of Theatre Workers of the Russian Federation.",
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
            key: searchMapFestivals['Maslenitsa'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 590.h,
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
                                'assets/Festival/MASLENITSA.jpg',
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
                                  'Maslenitsa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['maslenitsa'] = true;
                                    });
                                    speak('Maslenitsa');
                                  },
                                  icon: !iconStateFestival['maslenitsa']!
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
                              "Maslenitsa (Belarusian: Масленіца; Russian: Мaсленица; Rusyn: Пущаня; Ukrainian: Масляна or Масниця), also known as Butter Lady, Butter Week, Crepe week, or Cheesefare Week, is an Eastern Slavic religious and folk holiday which has retained a number of elements of Slavic mythology in its ritual. It is celebrated during the last week before Great Lent; that is, the eighth week before Eastern Orthodox Pascha.",
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
            key: searchMapFestivals['Moscow'],
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
                                'assets/Festival/MOSCOW.jpg',
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
                                  'Moscow Film Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['moscow'] = true;
                                    });
                                    speak('Moscow International Film Festival');
                                  },
                                  icon: !iconStateFestival['moscow']!
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
                              "The Moscow International Film Festival (Russian: Моско́вский междунаро́дный кинофестива́ль, translit. Moskóvskiy myezhdunaródniy kinofyestivál; abbreviated as MIFF) is the film festival first held in Moscow in 1935 and became regular since 1959. From its inception to 1959, it was held every second year in July, alternating with the Karlovy Vary festival.[citation needed] The festival has been held annually since 1999.",
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
            key: searchMapFestivals['Orthodox'],
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
                                'assets/Festival/ORTHODOX.jpg',
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
                                  'Russian Orthodox Christmas',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['orthodox'] = true;
                                    });
                                    speak('Russian Orthodox Christmas');
                                  },
                                  icon: !iconStateFestival['orthodox']!
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
                              "Christmas in Russia (Russian: Рождество Христово, Rozhdestvo Khristovo), called Е́же по пло́ти Рождество Господа Бога и Спа́са нашего Иисуса Христа Yezhe po ploti Rozhdestvo Gospoda Boga i Spasa nashego Yisusa Khrista) in the Russian Orthodox Church, is a holiday commemorating the birth of Jesus Christ. It is celebrated on 25 December in the Julian calendar used by the Eastern Orthodox Church, which falls on 7 January in the common Gregorian calendar.",
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
            key: searchMapFestivals['Victory'],
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
                                'assets/Festival/VICTORY.jpg',
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
                                  'Victory Day',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      iconStateFestival['victory'] = true;
                                    });
                                    speak('Victory Day');
                                  },
                                  icon: !iconStateFestival['victory']!
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
                              "Victory Day is a holiday that commemorates the Soviet victory over Nazi Germany in 1945. It was first inaugurated in the 15 republics of the Soviet Union following the signing of the German Instrument of Surrender late in the evening on 8 May 1945 (9 May Moscow Time). The Soviet government announced the victory early on 9 May after the signing ceremony in Berlin. Although the official inauguration occurred in 1945, the holiday became a non-labor day only in 1965, and only in certain Soviet republics.",
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
