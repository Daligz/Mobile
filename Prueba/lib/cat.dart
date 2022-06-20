class Cat {
  String name, age;

  Cat(this.name, [this.age = "18"]);
  
  void show() {
    print(name + " - " + age);
  }

  String toString() {
    return 'Cat : Nombre: ${this.name}, Edad: ${this.age}';
  }
}

void main() {
  Cat("chi", "21").show();
  Cat("a").show();
}