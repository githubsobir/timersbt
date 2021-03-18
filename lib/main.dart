import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MaterialApp(home: MyAp()));
}

class MyAp extends StatefulWidget {
  @override
  _MyApState createState() => _MyApState();
}

class _MyApState extends State<MyAp> {
  TabController tb;

  @override
  void initState() {
    // TODO: implement initState
    // tb = TabController(length: 2, vsync: this);
    super.initState();
  }

  int minuteInterval = 0;
  int hour = 0;
  int minute = 0;
  int second = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timeToDisplay = "";
  bool checkTimer = true;
  bool visibleContent = true;
  String hhhh = "0", mmmm, ssss;
  String languageTitle = "";

  List<String> langUzb = [
    "Chet tili sefr",
    "Katta test",
    "Test 3",
  ];
  List<String> langRus = [
    "Sefr иностранного языка",
    "Большой тест",
    "Тест 3",
  ];

  showTitle() {
    Duration(seconds: 10);
    setState(() {
      languageTitle = langUzb[0];
    });
    showTitle2();
  }

  showTitle2() {
    Duration(seconds: 10);
    setState(() {
      languageTitle = langRus[0];
    });
    showTitle();
  }

  void start() {
    setState(() {
      visibleContent = false;
      started = false;
      stopped = false;
      checkTimer = true;
    });
    if (timeForTimer == 0)
      timeForTimer = ((hour * 60 * 60) + (minute * 60) + second);
    // debugPrint(timeForTimer.toString());
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeForTimer < 1 || checkTimer == false) {
          timer.cancel();
          if (timeForTimer == 0) {
            debugPrint("Stopped by default");
          }
          //  Navgation vaqt tugaganda

        } else if (timeForTimer < 60) {
          // timeToDisplay = timeForTimer.toString();
          timeToDisplay =
              timeToDisplay = timeShows(h: 0, m: 0, s: timeForTimer);
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          // timeToDisplay = m.toString() + ":" + s.toString();
          timeToDisplay = timeShows(h: 0, m: m, s: s);
          timeForTimer = timeForTimer - 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);

          timeToDisplay = timeShows(h: h, m: m, s: s);
          // ((h < 10) ? ("0" + h.toString()) : h.toString()) +
          // ":" +
          // ((m < 10) ? ("0" + m.toString()) : m.toString()) +
          // ":" +
          // ((s < 10) ? ("0" + s.toString()) : s.toString());

          timeForTimer = timeForTimer - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      visibleContent = true;
      started = true;
      stopped = true;
      checkTimer = false;
    });
  }

  String timeShows({int h, int m, int s}) {
    if (h < 10) {
      hhhh = "0" + h.toString();
    } else if (h == 0) {
      hhhh = "00";
    } else {
      hhhh = h.toString();
    }

    if (m <= 9) {
      mmmm = "0" + m.toString();
    } else if (m == 0 || m == null) {
      mmmm = "00";
    } else {
      mmmm = m.toString();
    }
    if (s <= 9) {
      ssss = "0" + s.toString();
    } else if (s == 0 || s == null) {
      ssss = "00";
    } else {
      ssss = s.toString();
    }

    print("$hhhh : $mmmm : $ssss");
    return "$hhhh : $mmmm : $ssss";
  }

  Widget timer({double screeSizes}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            timeToDisplay,
            style: TextStyle(
                fontSize: screeSizes * 0.22, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: started ? start : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                color: Colors.green,
                child: Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: stopped ? null : stop,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Stop",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: visibleContent,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0.2,0.2),
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Text("Test turini tanlang", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      Container(
                        height:170,
                          width: 200,


                          child:ListView.builder(
                            itemCount: langUzb.length,
                            itemBuilder: (context, index) {
                            return ListTile(

                                title: Text('${langUzb[index]}'),
                                leading: Checkbox(value: true, onChanged:(val){}),
                                );
                          },),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200,
                      blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0.2,0.2),
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("Soat", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          ),
                          NumberPicker(
                            minValue: 0,

                            selectedTextStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30
                            ),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                            maxValue: 4,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent, width: 2)
                            ),
                            value: hour,
                            onChanged: (val) {
                              setState(() {

                                hour = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("Minut",  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          ),

                          NumberPicker(
                            minValue: 0,
                            step: 10,
                            selectedTextStyle: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30
                            ),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                            maxValue: 59,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent, width: 2)
                            ),
                            value: minute,
                            onChanged: (val) {
                              setState(() {
                                minute = val;
                              });
                            },
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsets.only(bottom: 10),
                      //       child: Text("Sekund"),
                      //     ),
                      //     NumberPicker(
                      //       minValue: 0,
                      //       step: 10,
                      //       textStyle: TextStyle(
                      //           fontSize: 15, fontWeight: FontWeight.w600),
                      //       maxValue: 59,
                      //       value: second,
                      //       onChanged: (val) {
                      //         setState(() {
                      //           second = val;
                      //         });
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screeSize = screenWidth * screenHeight * 0.0008;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("DTM Timer"),
      //   bottom: TabBar(
      //     tabs: <Widget>[
      //       Text("Timer"),
      //       Text("StopTimer"),
      //     ],
      //     labelPadding: EdgeInsets.only(bottom: 10),
      //     labelStyle: TextStyle(fontSize: 18),
      //     unselectedLabelColor: Colors.red,
      //     controller: tb,
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // showTitle(),

          Expanded(
            flex:1,
            child: Text(
              "languageTitle",
              style: TextStyle(color: Colors.black, fontSize: screeSize*0.1),
            ),
          ),
          Expanded(flex: 3, child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              timer(screeSizes: screeSize),
            ],
          )),
          //
          // Text("StopTimer"),
        ],
      ),
    );
  }
}
