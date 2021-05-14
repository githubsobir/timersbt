import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timersbt/logic_timer.dart';
import 'package:timersbt/screen_setting.dart';

Widget screenTimer({BuildContext ctx, ProviderLogicTimer providerLogicTimer}) {
  double screenSize =
      MediaQuery.of(ctx).size.width * MediaQuery.of(ctx).size.height * 0.001;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      // showTitle(),
      Expanded(
          flex: 18,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: providerLogicTimer.visibleContent
                          ? screenSize * 0.005
                          : screenSize * 0.07),
                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 500),
                    style: TextStyle(
                      color: providerLogicTimer
                          .myTheme1[0 + providerLogicTimer.colorIndex],
                      fontWeight: FontWeight.bold,
                      fontSize: providerLogicTimer.visibleContent
                          ? screenSize * 0.04
                          : screenSize * 0.06,
                    ),
                    child: Text(
                      providerLogicTimer.languageTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  timer(context: ctx, providerLogicTimer: providerLogicTimer),
                ],
              ),
            ),
          )),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 2, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Visibility(
                  visible: !providerLogicTimer.visibleContent,
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: providerLogicTimer.chosenValue,
                    dropdownColor: providerLogicTimer
                        .myTheme1[1 + providerLogicTimer.colorIndex],

                    //elevation: 5,
                    style: TextStyle(color: Colors.grey.shade900),
                    iconEnabledColor: Colors.grey.shade800,
                    items: <String>[
                      'fon 0',

                      /// 0
                      'fon 2',

                      /// 2
                      'fon 4',

                      /// 4
                      'fon 6',

                      /// 6
                      'fon 8',

                      /// 8
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "...",
                      style: TextStyle(
                          color: providerLogicTimer
                              .myTheme1[0 + providerLogicTimer.colorIndex],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    onChanged: (String value) {
                      providerLogicTimer.chosenValue = value;
                      print(value.substring(4, 5));
                      providerLogicTimer.colorIndex =
                          int.parse(value.substring(4, 5));
                    },
                  ),
                ),
              ),
              Align(

                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !providerLogicTimer.visibleContent,
                    child: IconButton(

                      hoverColor: Colors.orangeAccent,
                      splashColor: Colors.orange,
                      icon: Icon(
                        CupertinoIcons.pause,
                        color: providerLogicTimer
                            .myTheme1[0 + providerLogicTimer.colorIndex],
                        size: 30,
                      ),
                      onPressed: providerLogicTimer.stopped
                          ? null
                          : providerLogicTimer.stop,
                    ),
                  ),

                  ///

                  Visibility(
                    visible: providerLogicTimer.visibleContent,
                    child: IconButton(
                      hoverColor: Colors.orangeAccent,
                      splashColor: Colors.orange,
                      icon: Icon(
                        CupertinoIcons.play,
                        color: providerLogicTimer
                            .myTheme1[0 + providerLogicTimer.colorIndex],
                        size: 30,
                      ),
                      onPressed: providerLogicTimer.started
                          ? providerLogicTimer.start
                          : null,
                    ),
                  ),
                ],
              )
                ,),

            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

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
  );
}
