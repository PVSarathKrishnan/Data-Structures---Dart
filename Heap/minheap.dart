class MinHeap {
  List<int> heap = [];
  minHeap(List<int> arr) {
    buildHeap(arr);
  }

  void buildHeap(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int currentIndex) {
    int endIndex = heap.length - 1;
    int leftIndex = leftChild(currentIndex);

    while (leftIndex <= endIndex) {
      //checking which element is to shifting
      int rightIndex = rightChild(currentIndex);
      int indexToShift;
      if (rightIndex < currentIndex && heap[rightIndex] < heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }
      if (heap[currentIndex] > heap[indexToShift]) {
        swap(heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {//already property satisfied
        return;
      }
    }
  }

  int parent(int i) {
    return i - 1 ~/ 2;
  }

  int leftChild(int i) {
    return 2 * i + 1;
  }

  int rightChild(int i) {
    return 2 * i + 2;
  }

  void swap(List<int> a, int i, int j) {
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
  }
}
