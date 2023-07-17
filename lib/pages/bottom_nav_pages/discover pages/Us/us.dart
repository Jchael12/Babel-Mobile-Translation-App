// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';

import '../custom_click.dart';

class Us extends StatelessWidget {
  const Us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff222831),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Clickable(
                          destination: '/us-beaches',
                          child: Container(
                            width: 150.w,
                            height: 150.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/Beaches/BC.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              'Beaches',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'gothic',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Clickable(
                          destination: '/us-cultures',
                          child: Container(
                            width: 150.w,
                            height: 150.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/Cultural/CAC.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              'Culutural Attraction',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'gothic',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Clickable(
                            destination: '/us-foods',
                            child: Container(
                              width: 150.w,
                              height: 150.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/Foods/FDC.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                'Food Delicacy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'gothic',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Clickable(
                            destination: '/us-festivals',
                            child: Container(
                              width: 150.w,
                              height: 150.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/Festival/festival_bg.jpg'),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                'Festivals',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'gothic',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h, bottom: 50.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Clickable(
                            destination: '/us-landscapes',
                            child: Container(
                              width: 150.w,
                              height: 150.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/Landscape/landscape_bg.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Text(
                                'Landscape',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'gothic',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
