import 'package:flutter/material.dart';
import 'home.dart';
import 'package:configure/collapsing_navigation_drawer.dart';

class SensorConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.chevron_left,
              ),
              onPressed :(){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false
                );
              }
          )
        ],
       // title: Center(child: Text("sensor")),
        title: Center(child: Text("sensor",style: TextStyle(fontSize: 25,fontFamily: 'bebas',color: Colors.deepPurple,letterSpacing: 2.0),)),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(



      ),
      drawer: CollapsingNavigationDrawer(),
    );
  }
}