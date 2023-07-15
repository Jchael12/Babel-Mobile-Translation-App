import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';
import 'package:lottie/lottie.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: darkColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Text(
              "Babel: Translation App",
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'gothic',
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: SizedBox(
              width: 240.w,
              height: 240.h,
              child: Lottie.asset('assets/lottie/2.json'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
            child: Text(
              'With our mobile application, explore a whole new world and find amazing places that will motivate you to journey all through the globe!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'gothic',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
