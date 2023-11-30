import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Beach/C-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Cultural/C-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Food/C-Food.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Landscape/C-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/festival/C-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Beach/US-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Cultural/US-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Festivals/US-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Foods/US-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Landscapes/US-Landscapes.dart';
import 'package:translate/states/foods_trans.dart';
import 'package:translate/states/pref.dart';
import 'package:translate/states/stt.dart';
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
import 'package:translate/states/user_model.dart';
import 'package:translate/utils/colors.dart';
import 'firebase_options.dart';
import 'states/model.dart';
import 'states/show_hide_model.dart';
import 'states/swap_lang.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Beach/K-Beaches.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Cultural/K-Cultures.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Food/K-Foods.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/Landscape/K-Landscapes.dart';
import 'pages/bottom_nav_pages/discover pages/Korea/festival/K-Festivals.dart';
import 'pages/bottom_nav_pages/trans_language.dart';
import 'pages/intro_page/introduction.dart';
import 'pages/side_menu/privacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MyApp(prefs: prefs));
}

// TODO: change bottom nav need to clear and easily to understand by new user.
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
        ChangeNotifierProvider<CustomId>(
          create: (_) => CustomId(),
        ),
        ChangeNotifierProvider<TranName>(
          create: (_) => TranName(),
        ),
        ChangeNotifierProvider<Check>(
          create: (_) => Check(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              fontFamily: 'gothic',
              primarySwatch: accent,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Babel',
            home: OneTimeWelcomePage(prefs: prefs),
            routes: {
              //'/about': (context) => const About(),
              '/privacy': (context) => const TermOfUse(),
              '/lang': (context) => const SourceLanguage(),
              '/translang': (context) => const LanguagesToTranslate(),
              '/foods': (context) => const Foods(),
              '/cultures': (content) => const Cultures(),
              '/beaches': (content) => const Beaches(),
              '/festivals': (context) => const Festivals(),
              '/landscape': (context) => const Landscapes(),
              '/philippines': (context) => const Philippines(),
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
              '/c-beaches': (context) => const CBeaches(),
              '/c-cultures': (context) => const CCultures(),
              '/c-festivals': (context) => const CFestivals(),
              '/c-foods': (context) => const CFoods(),
              '/c-landscape': (context) => const CLandscapes(),
              '/us-beaches': (context) => const USBeaches(),
              '/us-cultures': (context) => const USCultures(),
              '/us-foods': (context) => const USFoods(),
              '/us-festivals': (context) => const USFestivals(),
              '/us-landscapes': (context) => const USLandscapes(),
            },
          );
        },
      ),
    );
  }
}
