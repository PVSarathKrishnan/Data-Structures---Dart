import 'dart:io';

int factorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

void main() {
  print("enter the number to find out the factorial :");
  int n = int.parse(stdin.readLineSync()!);
  print(factorial(n));
}
