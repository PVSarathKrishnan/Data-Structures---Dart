
class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class LinkedList {
  Node? head;
  Node? tail;

  //functions

  //add value

  void addVal(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
  }

  //display

  void display() {
    if (head == null) {
      print("no list");
      return;
    } else {
      Node? temp = head;
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  // convert to List
  List<int> toArray() {
    List<int> arr = [];
    Node? temp = head;
    while (temp != null) {
      arr.add(temp.data!);
      temp = temp.next;
    }
    return arr.reversed.toList();
  }

  void fromArray(List<int> array) {
    for (var i = 0; i < array.length; i++) {
      addVal(array[i]);
    }
  }
}

void main() {
  LinkedList list = LinkedList();
  list.addVal(1);
  list.addVal(2);
  list.addVal(1);
  list.display();
  LinkedList list2 = LinkedList();
  print(list2.toArray());

  print(list == list2);
}
