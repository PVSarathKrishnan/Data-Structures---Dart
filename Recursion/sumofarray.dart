import 'dart:io';

void main() {
  print("enter the limit");
  int n = int.parse(stdin.readLineSync()!);
  List<int> array = [];
    for (var i = 0; i < n; i++) {
    print("Enter element ${i + 1}:");
    int element = int.parse(stdin.readLineSync()!);
    array.add(element); // Use add() method to append elements to the list
  }
  print(sumOfArray(array, array.length));
}

int sumOfArray(List<int> array, int n) {
  if (n <= 0) {
    return 0;
  }
  return array[n - 1] + sumOfArray(array, n - 1);
}
