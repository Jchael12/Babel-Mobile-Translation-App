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
  'barceloneta': false,
  'bolonia': false,
  'concha': false,
  'victoria': false,
  'canteras': false,
  'muro': false,
  'papagayo': false,
  'rodas': false,
  'illetes': false,
  'zahara': false,
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

Map<String, GlobalKey> searchMap = {
  'Barceloneta': key1,
  'Bolonia': key2,
  'Concha': key3,
  'Victoria': key4,
  'Canteras': key5,
  'Muro': key6,
  'Papagayo': key7,
  'Rodas': key8,
  'Illetes': key9,
  'Zahara': key10,
};

final ScrollController scrollController = ScrollController();

class ESBeaches extends StatefulWidget {
  const ESBeaches({super.key});

  @override
  State<ESBeaches> createState() => _ESBeachesState();
}

class _ESBeachesState extends State<ESBeaches> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        iconState['barceloneta'] = false;
        iconState['bolonia'] = false;
        iconState['concha'] = false;
        iconState['victoria'] = false;
        iconState['canteras'] = false;
        iconState['muro'] = false;
        iconState['papagayo'] = false;
        iconState['rodas'] = false;
        iconState['illetes'] = false;
        iconState['zahara'] = false;
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
              key: searchMap['Barceloneta'],
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
                              'assets/Beaches/BARCELONATA.jpg',
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
                                'Playa De Barceloneta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['barceloneta'] = true;
                                  });
                                  speak('Playa De Barceloneta');
                                },
                                icon: !iconState['barceloneta']!
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
                            "La Barceloneta (Catalan pronunciation: [lə βəɾsəluˈnɛtə]) is a neighborhood in the Ciutat Vella district of Barcelona, Catalonia, Spain. The neighborhood was constructed during the 18th century for the residents of the Ribera neighborhood who had been displaced by the construction of the Ciutadella of Barcelona. The neighborhood is roughly triangular, bordered by the Mediterranean Sea, the Moll d'Espanya of Port Vell, and the El Born neighborhood.",
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
              key: searchMap['Bolonia'],
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
                              'assets/Beaches/BOLONIA.jpg',
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
                                'Playa De Bolonia',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['bolonia'] = true;
                                  });
                                  speak('Playa De Bolonia');
                                },
                                icon: !iconState['bolonia']!
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
                            'Bolonia is a coastal village and beach in the municipality of Tarifa in the Province of Cadiz in southern Spain. It is located on the Atlantic shore, 22.9 kilometres (14.2 mi) by road west of Tarifa, but is much closer in terms of coastal distance. The beach and bay is also known as Playa de Bolonia ("Bolonia Beach"), Ensenada de Bolonia ("Bolonia Cove"), or Bolonia Bay. The ruins of the Roman town of Baelo Claudia are located near the beach, considered to be the most complete Roman town ruins yet uncovered in Spain.[1][2] The beach is about 3.8 kilometres (2.4 mi) in length, with an average width of about 70 metres (230 ft). In 2011 it had a population of 117 people.',
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
              key: searchMap['Concha'],
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
                              'assets/Beaches/CONCHA.jpg',
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
                                'Playa De La Concha',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['concha'] = true;
                                  });
                                  speak('Playa De La Concha');
                                },
                                icon: !iconState['concha']!
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
                            'The Beach of La Concha (Basque: Kontxa Hondartza [kontʃa ondarts̻a]; Spanish: Playa de La Concha [ˈplaʝa ðe la ˈkontʃa], "cone shell beach") is a crescent shaped urban seaboard of the city of San Sebastián located at the Bay of La Concha in the Basque Country, in northern Spain. Its name “Concha” is given upon its remarkably regular shape. [1] The scenic setting in the Bay of La Concha and the 19th century elegance of fashionable seaside resorts have made the site very popular, as it is frequently cited as one of the most beautiful and the most famous urban beaches in Europe.',
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
              key: searchMap['Victoria'],
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
                              'assets/Beaches/VICTORIA.jpg',
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
                                'Playa De La Victoria',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['victoria'] = true;
                                  });
                                  speak('Playa De La Victoria');
                                },
                                icon: !iconState['victoria']!
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
                            "La Victoria beach, La Caleta and the small beach of Santa María are a trio of aces when it comes to Cádiz’s urban beaches. But unlike the second two, La Victoria is a holiday destination in its own right. In fact, it has the highest concentration of bars, restaurants, beach bars, hotels and other types of accommodation in the city. It’s visited by hundreds of thousands of people each year who come to enjoy its 3 km of sand, with an average width (at low tide) of almost 200 m.",
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
              key: searchMap['Canteras'],
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
                              'assets/Beaches/CANTERAS.jpg',
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
                                'Playa De Las Canteras',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['canteras'] = true;
                                  });
                                  speak('Playa De Las Canteras');
                                },
                                icon: !iconState['canteras']!
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
                            "The Playa de Las Canteras (Las Canteras beach; 'Beach of the Quarries') is the main urban beach of the city of Las Palmas de Gran Canaria (Gran Canaria, Canary Islands), one of the most important beaches of the Canary Islands. Las Canteras has an Environmental Management System certified according to the UNE-EN ISO 14001 norm and a Universal Accessibility Certificate for bathing services for people with reduced mobility, certified by the same organization.",
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
              key: searchMap['Muro'],
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
                            'assets/Beaches/MURO.jpg',
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
                                'Playa De Muro',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['muro'] = true;
                                  });
                                  speak('Playa De Muro');
                                },
                                icon: !iconState['muro']!
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
                            "Playa de Muro is relatively new holiday destination in the Alcudia Bay, which is located between the two classic destinations of Port d’Alcudia og Ca’n Picafort. An overview of the beach. Playa de Muro is home to an incredibly beautiful beach that is officially divided into two so-called sectors. Sector 1 is more central and offers a full 3-kilometre stretch of beach. The beach is home to white sand and clear water. The water is shallow but not quite as shallow as Port d’Alcudia. On top of that, the risk of waves is a little higher on the beach in Playa de Muro.",
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
              key: searchMap['Papagayo'],
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
                            'assets/Beaches/PAPAGAYO.jpg',
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
                                'Playa De Papagayo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['papagayo'] = true;
                                  });
                                  speak('Playa De Papagayo');
                                },
                                icon: !iconState['papagayo']!
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
                            "In the south of Lanzarote is one of the most popular beaches of the island, Papagayo, a cove of white sand, reduced size and great beauty. In the shape of a bay or shell (some locals prefer to call it the latter), Papagayo wins you over with its crystal clear, emerald green water which remains still all day long just like in a swimming pool. It’s perfect for taking up snorkeling and for enjoying the beauty of its depths or for letting the children splash about without having to worry.",
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
              key: searchMap['Rodas'],
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
                            'assets/Beaches/RODAS.jpg',
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
                                'Playa De Rodas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['rodas'] = true;
                                  });
                                  speak('Playa De Rodas');
                                },
                                icon: !iconState['rodas']!
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
                            "The Beach of Rodas links the two largest islands in Cies: Faro and Monteagudo. Locals refer to this beach as the “tropical beach”, due to the fantastic color of its waters. But this should not mislead you, temperatures in Galicia are not Caribbean-like! But the place is with no doubt the closest to paradise you can get in Europe.",
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
              key: searchMap['Illetes'],
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
                            'assets/Beaches/ILLETES.jpeg',
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
                                'Playa De Ses Illetes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['illetes'] = true;
                                  });
                                  speak('Playa De Ses Illetes');
                                },
                                icon: !iconState['illetes']!
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
                            "Know as one of the most popular beaches in Formentera, playa de ses Illetes is a little slice of heaven due to having the clearest turquoise sea spanning along both sides of the narrow beach. During peak season its gets pretty crowded at Illetes, so if you want a piece of the coveted white sand it pays to get there early, otherwise head to the less populated Llevant, located on the opposite side of the promontory, a few minutes walk away. Ses Illetes is perfect for swimming as the beach gently shelves into the sea, is shallow to quite far out and has 2 patrol towers manned by life-guards during summer.  This makes it great for kids, and there is usually water sports equipment such as Hoby-cats, and kayaks available to hire during peak season.",
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
              key: searchMap['Zahara'],
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
                            'assets/Beaches/ZAHARA.jpg',
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
                                'Playa De Zahara De Los Atunes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    iconState['zahara'] = true;
                                  });
                                  speak('Playa De Zahara De Los Atunes');
                                },
                                icon: !iconState['zahara']!
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
                            "One of the most pristine beaches of our country is precisely and unquestionably, the beach of Zahara. These eight kilometers of coastline, enjoy a special mild climate, which makes them ideal for practicing sports with the sea as the protagonist, but also to enjoy one of the best sunsets in the world, walks both on foot and on horseback and many activities that will delight visitors and tourists from anywhere, here especially welcome.",
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
