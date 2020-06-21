
import 'dart:developer';

import 'package:configure/collapsing_navigation_drawer.dart';
import 'package:configure/login.dart';
import 'package:flutter/material.dart';
import 'package:configure/jsonView/SubMessage.dart';
import 'package:configure/Controller/WarningMessage.dart';
import 'package:configure/jsonView/appliance.dart';
import 'package:configure/Controller/ir_meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomeScreen extends StatefulWidget {

  @override
  Warning createState() {
    return new Warning();
  }

}



//class ACConfig extends StatelessWidget {
class Warning extends State<HomeScreen> {
  double iconSize = 20;


  String url = 'http://165.227.25.172:9004/warn/all';
  List data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body);
      //data = extractdata["result"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }
  bool checkBoxValue= false;
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
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              return  new Card(
                child: new Column(

                  children: <Widget>[
                   // new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Table(
                        border: TableBorder.all(),
                      //  columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},

                        children: [
                          TableRow( children: [
                            Table(
                              border: TableBorder.all(),
                              columnWidths: {0: FractionColumnWidth(.1), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.3), 3: FractionColumnWidth(.3)},
                              children: [

                                TableRow(
                                    children: [
                                  Column(
                                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    children:[
                                    Container(height: 25.0,width: 100.0, color: Colors.redAccent,
                                      child: Center(
                                        child: Text(data[i]["warning"]["priority"], textAlign: TextAlign.center),
                                      ),
                                    ),

                                   // color:const Color(0xff7c94b6),
                                  ]),
                                  Column(children:[
                                    Container(height: 25.0,width: 100.0,
                                      child: Center(
                                        child: Text(data[i]["warning"]["status"], textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ]),
                                  Column(children:[
                                    Container(height: 25.0,width: 230.0,color: Colors.black12,
                                      child: Center(
                                        child: Text(data[i]["applianceType"]["type"], textAlign: TextAlign.center),
                                      ),
                                    ),

                                  ]),

                                  Column(children:[
                                    Container(height: 25.0,width: 100.0,
                                      child: Center(
                                        child: Text(timeAgoSinceDate(data[i]["warning"]["occurTime"]), textAlign: TextAlign.center),
                                      ),
                                    ),

                                  ]),

                                ]),

                              ],

                            ),

                          ]),
                          TableRow( children: [

                            Container(height: 25.0,width: 100.0,color: Colors.black26,
                              child: Align(

                                alignment: Alignment(-0.8905,0),
                                child: Text('Incident:'+data[i]["warning"]["warnMessage"], textAlign: TextAlign.center),
                              ),
                            ),

                           // new Text('Incident:'+data[i]["warning"]["warnMessage"]),
                          ]),
                          TableRow( children: [

                            Table(
                                columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.4), 2: FractionColumnWidth(.1)},

                              children: [

                                TableRow( children: [

                                  Column(children:[

                                    Container(height: 30.0,width: 160.0,color: Colors.blueGrey,
                                      child: Align(

                                        alignment: Alignment.centerLeft,
                                        child: Text('Raised By:'+((data[i]["raisedPerson"]) == null ? '': data[i]["raisedPerson"]["name"]), textAlign: TextAlign.center),
                                      ),
                                    ),


                                  ]),
                                  Column(children:[
                                    Container(height: 30.0,width: 160.0,color: Colors.black12,
                                      child: Align(

                                        alignment: Alignment.centerLeft,
                                        child: Text('Respond By:'+((data[i]["respondPerson"]) == null ? 'not respond': data[i]["respondPerson"]["name"]), textAlign: TextAlign.center),
                                      ),
                                    ),

                                    //Text('Respond By:'+((data[i]["respondPerson"]) == null ? 'not respond':(data[i]["respondPerson"]["name"]))),
                                  ]),
                                  Column(children:[
                                    Container(height: 30.0,width: 160.0,color: Colors.black26,
                                      child: Center(
                                       // alignment: Alignment.topCenter,
                                        child: IconButton(
                                            icon: Icon(Icons.library_books,),

                                          tooltip: 'Incident History',
                                          hoverColor:Colors.pink,
                                          onPressed: () {

                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (BuildContext context) =>
                                                      new SecondPage(data[i])));
                                            });
                                          },

                                        ),
                                        //Icon(Icons.add_to_home_screen, size: iconSize),

                                      ),

                                    ),
//                                    Icon(Icons.add_to_home_screen, size: iconSize,),


                                  ]),
                                ]),

                              ],
                            ),

                          ]),
                        ],
                      ),

                    ),

                  ],
                ),

              );

            }
        ),
      drawer: CollapsingNavigationDrawer(),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage(this.data);
  final data;
  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(
          title: Center(child: Text("Incident History",style: TextStyle(fontSize: 25,fontFamily: 'bebas',color: Colors.deepPurple,letterSpacing: 2.0),)),
        backgroundColor: Colors.deepPurple[200],
      ),

      body: new Center(
        child: new Container(
          width: 150.0,
          height: 150.0,
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow( children: [
                    Column(children:[
                     // Icon(Icons.account_box, size: iconSize,),
                      Text('My Account')
                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[

                      Text('My Account')
                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[

                      Text('My Account')
                    ]),

                  ]),
                ],
            ),
        //  decoration: new BoxDecoration(
          //  color: const Color(0xff7c94b6),
//            image: new DecorationImage(
//              image: new NetworkImage(data["raisedPerson"]["name"]),
//              fit: BoxFit.cover,
//            ),
//            borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
//            border: new Border.all(
//              color: Colors.red,
//              width: 4.0,
//            ),
       //   ),
        ),
      ));
}

 String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
DateTime date = DateTime.parse(dateString);
final date2 = DateTime.now();
final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
    return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
    } else {
return 'Just now';
}
}

String statusClour(){


  return "";
}