import 'package:configure/home.dart';
import 'package:flutter/material.dart';
import 'collapsing_navigation_drawer.dart';
import 'package:configure/jsonView/appliance.dart';
import 'package:configure/jsonView/roomSize.dart';
import 'package:configure/Controller/ir_meta.dart';



class ACConfig extends StatefulWidget {

  @override
  JsonApiDropdownState createState() {
    return new JsonApiDropdownState();
  }

}



//class ACConfig extends StatelessWidget {
  class JsonApiDropdownState extends State<ACConfig> {


  Future<List<Appliance>> applianceType;
  Future<List<RoomSize>> roomType;
  Appliance _currentUser;
  RoomSize _currentRoomSize;

  void onceSetupDropdown() async {
    applianceType =  getappliance();
    roomType= getRoomSize();
    setState(() {});
  }

  @override
  void initState() {

    super.initState();
    onceSetupDropdown();

  }
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
                          color: Colors.deepPurple,
                        ),
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
                        'Appliance Type:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          FutureBuilder<List<Appliance>>(
                              future: applianceType,
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Appliance>> snapshot) {
                                if (!snapshot.hasData) return CircularProgressIndicator();
                                return DropdownButton<Appliance>(
                                  //  value: _currentUser != null ? _currentUser : null,
                                  items: snapshot.data
                                      .map((user) => DropdownMenuItem<Appliance>(
                                    child: Text(user.type),
                                    value: user,
                                  ))
                                      .toList(),
                                  // value: _currentUser,
                                  onChanged: (Appliance valuel) {
                                    setState(() {
                                      _currentUser = valuel;
                                    });
                                   },
                                  // isExpanded: false,
//                     value: _currentUser,

                                  isExpanded: false,
                                  value: _currentUser,
                                  hint: _currentUser != null ? Text('${_currentUser.type}') : Text('select type'),
                                );
                              }),
                          SizedBox(height: 20.0),

                        ],
                      ),

                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        'Room Type:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          FutureBuilder<List<RoomSize>>(
                              future: roomType,
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<RoomSize>> snapshot_) {
                                if (!snapshot_.hasData) return CircularProgressIndicator();
                                return DropdownButton<RoomSize>(
                                  //  value: _currentUser != null ? _currentUser : null,
                                  items: snapshot_.data
                                      .map((room) => DropdownMenuItem<RoomSize>(
                                    child: Text(room.type),
                                    value: room,
                                  ))
                                      .toList(),
                                  // value: _currentUser,
                                  onChanged: (RoomSize valuel) {
                                    setState(() {
                                      _currentRoomSize = valuel;
                                    });
                                  },
                                  // isExpanded: false,
//                     value: _currentUser,

                                  isExpanded: false,
                                  value: _currentRoomSize,
                                  hint: _currentRoomSize != null ? Text('${_currentRoomSize.type}') : Text('select type'),
                                );
                              }),
                          SizedBox(height: 20.0),

                        ],
                      ),

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
          //  color: Colors.deepPurple[100],
          ),
        )

      ),
      drawer: CollapsingNavigationDrawer(),
    );
  }
}