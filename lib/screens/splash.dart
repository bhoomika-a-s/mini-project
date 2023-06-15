import 'package:flutter/material.dart';
import 'package:mini_project/screens/home.dart';
import 'package:mini_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
bool isLoading= true;

@override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }
  //loading animation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        child: isLoading
        ? const CircularProgressIndicator(
          color: Color.fromARGB(255, 14, 39, 83),
        ):null,
      ),
      );
  }
  //creating delay 
  Future<void> gotoLogin() async{
    await Future.delayed(
      const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx)=> const screenLogin(), 
      ),
      );
  }

  Future<void> checkUserLoggedIn() async{
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);

    if(_userLoggedIn == null || _userLoggedIn == false){
      gotoLogin();
    } else {
      await Future.delayed(
      const Duration(seconds: 1));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1)=>const screenHome(),));
    }
  }

}