class Animal {
  int id;
  String nombre;
  String especie;

  Animal({required this.id, required this.nombre, required this.especie});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'especie': especie};
  }
}