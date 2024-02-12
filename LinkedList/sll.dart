//creating a singly Linked List

class Node {
  int? data;
  Node? next;
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
      temp = temp.next;
    }
  }

  //Add value :
  void addValue(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
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
      newNode.next = head;
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
      newNode.next = head;
      head = newNode;
      return;
    }

    Node? prev = null;
    Node? temp = head;
    while (temp != null && temp.data != target) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      print("Not found");
    } else {
      newNode.next = temp;
      prev!.next = newNode;
    }
  }

  //Add after a targe

  void addAft(int data, int target) {
    Node? newNode = Node(data);
    if (head == null) {
      print("empty List");
      return;
    }

    Node? temp = head;
    while (temp != null && temp.data != target) {
      temp = temp.next;
    }
    if (temp == target) {
      newNode.next = temp!.next;
      temp.next = newNode;
      if (temp == tail) {
        tail = newNode;
      }
    }
  }

  //deleteNode
  void deleteNode(int data) {
    Node? temp = head;
    Node? prev = null;
    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }

    while (temp != null) {
      if (temp.data == data) {
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev!.next = temp!.next;
  }

  //delete at begining
  void deleteBeg(int data) {
    head = head!.next;
  }

  //detetion at end
  void deleteEnd() {
    head ?? print('empty list');
    Node? temp = head;
    Node? prev = null;

    while (temp != null) {
      if (temp.data == tail!.data) {
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev!.next = null;
    tail = prev;
  }

  //delete at middle
  void deleteMiddle() {
    if (head == null || head!.next == null) {
      print("List has only 0/1 node , Can't find a middle");
    }

    Node? fast = head;
    Node? slow = head;
    Node? prev = null;
    while (fast != null && fast.next != null) {
      fast.next!.next;
      prev = slow;
      slow = slow!.next;
    }
    prev!.next = slow!.next;
  }

  // reverse the list
  void rev() {
    if (head == null || head == tail) {
      print("No need of reverse");
      return;
    }
    Node? current = head;
    Node? prev = null;
    Node? next = null;

    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    tail = head;
    head = prev;
  }
}

void main() {
  SLinkList list = SLinkList();

  list.addValue(60);
  list.addValue(6);
  list.addBeg(30);
  list.addAft(12, 6);
  list.addbef(15, 30);
  list.rev();
  list.display();
}
