import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Beach/C-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Cultural/C-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Food/C-Food.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/Landscape/C-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/China/festival/C-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Germany/Beaches/G-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Germany/Cultural/G-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Germany/Festival/G-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Germany/Food/G-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Germany/Landscape/G-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Russia/Beaches/R-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Russia/Cultural/R-Cultural.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Russia/Festival/R-Festival.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Russia/Food/R-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Russia/Landscape/R-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Spain/Beaches/ES-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Spain/Cultural/ES-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Spain/Festivals/ES-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Spain/Foods/ES-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Spain/Landscapes/ES-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Uae/Beaches/UAE-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Uae/Cultural/UAE-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Uae/Festival/UAE-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Uae/Food/UAE-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Uae/Landscape/UAE-Landscapes.dart';
import 'package:translate/states/stt.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Beach/F-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Cultural/F-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Festivals/F-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Foods/F-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/France/Landscapes/F-Landscapes.dart';
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
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Beach/US-Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Cultural/US-Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Festivals/US-Festivals.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Foods/US-Foods.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/Landscapes/US-Landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Us/us.dart';
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
        ChangeNotifierProvider<CustomId>(
          create: (_) => CustomId(),
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
              '/france': (context) => const France(),
              '/f-beaches': (context) => const FBeaches(),
              '/f-foods': (context) => const FRFoods(),
              '/f-festivals': (context) => const FRFestivals(),
              '/f-cultures': (context) => const FRCultures(),
              '/f-landscape': (context) => const FRLandscapes(),
              '/germany': (context) => const Germany(),
              '/g-beaches': (context) => const GBeaches(),
              '/g-foods': (context) => const GFoods(),
              '/g-festivals': (context) => const GFestivals(),
              '/g-cultures': (context) => const GCultures(),
              '/g-landscape': (context) => const GLandscapes(),
              '/russia': (context) => const Russia(),
              '/r-beaches': (context) => const RBeaches(),
              '/r-foods': (context) => const RFoods(),
              '/r-festivals': (context) => const RFestivals(),
              '/r-cultures': (context) => const RCultures(),
              '/r-landscape': (context) => const RLandscapes(),
              '/spain': (context) => const Spain(),
              '/es-beaches': (context) => const ESBeaches(),
              '/es-foods': (context) => const ESFoods(),
              '/es-landscapes': (context) => const ESLandscapes(),
              '/es-festivals': (context) => const ESFestivals(),
              '/es-cultures': (context) => const ESCultures(),
              '/uae': (context) => const UAE(),
              '/uae-beaches': (context) => const UABeaches(),
              '/uae-foods': (context) => const UAFoods(),
              '/uae-landscapes': (context) => const UAELandscapes(),
              '/uae-festivals': (context) => const UAFestivals(),
              '/uae-cultures': (context) => const UACultures(),
              '/us': (context) => const Us(),
              '/us-beaches': (context) => const USBeaches(),
              '/us-foods': (context) => const USFoods(),
              '/us-landscapes': (context) => const USLandscapes(),
              '/us-festivals': (context) => const USFestivals(),
              '/us-cultures': (context) => const USCultures(),
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
            },
          );
        },
      ),
    );
  }
}
