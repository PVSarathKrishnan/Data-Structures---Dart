List<int> bubbleSort(List<int> array) {
  for (var i = 0; i < array.length - 1; i++) {
    for (var j = 0; j < array.length - 1; j++) {
      if (array[j] > array[j + 1]) {
        //swap
        int temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
  return array;
}

void main() {
  List<int> array = [2, 8, 9, 6, 3, 10, 11, 1, 1, 7];
  print("original array");
  print(array);
  print("sorted array");
  print(bubbleSort(array));
}
