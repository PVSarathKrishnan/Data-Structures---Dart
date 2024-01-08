void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(iterativeBS(array, 8));
}

int iterativeBS(List<int> array, int target) {
  int start = 0;
  int end = array.length - 1;

  while (start < end) {
    int mid = start + (end - start) ~/ 2;
    if (array[mid] == target) {
      return mid;
    } else if (array[mid] > target) {
      end = mid - 1;
    } else {
      start = mid + 1;
    }
  }
  return -1;
}
