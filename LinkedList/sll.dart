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

  // add a item before a specific point
  void addbef(int data, int target) {
    Node newNode = Node(data);
    if (head == null) {
      print("empty");
      return;
    }
    if (head!.data == target) {
      newNode.Next = head;
      head = newNode;
      return;
    }

    Node? prev = null;
    Node? temp = head;
    while (temp != null && temp.data != target) {
      prev = temp;
      temp = temp.Next;
    }
    if (temp == null) {
      print("Not found");
    } else {
      newNode.Next = temp;
      prev!.Next = newNode;
    }
  }

  //Add after a target

  void addAft(int data, int target) {
    Node? newNode = Node(data);
    if (head == null) {
      print("empty LIst");
      return;
    }

    Node? temp = head;
    while (temp != null && temp != target) {
      temp = temp.Next;
    }
    if (temp == target) {
      newNode.Next = temp!.Next;
      temp.Next = newNode;
      if (temp == tail) {
        tail = newNode;
      }
    }
  }
}
