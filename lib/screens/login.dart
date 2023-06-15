import 'package:flutter/material.dart';
import 'package:mini_project/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

// ignore: camel_case_types
class screenLogin extends StatefulWidget {
  const screenLogin
({super.key});

  @override
  State<screenLogin> createState() => _screenLoginState();
}

// ignore: camel_case_types
class _screenLoginState extends State<screenLogin> {
  final _usernameControlller = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDataMatch = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key:_formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                TextFormField(
                  controller: _usernameControlller,
                  decoration: const InputDecoration(
                    border:OutlineInputBorder(),
                    hintText: 'USERNAME',
                  ),
                  validator: (value){
                     if(value == null || value.isEmpty){
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller:_passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                   validator: (value){
                    if(value == null || value.isEmpty){
                      return 'value is empty';
                    } else {
                      return null;
                    }
                   }
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatch,
                      child: const Text('Username and passsword doesnt match',
                        style: TextStyle(
                          color: Colors.red),
                      ),
                    ), 
                   
                    ElevatedButton.icon(onPressed: (){
                      if(_formkey.currentState!.validate())   //call validator fn
                      {
                        checkLogin(context);
                      } else {
                        print('Data Empty');
                      }
                    }, 

                    icon: const Icon(Icons.login), 
                    label: const Text('Login'),
                    ),
                  ],
                ),
              ]
            )
            ),
        ),
        ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameControlller.text;
    final _password = _passwordController.text;
    if(_username == _password) {
      print('Username and password match');
      // goto home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
      .pushReplacement(
        MaterialPageRoute(builder: (ctx1)=> const screenHome())
      );
    }
    else {
     print('Username and passsword doesnt match');

    const _errorMessage = 'Username and password  doesnt match';

      //Snack bar
       ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text(_errorMessage),
          )
          ); 
    }
  }
}