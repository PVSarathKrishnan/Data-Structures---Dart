class MinHeap {
  List<int> heap = [];

  //build heap functions
  void buildHeap(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  //insert
  void insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }

  //remove  from the peak
  void remove() {
    swap(heap, 0, heap.length - 1);
    heap.removeLast();
    shiftDown(0);
  }

  int peek() {
    return heap[0];
  }

  void display() {
    print(heap);
  }

  // supporting functions
  parent(i) => (i - 1) ~/ 2;
  leftChild(i) => (2 * i) + 1;
  rightChild(i) => (2 * i) + 2;
  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  void shiftDown(int currentIndex) {
    int leftIndex = leftChild(currentIndex);
    int endIndex = heap.length - 1;

    while (leftIndex <= endIndex) {
      int rightIndex = rightChild(currentIndex);
      int indexToShift;
      if (rightIndex <= endIndex && heap[rightIndex] < heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }
      if (heap[indexToShift] < heap[currentIndex]) {
        swap(heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        // heap propert satisfied
        return;
      }
    }
  }

  //shifup
  void shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);
    while (currentIndex > 0 && heap[parentIndex] > heap[currentIndex]) {
      swap(heap, parentIndex, currentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }
}

List<int> heapSort(List<int> arr) {
  List<int> sorted = [];
  MinHeap mh = MinHeap();
  mh.buildHeap(arr);
  while (mh.heap.isNotEmpty) {
    int min = mh.peek();
    sorted.add(min);
    mh.remove();
  }
  return sorted;
}

void main() {
  List<int> arr = [7, 6, 9, 2, 4, 10, 0, 8];
  print("og array : $arr");
  MinHeap mmm = MinHeap();
  mmm.buildHeap(arr);
  print("heaped array");
  mmm.display();
  mmm.remove();
  print("removed peak");
  mmm.display();
  mmm.insert(1);
  print("added 1");
  mmm.display();
  print("sorted:");
  print(heapSort(arr));
}
