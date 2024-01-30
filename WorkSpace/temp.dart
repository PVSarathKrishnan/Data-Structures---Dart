class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class BST {
  Node? root;

  //insertion function
  void insertion(int data) {
    Node newNode = Node(data: data);
    Node? current = root;
    while (true) {
      if (current == null) {
        current = newNode;
        return;
      } else {
        if (current.data! > data) {
          current = current.left!;
        } else if (current.data! < data) {
          current = current.right!;
        }
      }
    }
  }

  // display function
  void inOrderTraversal() {
    Node? current = root;
    while (current != null) {
      current = current.left;
      print(current!.data);
      current = current.right;
    }
  }
}

void main() {
  BST b = BST();
  b.insertion(10);
  b.insertion(20);
  b.insertion(30);
  b.inOrderTraversal();
}
