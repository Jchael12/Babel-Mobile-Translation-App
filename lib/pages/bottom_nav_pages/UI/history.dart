import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translate/states/user_model.dart';
import 'package:translate/utils/colors.dart';


class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String id = '';

  Stream<List<User>> readUser() {
    if (id.isEmpty) {
      // Return an empty stream or handle the situation appropriately.
      print('id is empty');
      return Stream.value([]);
    } else {
      print('id is not empty ${id}');
      return FirebaseFirestore.instance.collection(id).snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
    }
  }

  Widget buildUser(User user) => Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff393E46),
            ),
            child: Container(
              //padding: const EdgeInsets.all(12),
              height: 120.h,
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {},
                        icon: const Icon(Icons.volume_down_rounded),
                        iconSize: 30,
                        color: const Color(0xff35bbca),
                        splashRadius: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Date and Time"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                              //contentPadding: EdgeInsets.all(16),
                              content: Text(
                                "${user.date} \n${user.time}",
                                style: TextStyle(fontFamily: 'gothic'),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.info_outline_rounded),
                        iconSize: 28,
                        color: const Color(0xff35bbca),
                        splashRadius: 5,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, left: 20.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.text,
                            style: TextStyle(
                              color: const Color(0xffEEEEEE),
                              fontFamily: 'gothic',
                              fontSize: 16.sp,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user.translatedText,
                            style: TextStyle(
                              color: const Color(0xffEEEEEE),
                              fontFamily: 'gothic',
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  getData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString('id');
      if (data != null) {
        setState(() {
          id = data;
        });
        print("[SUCCESS] Retrieved ID from SharedPreferences: $id");
      } else {
        print(
            "[FAILED] Failed to retrieve ID from SharedPreferences. Data is null.");
      }
    } catch (e) {
      print("[ERROR]: Retrieving data from sharedpreferences $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: darkColor,
      child: StreamBuilder<List<User>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            final contents = user.map(buildUser).toList();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: contents.reversed.toList(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
