import 'package:configure/acConfigure.dart';
import 'package:configure/help.dart';
import 'package:configure/home.dart';
import 'package:configure/lightConfigure.dart';
import 'package:configure/model.dart';
import 'package:configure/sensorConfigure.dart';
import 'package:configure/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:configure/collapsing_list_tile.dart';


class CollapsingNavigationDrawer extends StatefulWidget{
  @override
  CollapsingNavigationDrawerState createState(){
    return new CollapsingNavigationDrawerState();
  }

}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>{

  double maxWidth=220;
  double minWidth= 70;
  int currentSelectedIndex;

  @override
  Widget build(BuildContext context){

    return Container(
      width: 250.0,
      color: drawerBackgraoundColor,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),

           // color: Colors.deepPurple[200],
            margin: EdgeInsets.all(5),
            child: new Container(
              width: 150.0,
              height: 200.0,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage('assets/icon.png'),
                      fit: BoxFit.cover,
                  ),
                borderRadius: new BorderRadius.all(new Radius.circular(500.0)),
                border: new Border.all(
                  color: Colors.deepPurple,
                  width: 5.0,
                ),

              ),

              //  Image(image: AssetImage('assets/icon.png'),)

            ),


          ),

         // Divider(color: Colors.grey,height: 10.0,),
          //SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, counter){
                return Divider(height: 12.0);
              },
              itemBuilder: (context,counter){
                return CollapsingListTile(
                    onTap:(){
                      if(navigationItems[counter].title=="Home") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                HomeScreen()),
                                (Route<dynamic> route) => false);
                        currentSelectedIndex=0;
                      }

                      if(navigationItems[counter].title=="AC Configuration") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => ACConfig()),
                                (Route<dynamic> route) => false);
                        currentSelectedIndex=1;
                      }

                        if(navigationItems[counter].title=="Light Configuration") {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  LightConfig()),
                                  (Route<dynamic> route) => false
                          );
                          currentSelectedIndex=2;
                        }

                          if(navigationItems[counter].title=="Sensor Monitor") {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    SensorConfig()),
                                    (Route<dynamic> route) => false
                            );
                            currentSelectedIndex=3;
                          }

                            if(navigationItems[counter].title=="Help") {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      Help()),
                                      (Route<dynamic> route) => false

                              );
                              currentSelectedIndex=4;


                            }


                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                   isSelected:currentSelectedIndex ==counter,
                   title:navigationItems[counter].title,
                   icon:navigationItems[counter].icon,

                );
              },itemCount: navigationItems.length,

            ),
          ),

          SizedBox(height: 50.0),
        ],

      ),

    );

  }
}

