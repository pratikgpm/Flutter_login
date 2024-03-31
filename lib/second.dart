import 'package:demos_5/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demos'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/madhav1.jpg'),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () async {
              var preference = await SharedPreferences.getInstance();
              preference.setBool("isLogin",false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            }, child: Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
