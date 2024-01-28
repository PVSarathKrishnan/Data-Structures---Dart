class minHeap {
  int parent(int i) {
    return i - 1 ~/ 2;
  }

  int leftChild(int i) {
    return 2 * i + 1;
  }

  int rightChild(int i) {
    return 2 * i + 2;
  }

  List<int> heap = [];
  minHeap(List<int> arr) {
    buildHeap(arr);
  }
  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = arr[temp];
  }

  buildHeap(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i++) {
      shiftDown(i);
    }
  }

  shiftDown(int currentIndex) {
    int leftIndex = leftChild(currentIndex);
    int endIndex = heap.length - 1;
    while (leftIndex <= endIndex) {
      int rightIndex = rightChild(currentIndex);
      int indexToShift;
      //determine which child have small value
      if (rightIndex <= endIndex && heap[rightIndex] < heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }
      if (heap[currentIndex] > heap[indexToShift]) {
        swap(heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        return;
      }
    }
  }

  void insert(int value) {
    heap.add(value);
    shiftup(value);
  }

  void shiftup(int currentIndex) {
    int parentIndex = parent(currentIndex);
    while (currentIndex > 0 && heap[parentIndex] > heap[currentIndex]) {
      swap(heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
    }
  }
}

void main() {
  List<int> arr = [2, 6, 3, 8, 2, 4, 2, 6, 4, 2, 4];
  minHeap m = minHeap(arr);
}
