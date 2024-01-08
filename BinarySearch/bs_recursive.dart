int binaryRecursive(List<int> array, int target) {
  return binary(array, target, 0, array.length - 1);
}

int binary(List<int> array, int target, int start, int end) {
  if (start > end) {
    print("Not found");
    return -1;
  }
  int mid = start + (end - start) ~/ 2;
  if (array[mid] == target) {
    return mid;
  } else if (array[mid] > target) {
    return binary(array, target, start, mid - 1);
  } else {
    return binary(array, target, mid + 1, end);
  }
}

void main() {
  List<int> array = [20, 30, 66, 77, 98, 99, 999];
  int target = 66;
  print(binaryRecursive(array, target));
}
