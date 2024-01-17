class Node {
  Node? next;
  int? data;
  Node(int data) {
    this.data = data;
  }
}

class queue {
  Node? front;
  Node? rear;
  // enqueue
  void enqueue(int data) {
    Node newNode = Node(data);
    if (front == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  // deque
  void dequeue() {
    if (front == null) {
      print("no que");
    } else {
      front = front!.next;
      if (front == null) {
        rear = null;
      }
    }
  }

  void display() {
    if (front == null) {
      print("no que to display");
    } else {
      Node? temp = front;
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }
}

void main() {
  queue q = queue();
  q.enqueue(1);
  q.enqueue(3);
  q.enqueue(5);
  q.display();
  print("**********");
  q.dequeue();
  q.display();
}
