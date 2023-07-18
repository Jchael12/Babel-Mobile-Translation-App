import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';
import 'pages/bottom_nav_pages/UI/speech.dart';
import 'pages/bottom_nav_pages/UI/default_page.dart';
import 'pages/bottom_nav_pages/UI/discover.dart';
import 'pages/bottom_nav_pages/UI/history.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //index
  int currentIndex = 0;

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages = [
    const DefaultPage(),
    const Conversation(),
    const History(),
    const Discover(),
  ];

  TextStyle myTextStyle = const TextStyle(
    fontFamily: 'Space',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: const BoxDecoration(
            color: darkColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: GNav(
              backgroundColor: darkColor,
              color: const Color(0xff131316),
              activeColor: Colors.white,
              gap: 20,
              textStyle: const TextStyle(
                fontFamily: 'Space',
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              padding: const EdgeInsets.all(17),
              selectedIndex: currentIndex,
              onTabChange: (index) {
                updateIndex(index);
                debugPrint('Current Index: $currentIndex');
              },
              //padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Color(0xFF006A60),
                  backgroundColor: Color(0xFFff9190),
                ),
                GButton(
                  icon: Icons.mic_external_on_outlined,
                  text: 'Speech',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Colors.amber,
                  backgroundColor: Colors.orange,
                ),
                GButton(
                  icon: Icons.history,
                  text: 'Recent',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Colors.indigoAccent,
                  backgroundColor: Colors.indigoAccent,
                ),
                GButton(
                  icon: Icons.travel_explore_rounded,
                  text: 'Discover',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Color(0xff35bbca),
                  backgroundColor: Color(0xff35bbca),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          "Babel: Translation App",
          style: TextStyle(
            fontFamily: 'gothic',
            fontSize: 17.sp,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
            //canvasColor: ThemeManager.isDarkMode ? darkColor : mcgpalette0,
            ),
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SafeArea(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Babel.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // ListTile(
              //   leading: Icon(
              //     Icons.home_filled,
              //     color: currentIndex == 0 ? Colors.grey : darkColor,
              //   ),
              //   title: Text(
              //     "Home",
              //     style: TextStyle(
              //       fontFamily: 'GothicA1',
              //       fontSize: 15.sp,
              //       color: darkColor,
              //     ),
              //   ),
              //   selected: currentIndex == 0,
              //   selectedColor: Colors.grey,
              //   selectedTileColor: Colors.grey[300],
              //   onTap: () {
              //     Navigator.pop(context);
              //     updateIndex(0);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(
              //     Icons.mic_external_on_rounded,
              //     color: currentIndex == 1 ? Colors.grey : darkColor,
              //   ),
              //   title: Text(
              //     "Speech",
              //     style: TextStyle(
              //       fontFamily: 'GothicA1',
              //       fontSize: 15.sp,
              //       color: darkColor,
              //     ),
              //   ),
              //   selected: currentIndex == 1,
              //   selectedColor: Colors.grey,
              //   selectedTileColor: Colors.grey[300],
              //   onTap: () {
              //     Navigator.pop(context);
              //     updateIndex(1);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(
              //     Icons.history,
              //     color: currentIndex == 2 ? Colors.grey : darkColor,
              //   ),
              //   title: Text(
              //     "Recent",
              //     style: TextStyle(
              //       fontFamily: 'GothicA1',
              //       fontSize: 15.sp,
              //       color: darkColor,
              //     ),
              //   ),
              //   selected: currentIndex == 2,
              //   selectedColor: Colors.grey,
              //   selectedTileColor: Colors.grey[300],
              //   onTap: () {
              //     Navigator.pop(context);
              //     updateIndex(2);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(
              //     Icons.travel_explore_rounded,
              //     color: currentIndex == 3 ? Colors.grey : darkColor,
              //   ),
              //   title: Text(
              //     "Discover",
              //     style: TextStyle(
              //       fontFamily: 'GothicA1',
              //       fontSize: 15.sp,
              //       color: currentIndex == 3 ? Colors.grey : darkColor,
              //     ),
              //   ),
              //   selected: currentIndex == 3,
              //   selectedColor: Colors.grey,
              //   selectedTileColor: Colors.grey[300],
              //   onTap: () {
              //     Navigator.pop(context);
              //     updateIndex(3);
              //   },
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // Divider(
              //   color: Colors.grey,
              //   indent: 10,
              //   endIndent: 10,
              // ),
              ListTile(
                selectedColor: Colors.grey,
                leading: const Icon(
                  Icons.book_rounded,
                  color: darkColor,
                ),
                title: Text(
                  'Phrasebook',
                  style: TextStyle(
                    fontFamily: 'GothicA1',
                    fontSize: 15.sp,
                    color: darkColor,
                  ),
                ),
                selectedTileColor: Colors.grey[300],
                onTap: () {},
              ),
              Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: const Icon(
                  Icons.three_p_rounded,
                  color: darkColor,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'GothicA1',
                    fontSize: 15.sp,
                    color: darkColor,
                  ),
                ),
                selectedTileColor: Colors.grey[300],
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: const Icon(
                  Icons.feedback_rounded,
                  color: darkColor,
                ),
                title: Text(
                  'Feedback',
                  style: TextStyle(
                    fontFamily: 'GothicA1',
                    fontSize: 15.sp,
                    color: darkColor,
                  ),
                ),
                selectedTileColor: Colors.grey[300],
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.security,
                  color: darkColor,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontFamily: 'GothicA1',
                    fontSize: 15.sp,
                    color: darkColor,
                  ),
                ),
                selectedTileColor: Colors.grey[400],
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/privacy');
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}
