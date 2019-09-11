import 'package:flutter/material.dart';
import './stack.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"My Calculator",
      home:Scaffold(
        appBar: AppBar(
          title: Text("Mich's Calculator"),
        ),
        body: Container(
          child:Controller()
        ),
      )
    );
  }
}


class Controller extends StatefulWidget{


  _ControllerState createState()=>_ControllerState();


}


class _ControllerState extends State<Controller>{
  int _screenValue=0;
  String _screenString="";
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(color: Colors.lightBlue),


          child:Column(

            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              _Screen(this._screenString),

              Row(
                children:<Widget>[
                  Expanded(
                    flex:4,
                      child:
                    Column(
                      children: <Widget>[

                        _NumRow(7,8,9),
                        _NumRow(4,5,6),
                        _NumRow(1,2,3),
                        Row( children: <Widget>[_specialBut2('.'),_NumBut(0),_specialBut2("=")])
                      ],
                    )
                  ), //Column for numbers

                  Expanded(
                    flex:1,
                    child:
                      specialCol('DEL', '/', 'x', '-', '+') //For Operators
                  )


                ]

              )
            ],
          ),

    );

  }


  Widget _Screen(String value)=>SizedBox(
    width:double.infinity,
    height:70,
    child:
    Container(
      decoration:BoxDecoration(color:Colors.lightBlueAccent,),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text(value.toString(), style: TextStyle(color: Colors.white, fontSize: 40),textDirection: TextDirection.rtl,),]
    )
    )
  );
  
  Widget _NumBut(int value){
    return

      SizedBox(
      width: 97,
        height:109,
        child:
        RaisedButton(

          child:Center(
            child:Text(value.toString(), style: TextStyle(fontSize: 20, fontFamily: 'comic'),),

          ),

          onPressed: (){
            setState(() {
              _screenValue+=value;
              _screenString+=value.toString();
            });
          }
          ,
          color: Colors.lightBlue,
          textColor: Colors.white,

      )
      );
  }

  Widget _NumRow(int val1, int val2, int val3){
    return

      Row(
        children: <Widget>[

            _NumBut(val1),
          _NumBut(val2),
          _NumBut(val3),


        ],
    );
  }

  Widget _specialBut(String value){

    return SizedBox(
      width:84,
        height:87,
      child:
      RaisedButton(

        child:Center(
          child:Text(value, style: TextStyle(fontSize: 20),),

        ),

        onPressed: (){

            if (value=="DEL"){
            setState(() {
            _screenString="";
            });
            }

            else {
              setState(() {
                _screenString+=value.toString();
              });
            }
        }
        ,
        color: Colors.lightBlue,
        textColor: Colors.white,

      )
    );
  }


  Widget _specialBut2(String value) {
    return SizedBox(
        width: 97,
        height: 109,
        child:
        RaisedButton(

          child: Center(
            child: Text(value, style: TextStyle(fontSize: 20),),

          ),

          onPressed: () {
            setState(() {
              _screenValue = 0;
            });
          }
          ,
          color: Colors.lightBlue,
          textColor: Colors.white,

        )
    );
  }

  Widget specialCol(String val1,String val2, String val3, String val4,String val5){
    return Column(
      children: <Widget>[
          _specialBut(val1),
          _specialBut(val2),
          _specialBut(val3),
          _specialBut(val4),
          _specialBut(val5),
      ],
    );
  }
}

