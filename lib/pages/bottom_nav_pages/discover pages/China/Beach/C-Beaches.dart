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
  'nido': false,
  'lagoon': false,
  'cove': false,
  'kayangan': false,
  'white': false,
  'siargao': false,
  'baler': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();
final key6 = GlobalKey();
final key7 = GlobalKey();

Map<String, GlobalKey> searchMap = {
  'El Nido': key1,
  'Blue Lagoon': key2,
  'Crystal Cove': key3,
  'Kayangan Lake': key4,
  'White Island': key5,
  'Siargao Island': key6,
  'Baler': key7,
};

final ScrollController scrollController = ScrollController();

class Beaches extends StatefulWidget {
  const Beaches({super.key});

  @override
  State<Beaches> createState() => _BeachesState();
}

class _BeachesState extends State<Beaches> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
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
                                onPressed: () {
                                  setState(() {
                                    iconState['nido'] = true;
                                  });
                                  speak('EL Nido');
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
                                onPressed: () {
                                  setState(() {
                                    iconState['lagoon'] = true;
                                  });
                                  speak('Blue Lagoon');
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
                                onPressed: () {
                                  setState(() {
                                    iconState['cove'] = true;
                                  });
                                  speak('Crystal Cove');
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
                                onPressed: () {
                                  setState(() {
                                    iconState['kayangan'] = true;
                                  });
                                  speak('Kayangan Lake');
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
                                onPressed: () {
                                  setState(() {
                                    iconState['white'] = true;
                                  });
                                  speak('White Island');
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
                                onPressed: () {
                                  setState(() {
                                    iconState['siargao'] = true;
                                  });
                                  speak('Siargao Island');
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
                                onPressed: () {
                                  setState(() {
                                    iconState['baler'] = true;
                                  });
                                  speak('Baler');
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
          ],
        ),
      );
    });
  }
}


