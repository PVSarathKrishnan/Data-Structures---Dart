class Stack {
  List<int> stackList = [];

  // Add a value to the stack (Push)
  void push(int data) {
    stackList.add(data);
  }

  // Remove the top element from the stack (Pop)
  void pop() {
    if (isEmpty()) {
      print("Stack underflow");
    } else {
      stackList.removeLast();
    }
  }

  // Display the stack
  void display() {
    if (isEmpty()) {
      print("No stack to display");
    } else {
      for (int data in stackList.reversed) {
        print(data);
      }
    }
  }

  // Get the size of the stack
  void size() {
    print("The size of the stack is ${stackList.length}");
  }

  // Check if the stack is empty
  bool isEmpty() {
    return stackList.isEmpty;
  }
}

void main() {
  Stack stack = Stack();

  stack.display();
  stack.push(10);
  stack.push(20);
  stack.push(200);
  stack.display();
  stack.size();

  stack.pop();
  print("After pop");
  stack.display();
  stack.size();
}
