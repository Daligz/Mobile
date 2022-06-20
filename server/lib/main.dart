import 'package:flutter/material.dart';
import 'fruta.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "Listado de frutas";
  //Este es el Widget principal de la App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Page(
        title: Text(this.title),
        list: fetchPost(),
      ),
    );
  }
}

//Pantalla principal
class Page extends StatelessWidget {
  @required
  final Text title; //Titulo a mostrar
  @required
  final Future<List<Fruta>> list;
  Page({required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this.title,
      ),
      body: FutureBuilder<List<Fruta>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Fruta fruta = snapshot.data![index];
                  return FrutaItem(
                    fruta: fruta,
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class FrutaItem extends StatelessWidget {
  @required
  final Fruta fruta;
  FrutaItem({required this.fruta});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    fruta.imageUrl,
                    width: 90,
                  ),
                  Expanded(
                    child: Text(
                      fruta.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Text(fruta.description),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  fruta.fecha,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15, color: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    final url = fruta.imageUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launch(String url) {}
}

canLaunch(String url) {}
