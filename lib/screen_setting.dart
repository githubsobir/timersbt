import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:timersbt/logic_timer.dart';

Widget timer({BuildContext context, ProviderLogicTimer providerLogicTimer}) {
  double screenSize = MediaQuery.of(context).size.width *
      MediaQuery.of(context).size.height *
      0.001;
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            height: providerLogicTimer.visibleContent
                ? screenSize * 0.02
                : screenSize * 0.03),

        /// Timer ko'rsatish
        AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 500),
          style: TextStyle(
              fontSize: providerLogicTimer.visibleContent
                  ? screenSize * 0.15
                  : screenSize * 0.25,
              color: providerLogicTimer
                  .myTheme1[0 + providerLogicTimer.colorIndex],
              fontWeight: FontWeight.w700),
          child: Text(
              // providerLogicTimer.infoWindowSize(context: context).toString()
              providerLogicTimer.timeToDisplay,
              ),
        ),

        /// Fon tanlash qismi
        Visibility(
          visible: providerLogicTimer.visibleContent,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
              AnimatedContainer(
                  width: screenSize < 1000 && screenSize > 760 ? screenSize*0.25: 240,
                  height:screenSize < 1000 && screenSize > 760 ? screenSize*0.27: 240,

                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(left: 5, top: 5),
                  decoration: BoxDecoration(
                    color: providerLogicTimer
                        .myTheme1[1 + providerLogicTimer.colorIndex],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(0.4, 0.4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    children: [
                      Text(
                        "Dastur fonini tanlang",
                        style: TextStyle(
                            color: providerLogicTimer
                                .myTheme1[0 + providerLogicTimer.colorIndex],
                            fontWeight: FontWeight.bold),
                      ),
                      AnimatedContainer(
                        width: screenSize < 1000 && screenSize > 760 ? screenSize*0.2: 200,
                        height:screenSize < 1000 && screenSize > 760 ? screenSize*0.2: 180,
                        // width: screenSize * 0.2,
                        // height: screenSize * 0.18,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: providerLogicTimer
                              .myTheme1[1 + providerLogicTimer.colorIndex],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ],
                          border: Border.all(color: Colors.grey)
                        ),
                        alignment: Alignment.topCenter,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              GroupButton(
                                isRadio: true,
                                spacing: 10,
                                borderRadius: BorderRadius.circular(12),
                                buttonWidth: 140,
                                onSelected: (index, isSelected) {
                                  providerLogicTimer.getThemeColorByID(
                                      index: index);
                                },
                                buttons: [
                                  "fon 0",
                                  "fon 2",
                                  "fon 4",
                                  "fon 6",
                                  "fon 8",
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ),
                ),
              AnimatedContainer(
              width: screenSize < 1000 && screenSize > 760 ? screenSize*0.315: 270,
              height:screenSize < 1000 && screenSize > 760 ? screenSize*0.27: 240,

              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: providerLogicTimer
                    .myTheme1[1 + providerLogicTimer.colorIndex],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0.4, 0.4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Kichkina kontent
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.stopwatch,
                        // size: 60,
                        size: screenSize < 1000 && screenSize > 760 ? screenSize*0.04: 60,
                        // height:screenSize < 1000 && screenSize > 760 ? screenSize*0.27: 240,

                        color: providerLogicTimer
                            .myTheme1[0 + providerLogicTimer.colorIndex],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:EdgeInsets.only(left:10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: providerLogicTimer.myTheme1[
                                1 + providerLogicTimer.colorIndex],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: providerLogicTimer.myTheme1[
                                    0 + providerLogicTimer.colorIndex],
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0.2, 0.1),
                              )
                            ]),
                        // padding: EdgeInsets.all(screenSize < 1000 && screenSize > 760 ? screenSize*0.01: 10),
                        child: Text(
                          providerLogicTimer.timeToDisplay,
                          // " 0${providerLogicTimer.sliderValue.round().toInt()}:"
                          // "${providerLogicTimer.sliderValueMinute <= 9 ? "${"0" + providerLogicTimer.sliderValueMinute.round().toString()}" : providerLogicTimer.sliderValueMinute.round().toString()}",
                          style: TextStyle(
                              color: providerLogicTimer.myTheme1[
                                  0 + providerLogicTimer.colorIndex],
                              fontSize:screenSize < 1000 && screenSize > 760 ? screenSize*0.03: 30,

                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Soat
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "soat",
                        style: TextStyle(
                            color: providerLogicTimer.myTheme1[
                                0 + providerLogicTimer.colorIndex],
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Slider(
                        value: providerLogicTimer.sliderValue,
                        min: 0,
                        max: 5,
                        activeColor: providerLogicTimer
                            .myTheme1[0 + providerLogicTimer.colorIndex],
                        divisions: 5,
                        label: '${providerLogicTimer.sliderValue}',
                        onChanged: (value) {
                          providerLogicTimer.getSliderValueHour(
                              value: value);
                        },
                      ),
                    ],
                  ),

                  /// Minut
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "minut",
                        style: TextStyle(
                            color: providerLogicTimer.myTheme1[
                                0 + providerLogicTimer.colorIndex],
                            fontWeight: FontWeight.w600),
                      ),

                      Slider(
                        value: providerLogicTimer.sliderValueMinute,
                        min: 0,
                        max: 55,
                        activeColor: providerLogicTimer
                            .myTheme1[0 + providerLogicTimer.colorIndex],
                        divisions: 55,
                        label:
                            '${providerLogicTimer.sliderValueMinute.round()}',
                        onChanged: (value) {
                          providerLogicTimer.getSliderValue(value: value);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (providerLogicTimer.sliderValueMinute >= 1) {
                              double value =
                                  providerLogicTimer.sliderValueMinute - 1;
                              providerLogicTimer.getSliderValue(
                                  value: value);
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: providerLogicTimer.myTheme1[
                                0 + providerLogicTimer.colorIndex],
                          )),
                      IconButton(
                          onPressed: () {
                            if (providerLogicTimer.sliderValueMinute <=
                                54) {
                              double value =
                                  providerLogicTimer.sliderValueMinute + 1;
                              providerLogicTimer.getSliderValue(
                                  value: value);
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: providerLogicTimer.myTheme1[
                                0 + providerLogicTimer.colorIndex],
                          )),
                    ],
                  )
                ],
              ),)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
