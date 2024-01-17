import 'dart:ffi';

class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class stack {
  Node? top;

  //add a value to the stack - pop
  void push(int data) {
    Node newNode = Node(data);

    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  //remove the top - pop
  void pop() {
    if (top == null) {
      print("stack underflow");
    } else {
      top = top!.next;
    }
  }

  void display() {
    if (top == null) {
      print("no stack to display");
    } else {
      Node? temp = top;
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void size() {
    if (top == null) {
      print("empty stack");
    } else {
      Node? temp = top;
      int size = 0;
      while (temp != null) {
        size++;
        temp = temp.next;
      }
      print("the size of the stack is ${size}");
    }
  }
}

void main() {
  stack st = stack();
  st.display();
  st.push(10);
  st.push(20);
  st.push(200);
  st.display();
  st.size();
  st.pop();
  print("after pop");
  st.display();
  st.size();
}
