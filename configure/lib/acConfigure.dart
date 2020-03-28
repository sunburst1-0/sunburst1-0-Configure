import 'package:configure/home.dart';
import 'package:flutter/material.dart';
import 'collapsing_navigation_drawer.dart';

class ACConfig extends StatelessWidget {
  bool checkBoxValue= false;
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
        title: Center(child: Text("AC Config",style: TextStyle(fontSize: 25,fontFamily: 'bebas',color: Colors.deepPurple,letterSpacing: 2.0),)),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20,),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        'AC Name:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,),
                      ),
                    ),
                    Expanded(
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        'Room size:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              new Checkbox(
                                value: checkBoxValue,
                              ),
                              Text(
                                  "Small"
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              new Checkbox(
                                value: checkBoxValue,
                              ),
                              Text(
                                  "Medium"
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              new Checkbox(
                                value: checkBoxValue,
                              ),
                              Text(
                                  "Large"
                              )
                            ],
                          ),
                        ],
                      )

                    )
                  ],
                ),
                Text(
                  "AC Position:",
                      style:TextStyle(
                         color: Colors.deepPurple,
                        fontSize: 25,
                        )
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        'X:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,),
                      ),
                    ),
                    Expanded(
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: new Text(
                        'Y:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,),
                      ),
                    ),
                    Expanded(
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
            width: MediaQuery.of(context).size.height*.90,
            height: MediaQuery.of(context).size.height*.90,
            color: Colors.deepPurple[100],
          ),
        )

      ),
      drawer: CollapsingNavigationDrawer(),
    );
  }
}