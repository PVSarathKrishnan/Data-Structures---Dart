void insertionSort(List<int> arr) {
  int n = arr.length;

  for (int i = 1; i < n; i++) {
    int temp = arr[i];
    int j = i - 1;
    // Move elements of arr[0..i-1] that are greater than temp
    // to one position ahead of their current position
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = temp;
  }
}

void main() {
  List<int> array = [2, 8, 9, 6, 3, 10, 11, 1, 1, 7];
  print("original array");
  print(array);
  print("sorted array");
  insertionSort(array);
  print(array);
}
