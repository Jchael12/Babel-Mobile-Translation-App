import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List<Country> countries = [
    Country(name: 'China', image: 'assets/flag/china.png', route: '/china'),
    Country(name: 'France', image: 'assets/flag/france.png', route: '/france'),
    Country(name: 'Germany', image: 'assets/flag/germany.png', route: '/germany'),
    Country(name: 'Japan', image: 'assets/flag/japan.png', route: '/japan'),
    Country(name: 'Korea', image: 'assets/flag/korea.png', route: '/korea'),
    Country(name: 'Philippines', image: 'assets/flag/ph.png', route: '/philippines'),
    Country(name: 'Russia', image: 'assets/flag/russia.png', route: '/russia'),
    Country(name: 'Spain', image: 'assets/flag/spain.png', route: '/spain'),
    Country(name: 'United Arab Emirates', image: 'assets/flag/uae.png', route: '/uae'),
    Country(name: 'United States', image: 'assets/flag/usa.png', route: '/us'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff222831),
        child: Padding(
          padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 50,
            ),
            itemCount: countries.length,
            itemBuilder: (context, int index) {
              String name = countries[index].name;
              String image = countries[index].image;
              String destination = countries[index].route;
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, destination);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gothic',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class Country {
  final String name;
  final String image;
  final String route;

  Country({required this.name, required this.image, required this.route});
}
