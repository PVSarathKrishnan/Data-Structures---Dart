List<int> insertionSort(array) {
  for (var i = 1; i < array.length; i++) {
    int current = array[i];
    int prev = i - 1;
    while (prev >= 0 && array[prev] > current) {
      array[prev + 1] = array[prev];
      prev--;
    }
    array[prev + 1] = current;
  }

  return array;

}

void main() {
  List<int> array = [2, 8, 9, 6, 3, 10, 11, 1, 1, 7];
  print("original array");
  print(array);
  print("sorted array");
  print(insertionSort(array));
}