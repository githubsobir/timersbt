import 'dart:async';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderLogicTimer extends ChangeNotifier {
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
  String languageTitle = "Test sinovlari tugashiga qolgan vaqt".toUpperCase();
  double sliderValue = 3;
  double sliderValueMinute = 20;
  int qoshimcha = 0;
  int colorIndex = 0;
  bool changeTimerValue = false;
  String chosenValue;
  int timerPause;


  List<Color> myTheme1 = [
    // #index1
    Colors.black,
    Colors.white,
    // #index2
    Colors.white,
    Colors.black,
    // #index3,
    Colors.yellow,
    Colors.black,
    // #index4,
    Colors.red,
    Colors.black,
    // #index5,
    Colors.blue,
    Colors.black,
    // #index6,
    Colors.blue,
    Colors.white,
  ];


  Size sizes;

  Future setScreenSize()async{
      sizes = await DesktopWindow.getWindowSize();
      print(sizes);
      print(sizes.height);
      print(sizes.width);

      notifyListeners();

      // await DesktopWindow.setWindowSize(Size(500,500));
      await DesktopWindow.setMinWindowSize(Size(sizes.width/2, sizes.height/2));
      // await DesktopWindow.setMaxWindowSize(Size(800,800));
      notifyListeners();
      // await DesktopWindow.resetMaxWindowSize();
      // await DesktopWindow.toggleFullScreen();
      // bool isFullScreen = await DesktopWindow.getFullScreen();
      await DesktopWindow.setFullScreen(true);
      // await DesktopWindow.setFullScreen(false);

  }

  void start() {
    visibleContent = false;
    started = false;
    stopped = false;
    checkTimer = true;
    if (changeTimerValue)
      timeForTimer = ((hour * 60 * 60) + (minute * 60) + second);
    // debugPrint(timeForTimer.toString());
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeForTimer == 0 || checkTimer == false) {
        timer.cancel();
        if (timeForTimer == 0) {
          debugPrint("Stopped by default");
          notifyListeners();
        }
        //  Navgation vaqt tugaganda

      } else if (timeForTimer < 60) {

        timeForTimer = timeForTimer - 1;
        timeToDisplay = timeShows(h: 0, m: 0, s: timeForTimer);
        notifyListeners();
      } else if (timeForTimer < 3600) {
        int m = timeForTimer ~/ 60;
        int s = timeForTimer - (60 * m);

        timeForTimer = timeForTimer - 1;
        timeToDisplay = timeShows(h: 0, m: m, s: s);
        notifyListeners();
      } else {
        int h = timeForTimer ~/ 3600;
        int t = timeForTimer - (3600 * h);
        int m = t ~/ 60;
        int s = t - (60 * m);

        timeForTimer = timeForTimer - 1;
        timeToDisplay = timeShows(h: h, m: m, s: s);
        notifyListeners();
      }

      if (timeForTimer < 1) languageTitle = "Test sinovi tugadi".toUpperCase();
      notifyListeners();
      if (timeForTimer % 10 == 0 && qoshimcha == 0 && timeForTimer > 1) {
        qoshimcha = 1;
        languageTitle = "Test sinovlari tugashiga qolgan vaqt".toUpperCase();
        notifyListeners();
      } else if (timeForTimer % 10 == 0 && qoshimcha == 1 && timeForTimer > 1) {
        qoshimcha = 0;
        languageTitle = "Время до окончания тестирования".toUpperCase();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void stop() {
    visibleContent = true;

    started = true;
    stopped = true;
    checkTimer = false;
    changeTimerValue = false;
    notifyListeners();
  }

  String timeShows({int h, int m, int s}) {
    if (h < 10) {
      hhhh = "0" + h.toString();
      notifyListeners();
    } else if (h == 0) {
      hhhh = "00";
      notifyListeners();
    } else {
      hhhh = h.toString();
      notifyListeners();
    }

    if (m <= 9) {
      mmmm = "0" + m.toString();
      notifyListeners();
    } else if (m == 0 || m == null) {
      mmmm = "00";
      notifyListeners();
    } else {
      mmmm = m.toString();
      notifyListeners();
    }
    if (s <= 9) {
      ssss = "0" + s.toString();
      notifyListeners();
    } else if (s < 1) {
      ssss = "00";
      notifyListeners();
    } else {
      ssss = s.toString();
      notifyListeners();
    }
    notifyListeners();

    // print("$hhhh : $mmmm : $ssss");
    return "$hhhh:$mmmm:$ssss";

  }

  /// Fon ranglafrini o'zgartirish
  Future getThemeColorByID({ int index}) async {

    if (index == 0) {
      colorIndex = 0;
    } else if (index == 1) {
      colorIndex = 2;
    } else if (index == 2) {
      colorIndex = 4;
    } else if (index == 3) {
      colorIndex = 6;
    } else if (index == 4) {
      colorIndex = 8;
    } else if (index == 5) {
      colorIndex = 10;
    }
    notifyListeners();
  }

  Future getSliderValue({double value}) async {
    sliderValueMinute = value;
    minute = value.round().toInt();
    changeTimerValue = true;
    languageTitle = "Test sinovlari tugashiga qolgan vaqt".toUpperCase();
    timeToDisplay =
    "0$hour:${minute.round().toInt() <= 9 ? "0" + minute.round().toString() : minute.round().toString()}:00";
    // timeShows(h: hour, m:value.round().toInt() );
    notifyListeners();
  }

  Future getSliderValueHour({double value})async{
    sliderValue = value;
    languageTitle =
        "Test sinovlari tugashiga qolgan vaqt"
            .toUpperCase();
    changeTimerValue = true;
    hour =
        value.round().toInt();
    //###

    timeToDisplay =
    "0${hour.toString()}:${minute.round().toInt() <= 9 ? "0" + minute.round().toString() : minute.round().toString()}:00";
      notifyListeners();
    // timeShows(h:value.round().toInt(), m: minute );
  }
  double infoWindowSize({BuildContext context}){
    double screenSize = MediaQuery.of(context).size.width *
        MediaQuery.of(context).size.height *
        0.001;
    print(screenSize);
    notifyListeners();
    return screenSize;
  }
}
