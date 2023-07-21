import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translate/states/stt.dart';
import 'package:translate/utils/colors.dart';

// TODO: need to retrieve the data in database and display.
class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  getData() {
  SharedPreferences.getInstance().then((prefs) {
    String? data = prefs.getString('id'); // Use 'String?' since getString() returns 'Future<String?>'
    print('Stored data: $data');
    return data;
  });
}

@override
void initState(){
  super.initState();
  getData();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: darkColor,
      child: Consumer<LanguagesSpokeStt>(
        builder: (context, langStt, child) {
          return langStt.history.isEmpty
              ? Center(
                  child: Text(
                    "asd",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'gothic',
                      color: const Color(0xffEEEEEE),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: langStt.history.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (DismissDirection direction) {
                          langStt.removeItemHistory(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff393E46),
                          ),
                          child: langStt.history[index],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
