class minHeap {
  List<int> heap = [];

  buildHeap(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  //arrowfunctions
  parent(i) => (i - 1) ~/ 2;
  rightChild(i) => 2 * i + 2;
  leftChild(i) => 2 * i + 1;

  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  void insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }

  void remove() {
    swap(heap, 0, heap.length - 1);
    heap.removeLast();
    shiftDown(0);
  }

  // display op

  void display() {
    print(heap);
  }
  //shiftDown Op

  void shiftDown(int currentIndex) {
    int leftIndex = leftChild(currentIndex);
    int endIndex = heap.length - 1;

    while (leftIndex <= endIndex) {
      int righIndex = rightChild(currentIndex);
      int indexToShift;

      if (righIndex <= endIndex && heap[righIndex] < heap[leftIndex]) {
        indexToShift = righIndex;
      } else {
        indexToShift = leftIndex;
      }
      if (heap[indexToShift] < heap[currentIndex]) {
        swap(heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        return;
      }
    }
  }

  //peak
  int peek() {
    return heap[0];
  }

  //shiftUp
  void shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);

    while (currentIndex > 0 &&heap[currentIndex] < heap[parentIndex]  ) {
      swap(heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  List<int> heapSort(minHeap m) {
    List<int> sorted = [];
    while (m.heap.isNotEmpty) {
      int min = m.peek();
      sorted.add(min);
      m.remove();
    }
    return sorted;
  }
}

void main() {
  List<int> arr = [7, 9, 5, 1, 4, 6, 3];
  minHeap m = minHeap();
  m.buildHeap(arr);
  m.display();
  m.insert(0);
  m.display();
  m.remove();
  m.display();
  print(m.heapSort(m));
}
