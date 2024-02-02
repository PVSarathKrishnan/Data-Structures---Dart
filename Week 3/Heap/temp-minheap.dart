import 'dart:ffi';

class minHeap {
  List<int> Heap = [];

  void buildHeap(List<int> arr) {
    Heap = arr;
    for (int i = parent(Heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void insert(int data) {
    Heap.add(data);
    shiftUp(Heap.length - 1);
  }

  //remove function
  void remove() {
    swap(Heap, 0, Heap.length - 1);
    Heap.removeLast();
    shiftDown(0);
  }

  //display function
  void display() {
    print(Heap);
  }

  //shiftDown
  void shiftDown(int currentIndex) {
    int leftIndex = leftChild(currentIndex);
    int endIndex = Heap.length - 1;
    while (leftIndex <= endIndex) {
      int rightIndex = rightChild(currentIndex);
      int indexToShift;
      if (rightIndex <= endIndex && Heap[rightIndex] < Heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }
      if (Heap[currentIndex] > Heap[indexToShift]) {
        swap(Heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        return; // already satisfied :
      }
    }
  }

  //shiftUp op
  void shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);
    while (currentIndex > 0 && Heap[currentIndex] < Heap[parentIndex]) {
      swap(Heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  int peek() {
    return Heap[0];
  }

  //heap sort
  List<int> heapSort() {
    List<int> sorted = [];
    while (Heap.isNotEmpty) {
      int min = peek();
      sorted.add(min);
      remove();
    }
    return sorted;
  }

  //build heap

  parent(i) => (i - 1) ~/ 2;
  leftChild(i) => (2 * i) + 1;
  rightChild(i) => (2 * i) + 2;
  swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  minHeap min = minHeap();
  List<int> arr = [1, 3, 5, 8, 9];

  min.buildHeap(arr);
  min.display();
  min.insert(7);
  min.insert(0);
  min.display();

  print(min.heapSort());
}
