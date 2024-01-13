List<int> bubble(List<int> array) {
  int? temp;
  for (var i = 0; i < array.length - 1; i++) {
    for (var j = 0; j < array.length - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
  return array;
}

void main() {
  List<int> arr = [3, 9, 4, 6, 8, 7, 8, 5];
  print(bubble(arr));
}
