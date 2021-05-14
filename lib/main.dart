import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timersbt/logic_timer.dart';
import 'package:timersbt/screen_timer.dart';
import 'dart:io';



/// 22.03.2021 23:17
void main() {
  runApp(MaterialApp(
      color: Colors.black,
      title: "DTM",
      debugShowCheckedModeBanner: false,
      home: MyAp()));
}

class MyAp extends StatefulWidget {
  @override
  _MyApState createState() => _MyApState();
}

class _MyApState extends State<MyAp> {
  ProviderLogicTimer providerLogicTimer = ProviderLogicTimer();

  @override
  void initState() {
    providerLogicTimer.setScreenSize();
    super.initState();
  }

  @override
  Widget build(BuildContext contexts) {
    return ChangeNotifierProvider(
      create: (context) => providerLogicTimer,
      child: Consumer<ProviderLogicTimer>(
        builder: (context, value, child) => Scaffold(
            backgroundColor:
                providerLogicTimer.myTheme1[1 + providerLogicTimer.colorIndex],
            body: Container(

                child: screenTimer(
                    ctx: contexts, providerLogicTimer: providerLogicTimer))),
      ),
    );
  }
}
