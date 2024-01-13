class Node {
  Node? prev;
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class dLinkList {
  Node? Head;
  Node? Tail;

  // functions

  void addvalues(int data) {
    Node newNode = Node(data);
    if (Head == null) {
      Head = newNode;
      Tail = newNode;
    } else {
      Tail!.next = newNode;
      newNode.prev = Tail;
      Tail = newNode;
    }
  }

  void addspec(int target, int data, String option) {
    Node newNode = Node(data);
    if (option == "after" || option == "After" || option == "AFTER") {
      if (Head == null) {
        print("No list is here bro");
        return;
      }
      if (Head!.data == target) {
        newNode.next = Head!.next;
        Head!.next = newNode;
        newNode.prev = Head;
      } else {
        Node? temp = Head;
        while (temp != null && temp.data != target) {
          temp = temp.next;
        }
        if (temp == null) {
          print("not found");
        } else {
          newNode.next = temp.next;
          newNode.prev = temp;
          temp.next = newNode;
        }
      }
    } else if (option == "before" || option == "Before" || option == "BEFORE") {
      Node newNode = Node(data);
      if (Head == null) {
        print("there is no list broooo");
        return;
      }
      if (Head == target) {
        newNode.next = Head;
        Head!.prev = newNode;
        Head = newNode;
      } else {
        Node? temp = Head;
        while (temp != null && temp.data != target) {
          temp = temp.next;
        }
        if (temp == null) {
          print("not fount udyg");
        } else {
          newNode.prev = temp.prev;
          temp.prev!.next = newNode;
          temp.prev = newNode;
          newNode.next = temp;
        }
      }
    }
  }

// Display
  void display() {
    Node? temp = Head;

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  dLinkList list = dLinkList();
  list.addvalues(50);
  list.addvalues(30);
  list.addvalues(32);
  list.addspec(30, 31, "after");
  list.addspec(31, 100, "before");
  list.display();
}
