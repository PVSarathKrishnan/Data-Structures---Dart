// class minHeap {
//   List<int> heap = [];

//   minHeap(List<int> arr) {
//     buildHeap(arr);
//   }

//   void buildHeap(List<int> arr) {
//     heap = arr;
//     for (int i = parent(heap.length - 1); i >= 0; i--) {
//       shiftDown(i);
//     }
//   }

//   void shiftDown(int currentIndex) {
//     int endIndex = heap.length - 1;
//     int leftIndex = leftChild(currentIndex);

//     while (leftIndex <= endIndex) {
//       int rightIndex = rightChild(currentIndex);
//       int indexToShift;
//       if (rightIndex <= endIndex && heap[rightIndex] < heap[leftIndex]) {
//         indexToShift = rightIndex;
//       } else {
//         indexToShift = leftIndex;
//       }

//       if (heap[currentIndex] > heap[indexToShift]) {
//         swap(heap, currentIndex, indexToShift);
//         currentIndex = indexToShift;
//         leftIndex = leftChild(currentIndex);
//       } else {
//         //heap property is satisified
//         return;
//       }
//     }
//   }

//   void shiftUp(int currentIndex) {
//     int parentIndex = parent(currentIndex);
//     while (currentIndex > 0 && heap[parentIndex] > heap[currentIndex]) {
//       swap(heap, currentIndex, parentIndex);
//       currentIndex = parentIndex;
//       parentIndex = parent(currentIndex);
//     }
//   }

//   int peek() {
//     return heap[0];
//   }

//   void remove() {
//     swap(heap, 0, heap.length - 1);
//     heap.removeLast();
//     shiftDown(0);
//   }

//   void insert(int value) {
//     heap.add(value);
//     shiftUp(heap.length - 1);
//   }

//   void swap(List<int> a, int i, int j) {
//     int temp = a[i];
//     a[i] = a[j];
//     a[j] = temp;
//   }

//   int parent(int i) => (i - 1) ~/ 2;
//   int leftChild(int i) => 2 * i + 1;
//   int rightChild(int i) => 2 * i + 2;

//   void display() {
//     print(heap);
//   }

//   List<int> heapSort(minHeap m) {
//     List<int> sorted = [];
//     while (m.heap.isNotEmpty) {
//       int min = m.peek();
//       sorted.add(min);
//       m.remove();
//     }
//     return sorted;
//   }
// }

// void main() {
//   List<int> arr = [2, 4, 6, 9, 1, 7];
//   minHeap m = minHeap(arr);
//   m.display();
//   print(m.heapSort(m));
// }

import 'dart:math';

import 'temp-minheap.dart';

class minHeap {
  List<int> heap = [];

  minHeap(List<int> arr) {
    buildHeap(arr);
  }

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

    while (currentIndex > 0 && heap[parentIndex] > heap[currentIndex]) {
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
  minHeap m = minHeap(arr);
  m.display();
  m.insert(0);
  m.display();
  m.remove();
  m.display();
  print(m.heapSort(m));
}
