import 'minheap.dart';

class maxHeap {
  List<int> Heap = [];

  //buildheap function
  void buildHeap(List<int> arr) {
    Heap = arr;
    for (var i = parent(Heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void insert(int data) {
    Heap.add(data);
    shiftUp(Heap.length - 1);
  }

  void remove() {
    swap(Heap, 0, Heap.length - 1);
    Heap.removeLast();
    shiftDown(0);
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

  //display"
  void display() {
    print(Heap);
  }

  //shiftDown op
  void shiftDown(int currentIndex) {
    int leftIndex = leftChild(currentIndex);
    int endIndex = Heap.length - 1;

    while (leftIndex <= endIndex) {
      int rightIndex = rightChild(currentIndex);
      int indexToShift;
      if (rightIndex <= endIndex && Heap[rightIndex] > Heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }

      if (Heap[currentIndex] > Heap[indexToShift]) {
        swap(Heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        return;
      }
    }
  }

  //shift up
  void shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);
    while (currentIndex > 0 && Heap[currentIndex] > Heap[parentIndex]) {
      swap(Heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }
}

void main() {
  maxHeap max = maxHeap();
  List<int> arr = [7, 9, 5, 6, 3, 1, 4];
  max.buildHeap(arr);
  max.display();
}
