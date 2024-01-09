//creating a singly Linked List

import 'dart:ffi';

class Node {
  int? data;
  Node? Next;
  Node(int data) {
    this.data = data;
  }
}

class SLinkList {
  Node? head;
  Node? tail;
  //Methods of SLL

  //display
  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.Next;
    }
  }

  //Add value :
  void addValue(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.Next = newNode;
      tail = newNode;
    }
  }

  //Add ata beginning
  void addBeg(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.Next = head;
      head = newNode;
    }
  }
}
