class MergeSort {
  List<int> merge(List<int> array) {
    if (array.length <= 1) {
      return array;
    }
    int mid = array.length ~/ 2;

    List<int> leftArray = merge(array.sublist(0, mid));
    List<int> rightArray = merge(array.sublist(mid));

    return sort(leftArray, rightArray);
  }

  List<int> sort(List<int> leftArray, List<int> rightArray) {
    List<int> res = [];
    int i = 0;
    int j = 0;

    while (i < leftArray.length && j < rightArray.length) {
      if (leftArray[i] <= rightArray[j]) {
        res.add(leftArray[i]);
        i++;
      } else {
        res.add(rightArray[j]);
        j++;
      }
    }
    while (i < leftArray.length) {
      res.add(leftArray[i]);
      i++;
    }
    while (j < rightArray.length) {
      res.add(rightArray[j]);
      j++;
    }
    return res;
  }
}

void main() {
  List<int> array = [1, 2, 5, 6, 7, 4, 3];
  MergeSort ms = MergeSort();
  print(ms.merge(array));
}
