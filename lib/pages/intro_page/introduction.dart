import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:translate/home.dart';
import 'package:lottie/lottie.dart';
import 'package:translate/model/show_hide_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page_one.dart';
//import 'page_three.dart';
import 'page_two.dart';

class OneTimeWelcomePage extends StatelessWidget {
  final SharedPreferences prefs;

  const OneTimeWelcomePage({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasShownWelcomePage = prefs.getBool('hasShownWelcomePage') ?? false;

    if (hasShownWelcomePage) {
      return const HomePage();
    } else {
      prefs.setBool('hasShownWelcomePage', true);
      return const Introduction();
    }
  }
}

final PageController controllerPage = PageController();

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == 1);
                });
              },
              controller: controllerPage,
              children: const [
                // pages
                PageOne(),
                PageTwo(),
                //PageThree(),
              ],
            ),
            isLastPage ? const GetStartedBtn() : const NextBtn(),
            isLastPage
                ? SizedBox(
                    child: Consumer<ShowState>(builder: (context, data, child) {
                      return Visibility(
                        visible: !data.isShowed,
                        child: const Loading(),
                      );
                    }),
                  )
                : const SizedBox(),
            Container(
              alignment: const Alignment(0, 0.65),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // page controller

                  PageIndicator(),

                  // page controller
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatefulWidget {
  const PageIndicator({super.key});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controllerPage,
      count: 2,
      effect: const SlideEffect(
          spacing: 10.0,
          radius: 8.0,
          dotWidth: 24.0,
          dotHeight: 12.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 2.0,
          dotColor: Colors.grey,
          activeDotColor: Colors.indigoAccent),
    );
  }
}

class GetStartedBtn extends StatefulWidget {
  const GetStartedBtn({super.key});

  @override
  State<GetStartedBtn> createState() => _GetStartedBtnState();
}

class _GetStartedBtnState extends State<GetStartedBtn> {
  @override
  Widget build(BuildContext context) {
    var varShow = Provider.of<ShowState>(context, listen: false);

    void sleep() {
      Future.delayed(const Duration(seconds: 5), () {
        // code here you want to do after sleep
        debugPrint('This code execute');
        debugPrint(varShow.show.toString());
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }

    return Consumer<ShowState>(builder: (context, data, child) {
      return Visibility(
        visible: data.isShowed,
        child: Align(
          alignment: const Alignment(0, 0.85),
          child: SizedBox(
            width: 200,
            height: 150,
            child: ElevatedButton(
              onPressed: () {
                sleep();
                debugPrint('This also code execute');
                varShow.setShow(false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB5CFBC),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: "RobotoFlex",
                  color: Color(0xff0C2924),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class NextBtn extends StatelessWidget {
  const NextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // top: 625,
    // left: 80,

    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: 200,
        child: OutlinedButton(
          onPressed: () {
            controllerPage.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xffB5CFBC),
            side: const BorderSide(
              width: 1,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            foregroundColor: Colors.white,
          ),
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "RobotoFlex",
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.88),
      child: Lottie.asset(
        'assets/lottie/loading.json',
        width: 70.w,
        height: 70.h,
      ),
    );
  }
}
