// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/states/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateLandscape = {
  'guilin': false,
  'huangshan': false,
  'juizhaigou': false,
  'liriver': false,
  'zhangjiajae': false,
};
final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();

Map<String, GlobalKey> searchMapLandscapes = {
  'Guilin': key1,
  'Huangshan': key2,
  'Juizhaigou': key3,
  'Liriver': key4,
  'Zhangjiajae': key5,
};

class CLandscapes extends StatefulWidget {
  const CLandscapes({super.key});

  @override
  State<CLandscapes> createState() => _CLandscapesState();
}

class _CLandscapesState extends State<CLandscapes> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateLandscape['guilin'] = false;
        iconStateLandscape['huangshan'] = false;
        iconStateLandscape['juizhaigou'] = false;
        iconStateLandscape['liriver'] = false;
        iconStateLandscape['zhangjiajae'] = false;
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
                        builder: (context) => ItemsSearch(map: searchMapLandscapes)),
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
                'assets/Landscape/landscape_bg.jpg',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "L A N D S C A P E S",
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
            key: searchMapLandscapes['Guilin'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 581.h,
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
                            'assets/Landscape/GUILIN.jpeg',
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
                              'Guilin Karst',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateLandscape['guilin'] = true;
                                });
                                speak('Guilin Karst');
                              },
                              icon: !iconStateLandscape['guilin']!
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
                          "The Karst Mountains and caves in Guilin are one of the few places on earth that displays the beauty of huge, naturally forged Karst hills and caves. The hills and caves have been an ancient attraction with some inscriptions on its walls dated 729 AD in the Tang Dynasty. The beauty of the place and its imposing structures made this an almost spiritual place to visit and experience. Today, thousands of people visit the site each year and attracting thousands more as the news of its beauty is being spread all over the world.",
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
            key: searchMapLandscapes['Huangshan'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 760.h,
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
                            'assets/Landscape/HUANGSHAN.jpg',
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
                              'Huangshan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateLandscape['huangshan'] = true;
                                });
                                speak('Huangshan');
                              },
                              icon: !iconStateLandscape['huangshan']!
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
                          "Huangshan (Chinese: 黄山), literally meaning the Yellow Mountain(s), is a mountain range in southern Anhui Province in eastern China. It was originally called “Yishan”, and it was renamed because of a legend that Emperor Xuanyuan once made alchemy here. Vegetation on the range is thickest below 1,100 meters (3,600 ft), with trees growing up to the treeline at 1,800 meters (5,900 ft). The area is well known for its scenery, sunsets, peculiarly-shaped granite peaks, Huangshan pine trees, hot springs, winter snow and views of the clouds from above. Huangshan is a frequent subject of traditional Chinese paintings and literature, as well as modern photography. It is a UNESCO World Heritage Site and one of China's major tourist destinations.",
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
            key: searchMapLandscapes['Juizhaigou'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 693.h,
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
                            'assets/Landscape/JUIZHAIGOU.jpg',
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
                              'Juizhaigou Valley',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateLandscape['juizhaigou'] = true;
                                });
                                speak('Juizhaigou');
                              },
                              icon: !iconStateLandscape['juizhaigou']!
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
                          "Jiuzhaigou ([tɕjòʊ.ʈʂâɪ.kóʊ] (listen); Chinese: 九寨沟; pinyin: Jiǔzhàigōu) is a nature reserve and national park located in the north of Sichuan Province in southwestern China. A long valley running north to south, Jiuzhaigou was inscribed by UNESCO as a World Heritage Site in 1992 and a World Biosphere Reserve in 1997. It belongs to the category V (Protected Landscape) in the IUCN system of protected area categorization.",
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
            key: searchMapLandscapes['Liriver'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 575.h,
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
                            'assets/Landscape/LIRIVER.jpg',
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
                              'Li River',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateLandscape['liriver'] = true;
                                });
                                speak('Li River');
                              },
                              icon: !iconStateLandscape['liriver']!
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
                          "The Li River or Li Jiang (Chinese: 漓江; pinyin: Lí Jiāng) is the name for the upper reaches of the Gui River in northwestern Guangxi, China. It is part of the Xijiang River system in the Pearl River basin, flowing 164 kilometres (102 mi) from Xing'an County to Pingle County.",
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
            key: searchMapLandscapes['Zhangjiajae'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 711.h,
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
                            'assets/Landscape/ZHANGJIAJAE.jpg',
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
                              'Zhangjiajae',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateLandscape['zhangjiajae'] = true;
                                });
                                speak('Zhangjiajae');
                              },
                              icon: !iconStateLandscape['zhangjiajae']!
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
                          "Zhangjiajie National Forest Park (Chinese: 湖南张家界国家森林公园; pinyin: Húnán Zhāngjiājiè Guójiā Sēnlín Gōngyuán; lit. 'Hunan Zhangjiajie National Forest Park') is a national forest park located in Zhangjiajie, Hunan Province, China. It is one of several national parks within the Wulingyuan Scenic Area. In 1982, the park was recognized as China's first national forest park with an area of 4,810 ha (11,900 acres). Zhangjiajie National Forest Park is part of a much larger 397.5 km2 (153.5 sq mi) Wulingyuan Scenic Area. In 1992, Wulingyuan was officially recognized as a UNESCO World Heritage Site.[3] It was then approved by the Ministry of Land and Resources as Zhangjiajie Sandstone Peak Forest National Geopark (3,600 km2 (1,400 sq mi)) in 2001. In 2004, Zhangjiajie geopark was listed as a UNESCO global geopark.",
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
