import 'package:demos_5/main.dart';
import 'package:demos_5/second.dart';
import 'package:flutter/material.dart';
import 'flash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demos_5',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: flash(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool flag = true;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Ripple Effect',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'UserName',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    )
                  ),
                ),
              ),
              SizedBox(
                height:20,
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.lightGreen),
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async{
                flag = true;
                var preference = await SharedPreferences.getInstance();
                preference.setBool("isLogin", flag);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => second(),));
              }, child: Text('Login')),
            ],
          ),
        )
    );
  }



}