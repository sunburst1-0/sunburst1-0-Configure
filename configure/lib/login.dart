import 'package:configure/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';



class LoginScreen extends StatelessWidget{

  const LoginScreen({
    Key key,
    @required this.onSubmit,
  }):super(key:key);
  final VoidCallback onSubmit;
  static final TextEditingController userIdController =new TextEditingController();
  static final TextEditingController passwordController =new TextEditingController();

  String get userId => userIdController.text;
  String get password => passwordController.text;



  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Login',
          style: TextStyle(
            color: Colors.deepPurple[600],
            fontFamily: 'bebas',
            letterSpacing: 2.0,
            fontSize: 25,fontWeight: FontWeight.bold,
          ),),


      ),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Card(
          child: Container(
            color: Colors.deepPurple[100],
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            alignment: Alignment.center,
            width: 280,
            height: 300,
            child: Column(
              children: <Widget>[
                Text(
                  'Staff Login',
                  style: TextStyle(
                    fontFamily: 'bebas',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10,),
                new TextField(controller: userIdController, decoration: new InputDecoration(hintText: 'User Id',hintStyle:TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20.0
                ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),),
                SizedBox(height: 10,),
                new TextField(controller: passwordController, decoration: new InputDecoration(hintText: 'Password',hintStyle:TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20.0
                ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                ),obscureText: true),
                SizedBox(height: 20,),
                RaisedButton(onPressed: (){
                      if(userId=='user' && password=='1234'){
                      Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                     (Route<dynamic> route) => false,);}
                }, padding: const EdgeInsets.all(0.0),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
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

                  child: Center(child: Text('Login',style: TextStyle(fontSize: 25.0,fontFamily: 'roboto'),)),
                ),
                ),


              ],
            ),
          ),

        ),
      ),

      backgroundColor: Colors.deepPurple[200],
    );
  }
}




