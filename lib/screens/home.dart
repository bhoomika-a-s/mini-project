import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'login.dart';

class screenHome extends StatelessWidget {
  const screenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: (){
            signout(context);
          }, 
          icon:const Icon(Icons.exit_to_app)),
        ],
      ),
      body: const SafeArea(
        child:Center(
          child:Text('HOME'),
        ), 
        
      ),
    );
  }
  signout(BuildContext ctx) async {

    final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, false);

    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx)=> const screenLogin()), 
        (route) => false);
  }
}