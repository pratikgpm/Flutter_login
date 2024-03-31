import 'dart:async';
import 'package:demos_5/main.dart';
import 'package:demos_5/second.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class flash extends StatefulWidget {
  const flash({super.key});
  @override
  State<flash> createState() => _flashState();
}

class _flashState extends State<flash> {
  static const String KEYWORD = "isLogin";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.indigo,
          child: Center(
              child: Text(
            'Daily Routine',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          )),
        ),
      ),
    );
  }

  void changer() async {
    var preference = await SharedPreferences.getInstance();
    var isLogin = preference.getBool(KEYWORD);
    Timer(
      Duration(seconds: 2),() {
        if(isLogin != null){
          if(isLogin){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => second(),));
          }
          else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
          }
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen(),));
        }
      },
    );
  }
}
