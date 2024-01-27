import 'dart:collection';

void main() {
  HashMap<String, int> studentAges = HashMap<String, int>();

  //add key value pairs
  studentAges["A"] = 12;
  studentAges["B"] = 14;
  studentAges["C"] = 9;

  //print
  print("age of A is ${studentAges["A"]}");

  //update
  studentAges["A"] = 13;

  //print updated
  print("updated age of A is ${studentAges["A"]}");

  //check if key contains specifc

  if (studentAges.containsKey("C")) {
    print("${studentAges["C"]}");
  }

  //iteration using key

  for (var element in studentAges.keys) {
    print("$element : ${studentAges[element]}");
  }
  //iteration using values

  for (var element in studentAges.values) {
    print(element);
  }

  studentAges.forEach((key, value) {
    print("$key : $value");
  });
}
