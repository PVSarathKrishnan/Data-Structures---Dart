
class MaxHeap {
  List<int> heap = [];

//build heap
  void buidHeap(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void display() {
    print(heap);
  }

  parent(i) => (i - 1) ~/ 2; //parent function

  leftChild(i) => 2 * i + 1; //left child function

  rightChild(i) => 2 * i + 2; //right child Function

  //swap function
  swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  // shift down for maxHeap
  void shiftDown(int currentIndex) {
    int endIndex = heap.length - 1;
    int leftIndex = leftChild(currentIndex);

    while (leftIndex <= endIndex) {
      int rightIndex = rightChild(currentIndex);
      int indexToShift;

      if (rightIndex <= endIndex && heap[rightIndex] > heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }

      if (heap[currentIndex] < heap[indexToShift]) {
        swap(heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        return; //already satisfied
      }
    }
  }

  //shiftUp for Max Heap
  void shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);
    while (currentIndex > 0 && heap[parentIndex] < heap[currentIndex]) {
      swap(heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  //insertion of an element
  void insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }

  void remove() {
    swap(heap, 0, heap.length - 1);
    heap.removeLast();
    shiftDown(0);
  }

  int peek() {
    return heap[0];
  }

  List<int> sorting(MaxHeap m) {
    List<int> sorted = [];
    while (m.heap.isNotEmpty) {
      int max = m.peek();
      sorted.add(max);
      m.remove();
    }
    return sorted;
  }
}

void main() {
  List<int> arr = [2, 4, 9, 6, 1, 7];
  MaxHeap m = MaxHeap();
  m.buidHeap(arr);
  m.display();
  m.insert(10);
  print("after inserion");
  m.display();

  print(m.sorting(m));
}
