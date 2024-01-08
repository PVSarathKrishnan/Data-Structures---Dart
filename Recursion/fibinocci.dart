import 'dart:io';

void main() {
  print("enter the limit");
  int n = int.parse(stdin.readLineSync()!);
  print(fib(n));
}

int fib(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fib(n - 1) + fib(n - 2);
  }
}
