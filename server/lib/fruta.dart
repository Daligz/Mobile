import 'dart:convert';

class Fruta {
  final String title;
  final String description;
  final String imageUrl;
  final String fecha;

  Fruta({required this.title, required this.description, required this.imageUrl, required this.fecha});
  factory Fruta.fromJson(Map<String, dynamic> json) {
    return Fruta(
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        fecha: json["fecha"]);
  }
}

Future<List<Fruta>> fetchPost() async {
  print("requesting..");
  var http;
  final response =
  await http.get('http:/servicio.php');
  //Revisamos si la respuesta es OK
  if (response.statusCode == 200) {
    //Listado de objetos json
    var jsonList = json.decode(response.body) as List;
    //hacemos un mapeo, pasamos cada elemento a un objeto Fruta
    return jsonList.map((i) => new Fruta.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }
}
