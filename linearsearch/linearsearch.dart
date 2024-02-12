void lnSearch(List<int> array, int target) {
  for (var i = 0; i < array.length - 1; i++) {
    if (array[i] == target) {
      print("found index :${i + 1}");
      return;
    }
  }
  print("not found");
}

void main() {
  List<int> arr = [1, 7, 6, 5, 9, 3];
  int target = 5;
  lnSearch(arr, target);
}
