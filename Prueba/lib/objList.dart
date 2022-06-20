import 'cat.dart';

void main() {
  Cat cat = Cat("gatito", "21");
  List<Cat> cats = [
    cat,
    Cat("gatito2", "1"),
    Cat("gatito3", "11"),
    Cat("gatito4")
  ];
  cats.forEach((element) { element.show(); });
  print("");
  cats.remove(cat);
  cats.forEach((element) { element.show(); });
  cats.removeAt(0);
  print("");
  cats.forEach((element) { element.show(); });
}