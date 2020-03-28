import 'package:configure/collapsing_navigation_drawer.dart';
import 'package:configure/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[IconButton(icon: Icon(Icons.exit_to_app,color: Colors.deepPurple,), onPressed:
        (){
          Navigator.pushAndRemoveUntil(
            context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,);
        })],
        title: Center(child: Text("Home",style: TextStyle(fontSize: 25,fontFamily: 'bebas',color: Colors.deepPurple,letterSpacing: 2.0),)),
        backgroundColor: Colors.deepPurple[200],

      ),
      body: Center(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height:25),
                  new Text(
                      'Tempurature : 25 °C',
                    style: TextStyle(
                    fontFamily: 'bebas',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,)
                  ),
                  SizedBox(height:25),
                  new Text('Light Intensity :',
                      style: TextStyle(
                        fontFamily: 'bebas',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,)
                  ),
                  SizedBox(height:25),
                  new Text(
                      'Gas Intensity',
                      style: TextStyle(
                        fontFamily: 'bebas',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,)
                  ),
                  SizedBox(height:25),
                  new Text(
                      'Humidity : 63%',
                      style: TextStyle(
                        fontFamily: 'bebas',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,)
                  ),
                  SizedBox(height: 20,),
                  new RaisedButton(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 200,
                      height: 56,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF9575CD),
                                Color(0xFF673AB7),
                                Color(0xFF311B92)
                              ]
                          )
                      ),

                      child: Center(child: Text('Reset',style: TextStyle(fontSize: 25.0,fontFamily: 'roboto'),)),
                    ),
                  )
                ],
              ),
              color: Colors.white70,
              width: 280,
              height: 300,
            ),
          ),
      ),


      drawer: CollapsingNavigationDrawer(),


    );

  }
}