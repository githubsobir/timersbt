import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyAp()));
}

class MyAp extends StatefulWidget {
  @override
  _MyApState createState() => _MyApState();
}

class _MyApState extends State<MyAp> {
  @override
  void initState() {
    // TODO: implement initState
    // tb = TabController(length: 2, vsync: this);
    super.initState();
  }

  int minuteInterval = 0;
  int hour = 3;
  int minute = 20;
  int second = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timeToDisplay = "";
  bool checkTimer = true;
  bool visibleContent = true;
  String hhhh = "0", mmmm, ssss;
  String languageTitle = "Test sinovlari qolgan vaqt";
  double sliderValue = 3;
  double sliderValueMinute = 20;
  int qoshimcha = 0;

  List<Color> myTheme1 = [
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.red,
    Colors.grey.shade200,
  ];

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
        if (timeForTimer % 15 == 0 && qoshimcha == 0) {
          qoshimcha = 1;
          languageTitle = "Test sinovi tugashiga qolgan vaqt";
        } else if(timeForTimer % 15 == 0 && qoshimcha == 1){
          qoshimcha = 0;
          languageTitle = "Осталось время до конца теста";
        }



      });
    });
  }

  void titleText() {
    Future.delayed(Duration(seconds: 30)).then((value) {
      setState(() {});
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0.2, 0.2),
                          )
                        ]),
                    child: Column(
                      children: [
                        Text(
                          "Test turini tanlang",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 170,
                          width: 200,
                          child: ListView.builder(
                            itemCount: langUzb.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('${langUzb[index]}'),
                                leading:
                                    Checkbox(value: true, onChanged: (val) {}),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0.2, 0.2),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.stopwatch,
                              size: screeSizes * 0.1,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200],
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0.2, 0.1),
                                    )
                                  ]),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                " 0$sliderValue : ${sliderValueMinute <= 9 ? "${"0" + sliderValueMinute.round().toString()}" : sliderValueMinute.round().toString()}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 50),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "soat",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Slider(
                              value: sliderValue,
                              min: 0,
                              max: 5,
                              divisions: 5,
                              label: '$sliderValue',
                              onChanged: (value) {
                                setState(
                                  () {
                                    sliderValue = value;
                                    hour = value.round().toInt();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "minut",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Slider(
                              value: sliderValueMinute,
                              min: 5,
                              max: 55,
                              divisions: 55,
                              label: '${sliderValueMinute.round()}',
                              onChanged: (value) {
                                setState(
                                  () {
                                    sliderValueMinute = value;
                                    minute = value.round().toInt();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // showTitle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("DTM"),
              SizedBox(
                height: 40,
                width: 30,
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Text(
              languageTitle,
              style: TextStyle(color: Colors.black, fontSize: screeSize * 0.1),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
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
