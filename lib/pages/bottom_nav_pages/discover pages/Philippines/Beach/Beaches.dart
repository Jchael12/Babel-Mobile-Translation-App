// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconState = {
  'nido': false,
  'lagoon': false,
  'cove': false,
  'kayangan': false,
  'white': false,
  'siargao': false,
  'baler': false,
  'anguib': false,
  'coron': false,
  'lambug': false,
  'mactan': false,
  'malapascua': false,
  'puertogalera': false,
  'puertoprincesa': false,
  'bantayan': false,
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
final key11 = GlobalKey();
final key12 = GlobalKey();
final key13 = GlobalKey();
final key14 = GlobalKey();
final key15 = GlobalKey();

Map<String, GlobalKey> searchMap = {
    'Anguib': key1,
    'Baler': key2,
    'Bantayan': key3,
    'Blue Lagoon': key4,
    'Coron': key5,
    'Crystal Cove': key6,
    'El Nido': key7,
    'Kayangan Lake': key8,
    'Lambug': key9,
    'Mactan Island': key10,
    'Malapascua Island': key11,
    'Puerto Galera': key12,
    'Puerto Princesa': key13,
    'Siargao Island': key14,
    'White Island': key15,
};

class Beaches extends StatefulWidget {
  const Beaches({super.key});

  @override
  State<Beaches> createState() => _BeachesState();
}

class _BeachesState extends State<Beaches> {
  final ScrollController scrollController = ScrollController();
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  late FlutterTts flutterTts;

  // TODO: need to play around in this.
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
        iconState['lagoon'] = false;
        iconState['nido'] = false;
        iconState['cove'] = false;
        iconState['kayangan'] = false;
        iconState['white'] = false;
        iconState['siargao'] = false;
        iconState['baler'] = false;
        iconState['anguib'] = false;
        iconState['coron'] = false;
        iconState['lambug'] = false;
        iconState['mactan'] = false;
        iconState['malapascua'] = false;
        iconState['puertogalera'] = false;
        iconState['puertoprincesa'] = false;
        iconState['bantayan'] = false;
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
            // TODO: some blur images needs to replace.
            SliverToBoxAdapter(
              key: searchMap['Anguib'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 618.h,
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
                            'assets/Beaches/ANGUIB.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Anguib',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['anguib'] = true;
                                  });
                                  await speak('Anguib');
                                },
                                icon: !iconState['anguib']!
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
                            "Anguib Beach is one of the hidden gems of North Luzon. It is probably the northeasternmost beach on the island of Luzon. In fact, my group had to brave ferocious waves in order for us to reach the beach. However, there is a much safe route for those who easily get seasick. You can rent a tricycle or drive directly from Sta. Ana to Anguib Beach. The main difference is the travel time. If you take the boat you'll probably have an hour of travel time compared to the more than an hour's worth of travel time by land.",
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
              key: searchMap['Baler'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 565.h,
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
                            'assets/Beaches/BALER.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Baler',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['baler'] = true;
                                  });
                                  await speak('Baler');
                                },
                                icon: !iconState['baler']!
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
                            "A five-hour trip from Manila will bring you to the coastal hamlet of Baler, where you can stay close to the capital. Another well-liked surfing location without the crowds of Siargao is the township of Baler, which serves as the provincial seat of Aurora. Baler, which is unspoiled and underappreciated, provides both incredible surf and tranquil natural settings.",
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
              key: searchMap['Bantayan'],
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
                            'assets/Beaches/BANTAYAN.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bantayan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['bantayan'] = true;
                                  });
                                  await speak('Bantayan');
                                },
                                icon: !iconState['bantayan']!
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
                            "Bantayan Island in Cebu got its name from the term Bantayan sa Hari, which means 'Watchtowers of the King.' Eighteen watchtowers were built here during the time of the 22nd Governor-General Sebastian Hurtado de Corcuera when Moro pirate raided the island looking for slaves. Folklore says that the people would shout the word 'Bantayan!',which means to 'keep watching,' eventually inspiring the island's name.",
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
              key: searchMap['Blue Lagoon'],
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
                              'assets/Beaches/BLUELAGOON.jpg',
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
                                'Blue Lagoon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['lagoon'] = true;
                                  });
                                  await speak('Blue Lagoon');
                                },
                                icon: !iconState['lagoon']!
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
                            "It takes hours and miles across miles of lush tropical flora, hills, and valleys to get to Pagudpud, which is located somewhere on the northern edge of the country. Without a doubt, Pagudpud is only for the daring, but the exhausting journey is rewarded with a stunning, untouched coastline that appears to go forever.",
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
              key: searchMap['Coron'],
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
                            'assets/Beaches/CORON.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Coron',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['coron'] = true;
                                  });
                                  await speak('Coron');
                                },
                                icon: !iconState['coron']!
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
                            "Coron is a separate group of islands from the main Palawan islands. All of the islands here are part of the Calamian Archipelago in Northern Palawan. Often compared to El Nido, a popular Palawan destination, Coron has a unique charm of its own. While El Nido is popular with couples who want to have their honeymoon in the Philippines and beach lovers, Coron is a bit more laid-back and is suitable for family vacations and diving adventures.",
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
              key: searchMap['Crystal Cove'],
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
                              'assets/Beaches/CRYSTALCOVE.jpg',
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
                                'Crystal Cove',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['cove'] = true;
                                  });
                                  await speak('Crystal Cove');
                                },
                                icon: !iconState['cove']!
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
                            "Crystal Cove Island Resort is a private beach island near Boracay. The main attractions of the island are its 2 coves and white sand beaches, which offer great opportunities ",
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
              key: searchMap['El Nido'],
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
                              'assets/Beaches/ELNIDO.jpg',
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
                                'EL Nido',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['nido'] = true;
                                  });
                                  await speak('EL Nido');
                                },
                                icon: !iconState['nido']!
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
                            "El Nido, which is the well-known region of Palawan, consistently ranks among the world's picturesque beaches, giving it the moniker 'Heaven on Earth'. The beaches and islands of El Nido, look like a hidden adventure since they are surrounded by old limestone cliffs, yet this paradise is actually a well-known getaway.",
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
              key: searchMap['Kayangan Lake'],
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
                              'assets/Beaches/KAYANGAN.jpg',
                              fit: BoxFit.cover,
                              width: 400.w,
                              height: 200.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Kayangan Lake',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['kayangan'] = true;
                                  });
                                  await speak('Kayangan Lake');
                                },
                                icon: !iconState['kayangan']!
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
                            "Kayangan Lake is a crystal-clear freshwater lake in Coron, featuring underwater rocks formations, caves and islets. It's a popular spot for photographers, for fairly obvious reasons, and is said to be the cleanest lake in all of the Philippines. The water is so clear that you can often see down to a depth of 10 metres, enabling even non-swimmers to see the untoched rock formations from viewpoints around the lake.",
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
              key: searchMap['Lambug'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 565.h,
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
                            'assets/Beaches/LAMBUG.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lambug',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['lambug'] = true;
                                  });
                                  await speak('Lambug');
                                },
                                icon: !iconState['lambug']!
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
                            "Lambug Beach is another fine beach shyly located in Badian Municipality, Southwest of Cebu in Barangay Lambug. It is quite popular owing to its pristine while and fine sand and turquoise seawater.",
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
              key: searchMap['Mactan Island'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 570.h,
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
                            'assets/Beaches/MACTAN.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Mactan Island',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['mactan'] = true;
                                  });
                                  await speak('Mactan Island');
                                },
                                icon: !iconState['mactan']!
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
                            "Mactan is a small island located a few kilometers from the east coast of Cebu, opposite the city of the same name. Mactan and Cebu are connected by the Marcelo Fernana and Mactan-Mandaue bridges. The island is part of the province of Cebu and consists of two large cities - Lapu Lapu City and Cordoba. It is on Mactan that Cebu International Airport is located, which is the second most important in the Philippines.",
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
              key: searchMap['Malapascua Island'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 570.h,
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
                            'assets/Beaches/Malapascua.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Malapascua Island',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['malapascua'] = true;
                                  });
                                  await speak('Malapascua Island');
                                },
                                icon: !iconState['malapascua']!
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
                            "Malapascua, which is located in the Visayan Sea to the north of the island of Cebu, is renowned for its crystal-clear waters, powder-soft beaches, and excellent diving. Thresher sharks, coral reefs, and lovely sandy bays are among its most well-known features, all of which may be explored in a single day if you so choose.",
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
              key: searchMap['Puerto Galera'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 570.h,
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
                            'assets/Beaches/PUERTOGALERA.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Puerto Galera',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['puertogalera'] = true;
                                  });
                                  await speak('Puerto Galera');
                                },
                                icon: !iconState['puertogalera']!
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
                            "Puerto Galera is one of those acclaimed towns located on Philippine island of Mindoro which is known for its dive sites and beautiful beaches. When you take a look at the long curve of its White Beach you will find that it is colorfully backed by beautiful bars as well as resorts on its side. It's true that it's a very small town but empowered to entertain the tourists completely with its breathtaking views.",
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
              key: searchMap['Puerto Princesa'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 615.h,
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
                            'assets/Beaches/PUERTOPRINSESA.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Puerto Princesa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['puertoprincesa'] = true;
                                  });
                                  await speak('Puerto Princesa');
                                },
                                icon: !iconState['puertoprincesa']!
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
                            "Puerto Princesa in Palawan is most famous for the Puerto Princesa Subterranean River National Park or the Underground River, a UNESCO World Heritage Site and holds a place in the New7Wonders of Nature.\n\nIt is also the gateway to famous paradise-like destinations in Palawan like El Nido and San Vicente because it has its own international airport. But there's more to Puerto Princesa than being just a jump-off site and location to the famous natural wonder.",
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
              key: searchMap['Siargao Island'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 560.h,
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
                            'assets/Beaches/SIARGAO.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Siargao Island',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['siargao'] = true;
                                  });
                                  await speak('Siargao Island');
                                },
                                icon: !iconState['siargao']!
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
                            "Known as the Surfing Capital of the Philippinesm Siargao flaunts great waves and swells anytime of the year, Uninterrupted winds and currents from the Pacific Ocean creat Siargao's popular waves and the monsoon season enhances the thrill. However, if surfing isn't your thing, Siargao also has a handful of calmer beaches for beach bums.",
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
              key: searchMap['White Island'],
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
                              'assets/Beaches/WHITEISLAND.jpg',
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
                                'White Island',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    iconState['white'] = true;
                                  });
                                  await speak('White Island');
                                },
                                icon: !iconState['white']!
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
                            "A sandbar on the volcanic island of Camiguin makes up the isolated White Island. The sandbar appears like a half-submerged island at low tide. According to Filipino animist, the vista from White Island resembles a celestial route leading to the volcano dominion of the gods.",
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
