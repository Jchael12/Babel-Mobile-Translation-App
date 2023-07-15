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
  'ati-atihan': false,
  'sinulog': false,
  'dinagyang': false,
  'panagbenga': false,
  'moriones': false,
  'pahiyas': false,
  'pintados': false,
  'aliwan': false,
  'penafrancia': false,
  'air': false,
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
  'Air Balloon Fiesta': key1,
  'Aliwan Festival': key2,
  'Ati-Atihan Festival': key3,
  'Dinagyang Festival': key4,
  'Moriones Festival': key5,
  'Pahiyas Festival': key6,
  'Panagbenga Festival': key7,
  'Penefrancia Festival': key8,
  'Pintados Festival': key9,
  'Sinulog Festival': key10,
};

class Festivals extends StatefulWidget {
  const Festivals({super.key});

  @override
  State<Festivals> createState() => _FestivalsState();
}

class _FestivalsState extends State<Festivals> {
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
        iconStateFestival['ati-atihan'] = false;
        iconStateFestival['sinulog'] = false;
        iconStateFestival['dinagyang'] = false;
        iconStateFestival['panagbenga'] = false;
        iconStateFestival['moriones'] = false;
        iconStateFestival['pahiyas'] = false;
        iconStateFestival['pintados'] = false;
        iconStateFestival['aliwan'] = false;
        iconStateFestival['penafrancia'] = false;
        iconStateFestival['air'] = false;
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
            key: searchMapFestivals['Air Balloon Fiesta'],
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
                                'assets/Festival/air_balloon.jpg',
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
                                  'Air Balloon Fiesta',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['air'] = true;
                                    });
                                    await speak('Air Balloon Festia');
                                  },
                                  icon: !iconStateFestival['air']!
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
                              "Location: Clark Freeport Zone, Angeles City, Pampanga\n"
                              "Date: Every 2nd week of February\n\n"
                              "Everyone is thrilled that the Philippine International Hot Air Balloon Fiesta is returning. The four-day celebration now has a new location after formerly taking place in Pampanga. The festival offers a variety of flying-related activities, including skydiving, paragliding, and breathtaking hot air balloon rides.\n\n"
                              'The longest-running festival in Asia will bring together travelers and aviators from all around the world.',
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
            key: searchMapFestivals['Aliwan Festival'],
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
                                'assets/Festival/aliwan.jpg',
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
                                  'Aliwan Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['aliwan'] = true;
                                    });
                                    await speak('Aliwan Festival');
                                  },
                                  icon: !iconStateFestival['aliwan']!
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
                              "Location: CCP Complex Pasay City\n"
                              "Date: April 26 - 28\n\n"
                              "The final week of April is when the Aliwan Fiesta takes place. With a debut date of 2003, this event is among the most recent in the nation. However, only a few other things in the nation can match its tremendous popularity. The festival, which takes place in Pasay City, is currently hailed as the origin of all celebrations in the nation.",
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
            key: searchMapFestivals['Ati-Atihan Festival'],
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
                                'assets/Festival/Ati-Atihan.jpg',
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
                                  'Ati-Atihan Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      iconStateFestival['ati-atihan'] = true;
                                    });
                                    await speak('Ati-atihan Festival');
                                  },
                                  icon: !iconStateFestival['ati-atihan']!
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
                              "Location: Aklan\n"
                              "Date: 3rd Sunday of January\n\n"
                              "For good reason, the Ati-Atihan Festival is considered the national "
                              "holiday of the Philippines. This religious festival is one of the oldest in "
                              "the Philippines and is sometimes regarded as the best and biggest Mardi Gras in the world.",
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
            key: searchMapFestivals['Dinagyang Festival'],
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
                                'assets/Festival/dinagyang.jpg',
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
                                  'Dinagyang Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      iconStateFestival['dinagyang'] = true;
                                    });
                                    await speak('Dinagyang Festival');
                                  },
                                  icon: !iconStateFestival['dinagyang']!
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
                              "Location: IloIlo City\n"
                              "Date: 4th Sunday of January\n\n"
                              "Every year on the fourth weekend of January, the entire city of Iloilo shuts down for a street festival. Typically, during this festival, the streets are closed off while people enjoy unending food and drink while listening to bands playing on every corner. Boom boxes that are really tall are everywhere. In this festival, various tribes get together and perform engaging street dance routines and presentations.",
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
            key: searchMapFestivals['Moriones Festival'],
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
                                'assets/Festival/moriones.jpg',
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
                                  'Moriones Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['moriones'] = true;
                                    });
                                    await speak('Moriones Festival');
                                  },
                                  icon: !iconStateFestival['moriones']!
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
                              "Location: Marinduque Province\n"
                              "Date: April 2 - 7\n\n"
                              'People swarm to the island province of Marinduque in the Philippines during Holy Week for a weeklong celebration of St. Longinus. Numerous participants dress in armor to simulate the saint being sought out by other centurions after becoming a Christian.',
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
            key: searchMapFestivals['Pahiyas Festival'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 660.h,
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
                                'assets/Festival/pahiyas.jpg',
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
                                  'Pahiyas Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['pahiyas'] = true;
                                    });
                                    await speak('Pahiyas Festival');
                                  },
                                  icon: !iconStateFestival['pahiyas']!
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
                              "Location: Lucban, Quezon\n"
                              "Date: May 14 - 15\n\n"
                              "The Pahiyas, a distinctive harvest festival, is held in Lucban every May. Farm products are used by locals to brightly decorate their dwellings. The competition-based nature of the show adds to the event's glitz.\n\n"
                              'If you would like to take the item off the walls without paying, come out with a basket. The sigarilyas, sitaw, and talong, as well as the other luscious fruits and vegetables described in the Bahay Kubo song, are frequently on display.',
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
            key: searchMapFestivals['Panagbenga Festival'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 676.h,
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
                                'assets/Festival/panagbenga.jpg',
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
                                  'Panagbenga Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['panagbenga'] = true;
                                    });
                                    await speak('Panagbenga Festival');
                                  },
                                  icon: !iconStateFestival['panagbenga']!
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
                              "Location: Baguio City\n"
                              "Date: February 1 - March 4\n\n"
                              'The "season of blooming" festival, which takes place in Baguio City in February, is a feast whose appeal stems mostly from its flora and wildlife theme. Expect charming parades of floral floats around the city and kids wearing plant and animal decorations.\n\n'
                              'Session Road in Bloom, when the roadway is closed to make way for exquisite flower carts, lovely street dancing, and outdoor cafes, is a sight to behold. For those who have just finished the frenzied celebrations of January, it is a welcome celebration. ',
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
            key: searchMapFestivals['Penefrancia Festival'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 768.h,
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
                                'assets/Festival/penafrancia.jpg',
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
                                  'Penafrancia Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['penafrancia'] = true;
                                    });
                                    await speak('Penafrancia Festival');
                                  },
                                  icon: !iconStateFestival['penafrancia']!
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
                              "Location: Naga, Camarines Sur\n"
                              "Date: 3rd Saturday of September\n\n"
                              "The Penafrancia Festival is an annual religious festival held in the city of Naga in the Bicol region of the Philippines. The festival is in honor of Our Lady of Peñafrancia, the patroness of the Bicol region.\n\n"
                              'The festival takes place on the third Saturday of September and lasts for nine days. It features a series of religious and cultural events, including a fluvial procession where the image of Our Lady of Peñafrancia is carried on a brightly decorated barge down the Naga River. This is followed by a procession on land where devotees carry the image of the patroness on their shoulders, shouting “Viva la Virgen!”.',
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
            key: searchMapFestivals['Pintados Festival'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 660.h,
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
                                'assets/Festival/pintados.jpg',
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
                                  'Pintados Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['pintados'] = true;
                                    });
                                    await speak('Pintados Festival');
                                  },
                                  icon: !iconStateFestival['pintados']!
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
                              "Location: Tacloban City, Leyte\n"
                              "Date: June 28 - 29\n\n"
                              "This festival is the highlight of June for residents of Tacloban City. It is the fourth celebration in honor of Sto. Niño-the baby Jesus. Yes, Filipinos love to remind everyone to be childlike in their ways and treasure their children, placing their hopes in them.\n\n"
                              'This festival has been growing in popularity over the years as it sends a lot of participants to the next festival on this list, the Aliwan Fiesta.',
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
            key: searchMapFestivals['Sinulog Festival'],
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
                                'assets/Festival/sinulog.jpg',
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
                                  'Sinulog Festival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      iconStateFestival['sinulog'] = true;
                                    });
                                    await speak('Sinulog Festival');
                                  },
                                  icon: !iconStateFestival['sinulog']!
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
                              "Location: Cebu City\n"
                              "Date: 3rd Sunday of January\n\n"
                              "On the third weekend in January, Cebu City offers a festival dish that "
                              "can compete with any in the world. This celebration, often referred to as "
                              "Sinulog, draws together talented locals from the city and neighboring provinces "
                              "to display their abilities through pageantry, street dancing, sports, and other events.",
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
