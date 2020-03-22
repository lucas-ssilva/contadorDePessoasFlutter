import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home())); 
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _valor = 0;
  String _infoText = "Pode Entrar";


  void _atualizarValor(int delta){
    setState(() {
       _valor += delta;
       if(_valor < 0){
         _infoText = "Mundo Invertido!";
       } else if(_valor <= 10 ){
          _infoText = "Pode Entrar";
       } else{
         _infoText = "Lotado";
         _valor--;
       }

    });
  }
  
  @override 
  Widget build(BuildContext) {
    return Stack(children: <Widget>[
      Image.asset("images/original.jpg",
      fit: BoxFit.cover,height: 1000.0,),
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text("Pessoas: $_valor", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
      decoration: TextDecoration.none),
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        Padding(
          padding: EdgeInsets.all(10.0),
          child: 
          FloatingActionButton(
           onPressed: () {_atualizarValor(1);} , 
            child:Icon(Icons.add),backgroundColor: Colors.deepOrange, ),
        ),
      
        Padding(
          padding: EdgeInsets.all(10.0),
          child: 
          FloatingActionButton(
            onPressed: () {_atualizarValor(-1);} ,
            child:Icon(Icons.remove),backgroundColor: Colors.deepOrange, ),
        ),

          ],
        ),
        Text(_infoText, style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,fontSize: 30,
        decoration: TextDecoration.none )
        ,)
      ],
    )

    ],
    );
  }
}