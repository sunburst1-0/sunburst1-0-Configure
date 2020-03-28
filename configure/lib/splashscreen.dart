import 'package:flutter/material.dart';
import 'dart:async';
import 'package:configure/login.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status){
          if(status){
            _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async{
    await Future.delayed(Duration(microseconds: 5000), (){});
    return true;
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(onSubmit: (){},)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
                opacity: 1,
                child:Image.asset('assets/tempurature.png'))
          ],
        ),
      ),
    );
  }
}
