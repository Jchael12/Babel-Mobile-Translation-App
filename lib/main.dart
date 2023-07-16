import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translate/model/stt.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Beach/F-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Cultural/F-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Festivals/F-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Foods/F-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/france.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Germany/germany.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Japan/Beach/J-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Japan/Cultural/J-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Japan/Food/J-Food.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Japan/Landscape/J-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Japan/festival/J-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Philippines/Beach/Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/china.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Philippines/Cultural/Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Philippines/Food/food.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Japan/japan.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Korea/korea.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Philippines/Landscape/landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Philippines/Philippines.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Philippines/festival/festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Russia/russia.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Spain/spain.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Uae/uae.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/us.dart';
import 'package:translate/utils/colors.dart';
import 'model/model.dart';
import 'model/show_hide_model.dart';
import 'model/swap_lang.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Beach/K-Beaches.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Cultural/K-Cultures.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Food/K-Foods.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Landscape/K-Landscapes.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/festival/K-Festivals.dart';
import 'pages/bottom_nav_pages/trans_language.dart';
import 'pages/intro_page/introduction.dart';
import 'pages/side_menu/about.dart';
import 'pages/side_menu/privacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SourceLanguageModel>(
          create: (_) => SourceLanguageModel(),
        ),
        ChangeNotifierProvider<TranslatedLanguageModel>(
          create: (_) => TranslatedLanguageModel(),
        ),
        ChangeNotifierProvider<ShowState>(
          create: (_) => ShowState(),
        ),
        ChangeNotifierProvider<LanguagesStt>(
          create: (_) => LanguagesStt(),
        ),
        ChangeNotifierProvider<TransLanguageStt>(
          create: (_) => TransLanguageStt(),
        ),
        ChangeNotifierProvider<Swap>(
          create: (_) => Swap(),
        ),
        ChangeNotifierProvider<LanguagesSpokeStt>(
          create: (_) => LanguagesSpokeStt(),
        ),
        ChangeNotifierProvider<GetIndex>(
          create: (_) => GetIndex(),
        ),
        ChangeNotifierProvider<TranslatedText>(
          create: (_) => TranslatedText(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'gothic',
              primarySwatch: accent,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Babel',
            home: OneTimeWelcomePage(prefs: prefs),
            routes: {
              '/about': (context) => const About(),
              '/privacy': (context) => const Privacy(),
              '/lang': (context) => const SourceLanguage(),
              '/translang': (context) => const LanguagesToTranslate(),
              '/foods': (context) => const Foods(),
              '/cultures': (content) => const Cultures(),
              '/beaches': (content) => const Beaches(),
              '/festivals': (context) => const Festivals(),
              '/landscape': (context) => const Landscapes(),
              '/philippines': (context) => const Philippines(),
              '/france': (context) => const France(),
              '/f-beaches': (context) => const FBeaches(),
              '/f-foods': (context) => const FRFoods(),
              '/f-festivals': (context) => const FRFestivals(),
              '/f-cultures': (context) => const FRCultures(),
              '/germany': (context) => const Germany(),
              '/russia': (context) => const Russia(),
              '/spain': (context) => const Spain(),
              '/uae': (context) => const Uae(),
              '/us': (context) => const Us(),
              '/korea': (context) => const Korea(),
              '/k-beaches': (context) => const KBeaches(),
              '/k-cultures': (context) => const KCultures(),
              '/k-festivals': (context) => const KFestivals(),
              '/k-foods': (context) => const KFoods(),
              '/k-landscape': (context) => const KLandscapes(),
              '/japan': (context) => const Japan(),
              '/j-beaches': (context) => const JBeaches(),
              '/j-cultures': (context) => const JCultures(),
              '/j-festivals': (context) => const JFestivals(),
              '/j-foods': (context) => const JFoods(),
              '/j-landscape': (context) => const JLandscapes(),
              '/china': (context) => const China(),
            },
          );
        },
      ),
    );
  }
}
