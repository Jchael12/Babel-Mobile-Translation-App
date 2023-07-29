// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';

import '../custom_click.dart';

class Spain extends StatelessWidget {
  const Spain({super.key});

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
                            destination: '/es-beaches',
                            child: Container(
                              width: 150.w,
                              height: 150.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/bg_contents/spain-beach.png'),
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
                            destination: '/es-cultures',
                            child: Container(
                              width: 150.w,
                              height: 150.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/bg_contents/spain-culture.png'),
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
                              destination: '/es-foods',
                              child: Container(
                                width: 150.w,
                                height: 150.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('assets/bg_contents/spain-food.png'),
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
                              destination: '/es-festivals',
                              child: Container(
                                width: 150.w,
                                height: 150.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/bg_contents/spain-festival.png'),
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
                              destination: '/es-landscapes',
                              child: Container(
                                width: 150.w,
                                height: 150.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/bg_contents/spain-landscape.png'),
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
        ));
  }
}
