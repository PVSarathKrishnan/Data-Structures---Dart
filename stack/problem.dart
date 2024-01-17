class QueueUsingStacks {
  List<int> stack1 = [];
  List<int> stack2 = [];
  
  void enqueue(int item) {
    stack1.add(item);
  }

  int dequeue() {
    if (stack2.isEmpty) {
      if (stack1.isEmpty) {
        throw StateError('Cannot dequeue from an empty queue');
      }

      // Move items from stack1 to stack2
      while (stack1.isNotEmpty) {
        stack2.add(stack1.removeLast());
      }
    }

    return stack2.removeLast();
  }

  bool isEmpty() {
    return stack1.isEmpty && stack2.isEmpty;
  }
}

void main() {
  QueueUsingStacks queue = QueueUsingStacks();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);

  print(queue.dequeue()); // Outputs 1
  print(queue.dequeue()); // Outputs 2

  queue.enqueue(4);
  queue.enqueue(5);

  print(queue.dequeue()); // Outputs 3
  print(queue.dequeue()); // Outputs 4

  print(queue.isEmpty()); // Outputs false
  print(queue.dequeue()); // Outputs 5

  print(queue.isEmpty()); // Outputs true
}
