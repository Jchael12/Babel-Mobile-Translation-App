// ignore_for_file: file_names
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconState = {
  'surfyy': false,
  'gwakji': false,
  'jangho': false,
  'sokcho': false,
  'jeongdongjin': false,
  'cheongsihaeng': false,
  'wonpyeong': false,
  'yeongildae': false,
  'daecheon': false,
  'haeundae': false,
  'gwangalli': false,
};

final key1 = GlobalKey();

final ScrollController scrollController = ScrollController();

class KBeaches extends StatefulWidget {
  const KBeaches({super.key});

  @override
  State<KBeaches> createState() => _KBeachesState();
}

class _KBeachesState extends State<KBeaches> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconState['surfyy'] = false;
        iconState['gwakji'] = false;
        iconState['jangho'] = false;
        iconState['sokcho'] = false;
        iconState['jeongdongjin'] = false;
        iconState['cheongsihaeng'] = false;
        iconState['yeongildae'] = false;
        iconState['wonpyeong'] = false;
        iconState['boryeong'] = false;
        iconState['haeundae'] = false;
        iconState['gwangalli'] = false;
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ItemsSearch(map: searchMap)),
                    // );
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
                  'assets/Beaches/KBC.png',
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
              //key: searchMap['Gangwon-do'],
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
                              'assets/Beaches/SURFYBEACH.png',
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
                                'Gangwon-Do Surfyy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['surfyy'] = true;
                                  });
                                  speak('Surfyy');
                                },
                                icon: !iconState['surfyy']!
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
                            "Surfyy Beach is the perfect summer vacation spot for those who enjoy sun, sand, and waves. The food is also excellent, with plenty of seafood options. And if you're looking for a place to stay, plenty of accomodation options are available. from camping to hotels.",
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
              //key: searchMap['Gangwon-do'],
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
                              'assets/Beaches/GWAKJI.png',
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
                                'Gwakji',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['surfyy'] = true;
                                  });
                                  speak('Surfyy');
                                },
                                icon: !iconState['surfyy']!
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
                            "Gwakji Gwamul Beach is one of the favorite beaches for Jeju Islands residents and visitors, not from this beautiful island located in Aewol-eup. Gwakji Beach is known for its expansive beach area and sandy shore. Being away from the Jeju City and populated area, the beach is proud of its crystal clear water.",
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
              //key: searchMap['Sokcho'],
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
                              'assets/Beaches/JANGHO.png',
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
                                'Jangho',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['jangho'] = true;
                                  });
                                  speak('Jangho');
                                },
                                icon: !iconState['jangho']!
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
                            "Jangho Beach is a beautiful beach located on the eastcoast of Korea in Samcheok. Jangho Beach is famous for its serene view and especially the crystal clear water! Commonly referred to as the Naples of Korea, this is definitively one of the must visit beaches in summer.", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
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
                              'assets/Beaches/SOKCHO.png',
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
                                'Sokcho',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['sokcho'] = true;
                                  });
                                  speak('Sokcho');
                                },
                                icon: !iconState['sokcho']!
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
                            "Sokcho Beach is a pristine coastline that stretches around 2km in length. Dipping your toes in the refreshing East Sea should be the first thing you do when you arrive in Sokcho, especially considering that the bus terminal is a short hop from the beach entrance.", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
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
                              'assets/Beaches/JEONGDONGJIN.png',
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
                                'Jeongdongjin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['jeongdongjin'] = true;
                                  });
                                  speak('Jeongdongjin');
                                },
                                icon: !iconState['jeongdongjin']!
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
                            "Jeongdongjin Beach is a nice, sandy beach that stretches over 250 meters with three major swimming spots: in front of Jeongdongjin Station, by Sandglass Park, and by the Jeongdongjin Breakwater. The spots near the railway station and by the park  are more popular because they are spacious and easy to reach.  ", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
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
                              'assets/Beaches/YEONGILDAE.png',
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
                                'Yeongildae',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['yeongildae'] = true;
                                  });
                                  speak('Yeongildae');
                                },
                                icon: !iconState['yeongildae']!
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
                            "The beach is located in Ganggang-dong, Buk-gu, Pohang-si, Gyeongsangbuk-do, Douhu-dong. It is a representative beach in Pohang. It was reopened in 1975 and used the name of the northern beach of Pohang. In June 2013, it was changed to the current name.", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 550.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Padding( padding: EdgeInsets.all(20.0.w),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/Beaches/WONPYEONG.png',
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
                                'Wonpyeong',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['wonpyeong'] = true;
                                  });
                                  speak('Wonpyeong');
                                },
                                icon: !iconState['wonpyeong']!
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
                            "Wonpyeong Beach, adjacent to Gungchon Beach, has a dense pine tree forest. Behind the beach area, you will find a marine bike railway. In particular, enjoying the water while camping in the thick pine trees is popular with family vacationers", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 550.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Padding( padding: EdgeInsets.all(20.0.w),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/Beaches/DAECHEON.png',
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
                                'Daecheon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['daecheon'] = true;
                                  });
                                  speak('Daecheon');
                                },
                                icon: !iconState['daecheon']!
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
                            "Daecheon Beach, located in Boryeong-si, Chungcheongnam-do, is a 3.5 kilometer-long, 100 meter-wide sandy beach. It is famous for its white sand mostly made from shells(instead of silica, like most beaches). In particular, it is also home for the annual Boryeong Mud Festival.", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 550.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Padding( padding: EdgeInsets.all(20.0.w),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/Beaches/HAEUNDAE.png',
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
                                'Haeundae',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['haeundae'] = true;
                                  });
                                  speak('Haeundae');
                                },
                                icon: !iconState['haeundae']!
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
                            "Haeundae Beach is the most famous beach in Busan. The white sand beach is roughly 1.5 kilometer-long, over a 30-50 meter wide area, creating a beautiful coastline before a shallow bay, making it perfect for swimming.", textAlign: TextAlign.justify, style: TextStyle(
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
              //key: searchMap['Sokcho'],
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Container(
                  height: 550.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Padding( padding: EdgeInsets.all(20.0.w),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/Beaches/GWANGALLI.png',
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
                                'Gwangalli',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['gwangalli'] = true;
                                  });
                                  speak('Gwangalli');
                                },
                                icon: !iconState['gwangalli']!
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
                            "Gwangalli Beach or Gwangan Beach is a beach in Busan, South Korea. It is located at Gwangan 2 Suryeong-gu, Busan Metropolitan City, west of Haeundae Beach. It sits inside a cove spanned by the Gwangan Bridge and covers 82,000 square meteres over a length of 1.4 km and a width of 25 - 110 metres.", textAlign: TextAlign.justify, style: TextStyle(
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
    },);
  }
}
