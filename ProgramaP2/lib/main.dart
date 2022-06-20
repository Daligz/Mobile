import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  // TODO: implement widget
  List <Personas> persona =[
    Personas("juan", "Hernandez", "3441212343134"),
    Personas("maria", "fernandez", "998348473"),
    Personas("angel", "ortiz", "983487784"),
    Personas("luis", "neria", "0243404"),
  ];
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'MaterialApp',
      home: Scaffold(
          appBar: AppBar(
            title:Text('Material App Bar'),
          ),
          body: ListView.builder(
              itemCount: persona.length,
              itemBuilder: (context, index) {
                //return Text( persona[index].name);
                return ListTile(
                  onLongPress: (){
                    this.borrarPersona(context, persona[index]);
                    // print(persona[index].name);
                  },
                  title: Text(persona[index].name +' '+persona[index].lastname),
                  subtitle: Text(persona[index].phone),
                  leading: CircleAvatar(
                    child: Text(persona[index].name.substring(0,1)),
                  ),
                  trailing:Icon(Icons.arrow_forward_ios) ,
                );
              })),
    );
  }
  borrarPersona(context,Personas persona){
    showDialog(context: context,
        builder: (_)=> AlertDialog(
          title: Text("Eliminar Contacto"),
          content: Text("¿Estas seguro de que quieres eliminar a?"+persona.name+'?'),
          actions: [
            FlatButton(onPressed:(){
              Navigator.pop(context);
            }, child: Text("cancelar")),
            FlatButton(onPressed:(){
              print(persona.name);
              this.setState(() {
                this.persona.remove(persona);
              });
              Navigator.pop(context);
            }, child: Text("borrar"))
          ],
        )
    );
  }
}
class Personas{
  late String name;
  late String lastname;
  late String phone;
  Personas(name,lastname,phone){
    this.name=name;
    this.lastname=lastname;
    this.phone=phone;
  }
}