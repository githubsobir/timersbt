import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyAp()));
}

class MyAp extends StatefulWidget {
  @override
  _MyApState createState() => _MyApState();
}

class _MyApState extends State<MyAp> {

  int minuteInterval = 0;
  int hour = 3;
  int minute = 20;
  int second = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 12000;
  String timeToDisplay = "03:20:00";
  bool checkTimer = true;
  bool visibleContent = true;
  String hhhh = "0", mmmm, ssss;
  String languageTitle = "Test sinovlari qolgan vaqt";
  double sliderValue = 3;
  double sliderValueMinute = 20;
  int qoshimcha = 0;
  int colorIndex = 0;
  bool changeTimerValue = false;
  int timerPause;


  List<Color> myTheme1 = [
    // #index1
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.red,
    Colors.grey.shade200,
    // #index2
    Colors.white,
    Colors.black,
    Colors.grey,
    Colors.red,
    Colors.grey.shade200,
    // #index3,
    Colors.yellow,
    Colors.black,
    Colors.grey,
    Colors.red,
    Colors.grey.shade200,
  ];

  void start() {

    setState(() {
      visibleContent = false;
      started = false;
      stopped = false;
      checkTimer = true;


    });
    if (changeTimerValue )
      timeForTimer = ((hour * 60 * 60) + (minute * 60) + second);
    // debugPrint(timeForTimer.toString());
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeForTimer == 0 || checkTimer == false) {
          timer.cancel();
          if (timeForTimer == 0) {
            debugPrint("Stopped by default");
          }
          //  Navgation vaqt tugaganda

        } else if (timeForTimer < 60) {

          timeForTimer = timeForTimer - 1;
          timeToDisplay = timeShows(h: 0, m: 0, s: timeForTimer);
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);


          timeForTimer = timeForTimer - 1;
          timeToDisplay = timeShows(h: 0, m: m, s: s);
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);

          timeForTimer = timeForTimer - 1;
          timeToDisplay = timeShows(h: h, m: m, s: s);
        }

        if (timeForTimer < 1 ) languageTitle = "Test sinovi tugadi";
        if (timeForTimer % 10 == 0 && qoshimcha == 0 && timeForTimer > 1) {
          qoshimcha = 1;
          languageTitle = "Test sinovi tugashiga qolgan vaqt";
        } else if (timeForTimer % 10 == 0 && qoshimcha == 1 && timeForTimer > 1) {
          qoshimcha = 0;
          languageTitle = "Осталось время до конца теста";
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
    } else if (s < 1) {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height:80,
          ),
          Text(
            timeToDisplay,
            style: TextStyle(
                fontSize: screeSizes * 0.3,color: myTheme1[0+colorIndex], fontWeight: FontWeight.w700),
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
                        color: myTheme1[1+colorIndex],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: myTheme1[4+colorIndex],
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0.2, 0.2),
                          )
                        ]),
                    child: Column(
                      children: [
                        Text(
                          "Dastur fonini tanlang",
                          style: TextStyle(
                              color: myTheme1[0 + colorIndex], fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          height: 120,
                          width: 150,
                          child:Column(
                            children: [
                              GroupButton(
                                isRadio: true,
                                spacing: 10,
                                buttonWidth: 140 ,

                                onSelected: (index, isSelected){
                                  if(index == 0){
                                    setState(() {
                                      colorIndex = 0;
                                    });
                                  } else if(index == 1){
                                    setState(() {
                                      colorIndex = 5;
                                    });
                                  } else if(index == 2){
                                    setState(() {
                                      colorIndex = 10;
                                    });
                                  }

                                },
                                buttons: [" tema 1", "tema 2", "tema 3", ],
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 270,
                    height: 210,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: myTheme1[1+colorIndex],
                        boxShadow: [
                          BoxShadow(
                            color: myTheme1[4+colorIndex],
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
                              size: 60,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: myTheme1[1+colorIndex],
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
                                " 0${sliderValue.round().toInt()} : ${sliderValueMinute <= 9 ? "${"0" + sliderValueMinute.round().toString()}" : sliderValueMinute.round().toString()}",
                                style: TextStyle(
                                    color: myTheme1[0+colorIndex], fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "soat",
                              style: TextStyle(
                                  color: myTheme1[0 + colorIndex],
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Slider(
                              value: sliderValue,
                              min: 0,
                              max: 5,
                              activeColor: myTheme1[0+colorIndex],
                              divisions: 5,
                              label: '$sliderValue',
                              onChanged: (value) {
                                setState(
                                  () {
                                    sliderValue = value;
                                    languageTitle = "Test sinovlari qolgan vaqt";
                                    changeTimerValue = true;
                                    hour = value.round().toInt();
                                    //###

                                    timeToDisplay =
                                        "0$hour:${minute.round().toInt() <= 9 ? "0" + minute.round().toString() : minute.round().toString()}: 00";

                                    // timeShows(h:value.round().toInt(), m: minute );
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
                                  color:myTheme1[0+colorIndex],
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Slider(
                              value: sliderValueMinute,
                              min: 0,
                              max: 55,

                              activeColor: myTheme1[0+colorIndex],
                              divisions: 55,

                              label: '${sliderValueMinute.round()}',
                              onChanged: (value) {
                                setState(
                                  () {
                                    sliderValueMinute = value;
                                    minute = value.round().toInt();
                                    changeTimerValue = true;
                                    languageTitle = "Test sinovlari qolgan vaqt";
                                    timeToDisplay =
                                        "0$hour:${minute.round().toInt() <= 9 ? "0" + minute.round().toString() : minute.round().toString()}: 00";
                                    // timeShows(h: hour, m:value.round().toInt() );
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
    double screeSize = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screeSize = screenWidth * screenHeight * 0.0008;
    return Scaffold(
      backgroundColor: myTheme1[1+colorIndex],
      body: Container(
        height: screeSize * 1.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // showTitle(),

            Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        languageTitle,
                        style: TextStyle(
                          color: myTheme1[0+colorIndex],
                          fontWeight: FontWeight.bold,
                          fontSize: screeSize * 0.1,
                        ),
                      ),
                      timer(screeSizes: screeSize),

                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 50, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Visibility(
                      visible: visibleContent,
                      child: IconButton(
                      icon: Icon(
                        CupertinoIcons.play,
                        color: myTheme1[0+colorIndex],
                        size: 30,
                      ),
                      onPressed: started ? start : null,
                    ),),
                    Visibility(
                      visible: !visibleContent,
                      child:IconButton(
                      icon: Icon(
                        CupertinoIcons.refresh,
                        color: myTheme1[0+colorIndex],
                        size: 30,
                      ),
                      onPressed: stopped ? null : stop,
                    ), )

                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      "Dasturiy texnik ta'minot",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            //
            // Text("StopTimer"),
          ],
        ),
      ),
    );
  }
}
