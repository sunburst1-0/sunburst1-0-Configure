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
        title: Center(child: Text("sensor")),
      ),
      body: Center(



      ),
      drawer: CollapsingNavigationDrawer(),
    );
  }
}