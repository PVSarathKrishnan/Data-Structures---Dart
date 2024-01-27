
class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
  }
}

class Slist {
  Node? Head;
  Node? Tail;

  // functions
  void display() {
    Node? temp = Head;
    if (Head == null) {
      print("No List");
      return;
    }
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void addValues(int data) {
    Node? newNode = Node(data);
    if (Head == null) {
      Head = newNode;
      Tail = newNode;
    } else {
      Tail!.next = newNode;
      Tail = newNode;
    }
  }

  void reverse() {
    if (Head == null || Head == Tail) {
      print("no list/no sufficient");
    } else {
      Node? prev = null;
      Node? current = Head;
      Node? next = Head;
      while (current != null) {
        next = current.next;
        current.next = prev;
        prev = current;
        current = next;
      }
      Tail = Head;
      Head = prev;
    }
  }

  void addBf(int data, int target) {
    Node newNode = Node(data);
    if (Head == null) {
      print("No list Found");
      return;
    }
    if (Head!.data == target) {
      newNode.next = Head;
      Head = newNode;
    } else {
      Node? prev = null;
      Node? temp = Head;
      while (temp != null && temp.data != target) {
        prev = temp;
        temp = temp.next;
      }
      if (temp == null) {
        print("NO VALUE FOUND");
      } else {
        newNode.next = temp;
        prev!.next = newNode;
      }
    }
  }
}

void main() {
  Slist list = Slist();
  list.display();
  list.addValues(10);
  list.addValues(20);
  list.addValues(30);
  list.addValues(40);
  list.addValues(50);
  list.addValues(60);
  list.addValues(70);
  // list.reverse();
  list.addBf(5, 10);
  list.addBf(25, 30);
  list.display();
}
